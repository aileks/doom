;;; +sql.el -*- lexical-binding: t; -*-
;;
;; SQL workflows: sql-mode against the local PostgreSQL convention, sqls LSP
;; for completion/schema info, sqlfluff diagnostics. dbt specifics live in
;; +dbt.el. CSV/TSV come from Doom's :lang data module (csv-mode).

;; Local convention (was vim.g.dbs local-postgres in Neovim):
;; 127.0.0.1:5432, OS username as both user and database, trust auth.
;; Connections are user-invoked (M-x sql-postgres / SPC-o-style menus).
(setq sql-product 'postgres
      sql-server "127.0.0.1"
      sql-port 5432
      sql-user (user-login-name)
      sql-database (user-login-name))

;; TSV alongside CSV in csv-mode (Doom :lang data).
(after! csv-mode (setq csv-separators '("," "\t")))

;; sqls language server. The connection config lives outside Git at
;; ~/.config/sqls/config.yml (no secrets here - trust auth on localhost).
(add-hook 'sql-mode-local-vars-hook #'lsp! 'append)
(after! lsp-mode
  (setq lsp-sqls-workspace-config-path nil))

;; sqlfluff as the SQL diagnostic checker (fix on save comes from +dbt.el).
(setq-hook! 'sql-mode-hook flycheck-checker 'sql-sqlfluff)
