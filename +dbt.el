;;; +dbt.el -*- lexical-binding: t; -*-
;;
;; dbt support: SQL + Jinja highlighting in a sql-mode derivative, detection
;; via dbt_project.yml (like the Neovim config's lua/config/dbt.lua +
;; syntax/dbt.vim), and sqlfluff wired for dbt buffers too - fixing the gap
;; where Neovim registered sqlfluff for `sql` only.

(require 'sql)

;;; --- Root detection -------------------------------------------------------

(defun +dbt-project-root (&optional dir)
  "Nearest directory above DIR containing dbt_project.yml, or nil."
  (locate-dominating-file (or dir default-directory) "dbt_project.yml"))

(defun +dbt-maybe-enable-h ()
  "Open .sql files inside a dbt project as `dbt-mode'."
  (unless (derived-mode-p 'dbt-mode)
    (when (+dbt-project-root)
      (dbt-mode))))

(add-hook 'sql-mode-hook #'+dbt-maybe-enable-h)

;;; --- dbt major mode -------------------------------------------------------

(define-derived-mode dbt-mode sql-mode "dbt"
  "Major mode for dbt SQL files: SQL via `sql-mode' plus Jinja highlighting.")

(defconst +dbt--jinja-functions
  (regexp-opt '("config" "env_var" "ref" "source" "var") 'words))
(defconst +dbt--jinja-keywords
  (regexp-opt '("as" "else" "endfor" "endif" "endmacro" "for" "if" "in"
                "macro" "set")
              'words))

;; Layered over sql-mode's font-lock; OVERRIDE t wins where they overlap.
(font-lock-add-keywords
 'dbt-mode
 `(("\\(?:{{\\|{%\\)[^}%]*?\\(\"[^\"]*\"\\|'[^']*'\\)" 1 font-lock-string-face t)
   ("{{\\s-*\\(?:config\\|env_var\\|ref\\|source\\|var\\)\\b" 0 font-lock-function-name-face t)
   (,(concat "{%\\s-*" +dbt--jinja-keywords) 1 font-lock-keyword-face t)
   ("{#\\(?:.\\|\n\\)*?#}" 0 font-lock-comment-face t)
   ("{{\\|}}\\|{%\\|%}\\|{#\\|#}" 0 font-lock-preprocessor-face t)))

;;; --- sqlfluff dialect/templater derived from the project -------------------

(defun +sqlfluff-dialect ()
  "Dialect declared by the surrounding project, or nil.
Checked in order: .sqlfluff, pyproject.toml [tool.sqlfluff], and the
sqlfluff block of dbt_project.yml."
  (let ((dir (locate-dominating-file
              default-directory
              (lambda (d)
                (or (file-exists-p (expand-file-name ".sqlfluff" d))
                    (file-exists-p (expand-file-name "pyproject.toml" d))
                    (file-exists-p (expand-file-name "dbt_project.yml" d)))))))
    (when dir
      (or (+sqlfluff--config-value (expand-file-name ".sqlfluff" dir)
                                   "^dialect\\s*=\\s*\\([A-Za-z0-9_]+\\)")
          (+sqlfluff--config-value (expand-file-name "pyproject.toml" dir)
                                   "^dialect\\s*=\\s*\"?\\([A-Za-z0-9_]+\\)\"?")
          (+sqlfluff--config-value (expand-file-name "dbt_project.yml" dir)
                                   "^\\s-*dialect:\\s*\\([A-Za-z0-9_]+\\)")))))

(defun +sqlfluff--config-value (file regexp)
  "First capture group match of REGEXP in FILE, or nil."
  (when (and file (file-exists-p file))
    (with-temp-buffer
      (insert-file-contents file)
      (save-excursion
        (when (re-search-backward regexp nil t)
          (match-string-no-properties 1))))))

(defun +sqlfluff-templater ()
  "Jinja templater inside dbt projects (sqlfluff's own default elsewhere)."
  (when (+dbt-project-root) "jinja"))

;;; --- Formatter and diagnostics ----------------------------------------------

(after! (flycheck apheleia)
  ;; Register dbt-mode with flycheck's sqlfluff checker (it only lists
  ;; sql-mode by default) and map dbt buffers onto our formatter.
  (flycheck-add-mode 'sql-sqlfluff 'dbt-mode))

(set-formatter! 'sqlfluff
  '("sqlfluff" "fix" "--quiet"
    ("--dialect=%S" (+sqlfluff-dialect))
    ("--templater=%S" (+sqlfluff-templater))
    "-")
  :modes '(sql-mode dbt-mode))
