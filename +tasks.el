;;; +tasks.el -*- lexical-binding: t; -*-
;;
;; Project tasks (overseer.nvim replacement). One-shot commands run
;; asynchronously in compile buffers, restartable with `recompile'
;; (SPC c C or g in the compile buffer).
;; Roots are found from the current file's directory, so nested projects
;; (a dbt project inside a bigger repo) are found even when the git root is
;; above them. User-provided arguments are shell-quoted; everything else is
;; fixed text. Menu: SPC p t (bound in +bindings.el).

(require 'transient)

(defun +tasks--root (marker)
  "Nearest directory above the current file containing MARKER, or nil."
  (locate-dominating-file
   (if buffer-file-name
       (file-name-directory buffer-file-name)
     default-directory)
   marker))

(defun +tasks--run (dir command)
  "Run COMMAND asynchronously in a compile buffer rooted at DIR (or cwd)."
  (let ((default-directory (or dir default-directory)))
    (compile command)))

;;; --- dbt -----------------------------------------------------------------

(defun +tasks--read-select ()
  "Optional dbt --select argument, or nil."
  (let ((sel (read-string "dbt --select (empty to skip): ")))
    (unless (string-empty-p sel) sel)))

(defun +tasks-dbt (command &optional select)
  "Run `uv run dbt COMMAND` at the dbt_project.yml root.
SELECT, when non-nil, appends `--select SELECT' (shell-quoted)."
  (interactive
   (let ((cmd (completing-read "dbt command: "
                               '("build" "run" "test" "compile")
                               nil :require-match)))
     (list cmd (+tasks--read-select))))
  (unless (member command '("build" "run" "test" "compile"))
    (user-error "Unknown dbt command: %s" command))
  (let ((root (+tasks--root "dbt_project.yml")))
    (unless root (user-error "Not inside a dbt project (no dbt_project.yml)"))
    (+tasks--run
     root
     (string-join
      (append '("uv" "run" "dbt") (list command)
              (when select (list "--select" (shell-quote-argument select))))
      " "))))

;;; --- Zig -------------------------------------------------------------------

(defun +tasks-zig-build ()
  (interactive)
  (let ((root (+tasks--root "build.zig")))
    (unless root (user-error "Not inside a Zig project (no build.zig)"))
    (+tasks--run root "zig build")))

(defun +tasks-zig-test ()
  (interactive)
  (let ((root (+tasks--root "build.zig")))
    (unless root (user-error "Not inside a Zig project (no build.zig)"))
    (+tasks--run root "zig build test")))

;;; --- CMake -------------------------------------------------------------------

(defun +tasks-cmake-configure ()
  (interactive)
  (let ((root (+tasks--root "CMakeLists.txt")))
    (unless root (user-error "Not inside a CMake project (no CMakeLists.txt)"))
    ;; Exporting the compile DB lets clangd pick it up out of build/.
    (+tasks--run root
                 "cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON")))

(defun +tasks-cmake-build ()
  (interactive)
  (let ((root (+tasks--root "CMakeLists.txt")))
    (unless root (user-error "Not inside a CMake project (no CMakeLists.txt)"))
    (+tasks--run root "cmake --build build")))

;;; --- Arbitrary shell task ------------------------------------------------------

(defun +tasks-shell (command)
  "Run an arbitrary shell COMMAND at the project root (or cwd)."
  (interactive "sShell command: ")
  (+tasks--run (or (projectile-project-root) default-directory) command))

;;; --- Menu ----------------------------------------------------------------------

(transient-define-prefix +tasks-menu ()
  "Project tasks."
  [["dbt (uv run)"
    ("b" "dbt build"    (lambda () (interactive) (+tasks-dbt "build" (+tasks--read-select))))
    ("r" "dbt run"      (lambda () (interactive) (+tasks-dbt "run" (+tasks--read-select))))
    ("t" "dbt test"     (lambda () (interactive) (+tasks-dbt "test" (+tasks--read-select))))
    ("c" "dbt compile"  (lambda () (interactive) (+tasks-dbt "compile" (+tasks--read-select))))]
   ["Zig"
    ("B" "zig build"      +tasks-zig-build)
    ("T" "zig build test" +tasks-zig-test)]
   ["CMake"
    ("n" "cmake configure" +tasks-cmake-configure)
    ("m" "cmake build"     +tasks-cmake-build)]
   ["Other"
    ("s" "shell command at root" +tasks-shell)
    ("g" "recompile last task"   recompile)]])
