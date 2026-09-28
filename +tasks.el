;;; +tasks.el -*- lexical-binding: t; -*-

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

(defun +tasks--cmake-root ()
  "Prefer the project root's CMakeLists.txt over nested build definitions."
  (let ((root (projectile-project-root
               (if buffer-file-name
                   (file-name-directory buffer-file-name)
                 default-directory))))
    (or (and root (file-exists-p (expand-file-name "CMakeLists.txt" root)) root)
        (+tasks--root "CMakeLists.txt")
        (user-error "Not inside a CMake project (no CMakeLists.txt)"))))

(defun +tasks-cmake-configure ()
  (interactive)
  (let ((root (+tasks--cmake-root)))
    (+tasks--run root
                 "cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON")))

(defun +tasks-cmake-build ()
  (interactive)
  (let ((root (+tasks--cmake-root)))
    (+tasks--run root "cmake --build build")))

(defun +tasks-shell (command)
  "Run an arbitrary shell COMMAND at the project root (or cwd)."
  (interactive "sShell command: ")
  (+tasks--run (or (projectile-project-root) default-directory) command))

(transient-define-prefix +tasks-menu ()
  "Project tasks."
  [["CMake"
    ("n" "cmake configure" +tasks-cmake-configure)
    ("m" "cmake build"     +tasks-cmake-build)]
   ["Other"
    ("s" "shell command at root" +tasks-shell)
    ("g" "recompile last task"   recompile)]])
