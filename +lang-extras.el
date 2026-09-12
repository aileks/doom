;;; +lang-extras.el -*- lexical-binding: t; -*-

(setq-default tab-width 2
              indent-tabs-mode nil)

(add-hook! '(python-mode-hook python-ts-mode-hook
            c-mode-hook c-ts-mode-hook c++-mode-hook c++-ts-mode-hook
            cuda-mode-hook cuda-ts-mode-hook
            sql-mode-hook zig-mode-hook)
  (setq-local tab-width 4))

(add-hook 'c-mode-common-hook
          (defun +lang-extras--c-indent-h ()
            (setq-local c-basic-offset 4)))

(after! lsp-clangd
  (setq lsp-clients-clangd-args
        '("--background-index" "--clang-tidy" "--completion-style=detailed")))

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

(set-formatter! 'clang-format :modes '(cuda-mode cuda-ts-mode))

(set-formatter! 'shfmt
  '("shfmt" "-i" "2" "-ci" "-bn" "-filename" filepath "-")
  :modes '(sh-mode bash-ts-mode))
