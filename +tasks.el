;;; +tasks.el -*- lexical-binding: t; -*-
;;
;; Project tasks (overseer.nvim replacement). One-shot commands run
;; asynchronously in compile buffers, rooted at the correct project marker,
;; restartable with `recompile' (SPC c C or g in the compile buffer).
;; User-provided arguments are shell-quoted; everything else is fixed text.
;; Menu: SPC p t (bound in +bindings.el).

(require 'transient)

(defun +tasks--root (marker)
  "Nearest directory above the current project containing MARKER, or nil."
  (locate-dominating-file (or (projectile-project-root) default-directory)
                          marker))

(defun +tasks--run (dir command)
  "Run shell COMMAND asynchronously in a compile buffer rooted at DIR."
  (let ((default-directory (or dir (projectile-project-root))))
    (compile command t)))

;;; --- dbt -----------------------------------------------------------------

(defun +tasks-dbt (command &optional select)
  "Run `uv run dbt COMMAND` at the dbt_project.yml root, with optional --select."
  (interactive
   (let ((sel (read-string "dbt --select (empty to skip): ")))
     (list (completing-read "dbt command: " '("build" "run" "test" "compile"))
           (unless (string-empty-p sel) sel))))
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
  "Run an arbitrary shell COMMAND at the project root."
  (interactive "sShell command: ")
  (+tasks--run (projectile-project-root) command))

;;; --- Menu ----------------------------------------------------------------------

(transient-define-prefix +tasks-menu ()
  "Project tasks."
  [["dbt (uv run)"
    ("b" "dbt build"    (lambda () (interactive) (+tasks-dbt "build")))
    ("r" "dbt run"      (lambda () (interactive) (+tasks-dbt "run")))
    ("t" "dbt test"     (lambda () (interactive) (+tasks-dbt "test")))
    ("c" "dbt compile"  (lambda () (interactive) (+tasks-dbt "compile")))]
   ["Zig"
    ("B" "zig build"      #'+tasks-zig-build)
    ("T" "zig build test" #'+tasks-zig-test)]
   ["CMake"
    ("n" "cmake configure" #'+tasks-cmake-configure)
    ("m" "cmake build"     #'+tasks-cmake-build)]
   ["Other"
    ("s" "shell command at root" #'+tasks-shell)
    ("g" "recompile last task"   #'recompile)]])
