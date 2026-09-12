;;; +lang-extras.el -*- lexical-binding: t; -*-
;;
;; Per-language settings ported from the Neovim LSP/formatting config:
;; indentation rules, clangd, LuaLS for Neovim work, basedpyright+ruff
;; (no competing servers, no duplicate diagnostics), SchemaStore schemas,
;; and the explicit per-tool formatters for apheleia (:editor format).

;;; --- Indentation: 2-space fallback, 4 for py/sql/dbt/c/c++/zig ------------
(setq-default tab-width 2
              indent-tabs-mode nil)

(add-hook! '(c-mode-hook c++-mode-hook cuda-mode-hook
            python-mode-hook python-ts-mode-hook
            sql-mode-hook zig-mode-hook)
  (setq-local tab-width 4))

(add-hook 'c-mode-common-hook
          (defun +lang-extras--c-indent-h ()
            (setq-local c-basic-offset 4)))

;;; --- clangd (args and fallback style ported verbatim) ----------------------
(after! lsp-clangd
  (setq lsp-clients-clangd-args
        '("--background-index" "--clang-tidy" "--completion-style=detailed"
          "--fallback-style=file:/home/aileks/.clang-format")))

;;; --- LSP housekeeping --------------------------------------------------------
(after! lsp-mode
  ;; Code lens, inlay hints, winbar breadcrumbs (dropbar.nvim equivalent).
  (setq lsp-lens-enable t
        lsp-headerline-breadcrumb-enable t)
  (add-hook 'lsp-mode-hook #'lsp-inlay-hints-mode)

  ;; One type-checking framework per buffer: basedpyright owns Python
  ;; intelligence (standard mode), ruff is never an LSP here (lint comes
  ;; from flycheck + sqlfluff, formatting from apheleia). pyright stays
  ;; off even if it ever lands on PATH.
  (setq lsp-disabled-clients '(ruff ruff-lsp pyright))
  (lsp-register-custom-settings
   '(("basedpyright.analysis.typeCheckingMode" "standard"))))

;;; --- Ruff lint (style diagnostics) on top of basedpyright -------------------
(after! flycheck
  (when (flycheck-checker-get 'python-ruff 'command)
    (setq-hook! '(python-mode-hook python-ts-mode-hook)
                flycheck-python-ruff-executable "ruff"
                flycheck-checker 'python-ruff)))

;;; --- LuaLS sees LuaJIT + Neovim globals (nvim config dev) --------------------
(after! lsp-mode
  (lsp-register-custom-settings
   '(("Lua.runtime.version" "LuaJIT")
     ("Lua.diagnostics.globals" ["vim"])
     ("Lua.workspace.checkThirdParty" false))))

;;; --- JSON/YAML schemas (SchemaStore.nvim equivalent) --------------------------
(after! (lsp-mode schemastore)
  (add-hook 'json-mode-hook
            (defun +lang-extras--json-schemas-h ()
              (setq-local lsp-json-schemas (schemastore-json))))
  (add-hook 'yaml-mode-hook
            (defun +lang-extras--yaml-schemas-h ()
              (setq-local lsp-yaml-schemas (schemastore-yaml)))))

;;; --- Formatters (explicit tools, precedence ported from conform.nvim) -------

;; Python: ruff organize imports THEN format, in one pass. Never black.
(set-formatter! 'ruff
  '("bash" "-c" "ruff check --select=I --fix --quiet - | ruff format --quiet -")
  :modes '(python-mode python-ts-mode))

;; C/C++/CUDA: project .clang-format when present (clang-format discovers it
;; via --assume-filename), else the global ~/.clang-format fallback.
(defun +lang-extras--clang-format-project-p ()
  (and buffer-file-name
       (locate-dominating-file
        (file-name-directory buffer-file-name)
        (lambda (d)
          (or (file-exists-p (expand-file-name ".clang-format" d))
              (file-exists-p (expand-file-name "_clang-format" d)))))))

(set-formatter! 'clang-format
  '("clang-format"
    ("-assume-filename=%S" (or buffer-file-name mode-result ""))
    ("-style=file:%S" (unless (+lang-extras--clang-format-project-p)
                        "/home/aileks/.clang-format")))
  :modes '((c-mode ".c")
           (c++-mode ".cpp")
           (cuda-mode ".cu")
           (cuda-ts-mode ".cu")
           (objc-mode ".m")))

;; JSON/YAML/Markdown: prettier (pnpm global, on PATH).
(set-formatter! 'prettier :modes '(json-mode json-ts-mode
                                   yaml-mode yaml-ts-mode
                                   markdown-mode gfm-mode))

;; Shell: shfmt with the exact flags from the Neovim config.
(set-formatter! 'shfmt '("shfmt" "-i" "2" "-ci" "-bn") :modes '(sh-mode))

;; Lua: stylua (project stylua.toml discovered from CWD).
(set-formatter! 'stylua '("stylua" "-") :modes '(lua-mode lua-ts-mode))

;; Zig: zig fmt through stdin.
(set-formatter! 'zig-fmt '("zig" "fmt" "--stdin") :modes '(zig-mode))
