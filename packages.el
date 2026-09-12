;;; packages.el -*- lexical-binding: t; -*-
;;
;; Extra packages beyond what the enabled Doom modules manage.
;; Doom's own pins are kept untouched; these two small libraries track
;; upstream releases deliberately (nothing here needs pinning yet).

;; JSON/YAML schema catalog, wired into lsp-mode in +lang-extras.el.
;; Equivalent of SchemaStore.nvim in the Neovim config.
(package! schemastore)
