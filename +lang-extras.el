;;; +lang-extras.el -*- lexical-binding: t; -*-

(setq-default tab-width 2
              indent-tabs-mode nil)

(add-hook! '(python-mode-hook python-ts-mode-hook
             c-mode-hook c-ts-mode-hook c++-mode-hook c++-ts-mode-hook)
  (setq-local tab-width 4))

(add-hook 'c-mode-common-hook
          (defun +lang-extras--c-indent-h ()
            (setq-local c-basic-offset 4)))

(setq-hook! '(c-ts-mode-hook c++-ts-mode-hook)
  c-ts-mode-indent-offset 4)

(after! lsp-clangd
  (dolist (argument '("--background-index" "--clang-tidy" "--completion-style=detailed"))
    (cl-pushnew argument lsp-clients-clangd-args :test #'equal)))

(setq lsp-pyright-langserver-command "basedpyright"
      lsp-pyright-disable-organize-imports t)

(after! (flycheck lsp-mode)
  (defun +lang-extras--chain-ruff-h ()
    (when (and lsp--buffer-workspaces
               (derived-mode-p 'python-mode 'python-ts-mode))
      (flycheck-add-next-checker 'lsp 'python-ruff)))
  (add-hook 'lsp-managed-mode-hook #'+lang-extras--chain-ruff-h))

(after! lsp-lua
  (setq lsp-lua-runtime-version "LuaJIT"
        lsp-lua-diagnostics-globals ["vim"]))

(after! apheleia
  (setf (alist-get 'python-mode apheleia-mode-alist) '(ruff-isort ruff)
        (alist-get 'python-ts-mode apheleia-mode-alist) '(ruff-isort ruff)))

(set-formatter! 'prettier :modes '(markdown-mode gfm-mode))

(set-formatter! 'shfmt
  '("shfmt" "-filename" filepath
    ;; Any printer flags disable shfmt's EditorConfig support.
    (unless (locate-dominating-file default-directory ".editorconfig")
      '("-i" "2" "-ci" "-bn"))
    "-")
  :modes '(sh-mode bash-ts-mode))

(after! lsp-semantic-tokens
  ;; Keep LSP modifiers from recoloring the shared syntax faces.
  (setq-default lsp-semantic-token-modifier-faces
                '(("declaration" . lsp-face-semhl-declaration)
                  ("definition" . lsp-face-semhl-definition)
                  ("implementation" . lsp-face-semhl-implementation)
                  ("deprecated" . lsp-face-semhl-deprecated))))

(after! r-ts-mode
  (defun +lang-extras--r-font-lock-h ()
    ;; R captures bindings but needs a fallback for ordinary identifier uses.
    (setq-local treesit-font-lock-settings
                (append
                 r-ts-mode-settings
                 (treesit-font-lock-rules
                  :language 'r :feature 'variable :override nil
                  '((identifier) @font-lock-variable-use-face))))
    (treesit-font-lock-recompute-features)
    (font-lock-flush))
  (add-hook 'r-ts-mode-hook #'+lang-extras--r-font-lock-h))
