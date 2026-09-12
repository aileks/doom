;;; +sql.el -*- lexical-binding: t; -*-
;;
;; SQL workflows: sql-mode against the local PostgreSQL convention, sqls LSP
;; for completion/schema info, sqlfluff diagnostics and formatting.
;; dbt-specific highlighting lives in +dbt.el. CSV/TSV come from Doom's
;; :lang data module (csv-mode).

;; Local convention (was vim.g.dbs local-postgres in Neovim):
;; 127.0.0.1:5432, OS username as both user and database, trust auth.
;; Connections are user-invoked (M-x sql-postgres).
(setq sql-product 'postgres
      sql-server "127.0.0.1"
      sql-port 5432
      sql-user (user-login-name)
      sql-database (user-login-name))

;; sqls language server. The connection config lives outside Git at
;; ~/.config/sqls/config.yml (no secrets here - trust auth on localhost).
(add-hook 'sql-mode-local-vars-hook #'lsp! 'append)
(after! lsp-sqls
  (setq lsp-sqls-workspace-config-path "workspace"))

;;; --- sqlfluff diagnostics ------------------------------------------------
;; Not shipped by Doom's pinned flycheck, so defined here. Dialect and
;; templater come from sqlfluff's own config discovery, rooted at the
;; buffer's file through --stdin-filename.
(after! flycheck
  (flycheck-define-checker sql-sqlfluff
    "SQL style and syntax checker using the sqlfluff CLI."
    :command ("sqlfluff" "lint" "--format" "json"
              "--stdin-filename" (eval (or (buffer-file-name) "scratch.sql"))
              "-")
    :standard-input t
    :error-parser
    (lambda (output _checker _buffer)
      (let (errors)
        (dolist (report (condition-case nil
                            (json-parse-string output :object-type 'plist)
                          (error nil))
                        (nreverse errors))
          (dolist (violation (plist-get report :violations))
            (let ((warning (plist-get violation :warning)))
              (push (flycheck-error-new-at
                     (plist-get violation :start_line_no)
                     (plist-get violation :start_line_pos)
                     (if (eq warning :json-false) 'error 'warning)
                     (format "%s %s"
                             (plist-get violation :code)
                             (plist-get violation :description)))
                    errors))))))
    :modes sql-mode)
  (add-to-list 'flycheck-checkers 'sql-sqlfluff))

;; With sqls running, chain sqlfluff after the LSP checker (same pattern as
;; python-ruff in +lang-extras.el).
(after! (flycheck lsp-mode)
  (defun +sql--chain-sqlfluff-h ()
    (when (and lsp--buffer-workspaces (derived-mode-p 'sql-mode))
      (flycheck-add-next-checker 'lsp 'sql-sqlfluff)))
  (add-hook 'lsp-managed-mode-hook #'+sql--chain-sqlfluff-h))

;;; --- sqlfluff formatting ---------------------------------------------------
;; sqlfluff fix over stdin; config discovery as above. Overrides apheleia's
;; sql-mode default (pgformatter) and lifts Doom's sql format-on-save
;; exclusion (added upstream for the broken sqlformat tool, not sqlfluff).
(set-formatter! 'sqlfluff
  '("sqlfluff" "fix" "--quiet" "--stdin-filename" filepath "-")
  :modes '(sql-mode))
(setq +format-on-save-disabled-modes
      (delq 'sql-mode +format-on-save-disabled-modes))
