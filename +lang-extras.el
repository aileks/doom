;;; +lang-extras.el -*- lexical-binding: t; -*-
;;
;; Per-language settings ported from the Neovim LSP/formatting config:
;; indentation rules, clangd, LuaLS for Neovim work, basedpyright as the
;; single Python type server, ruff lint chained with LSP diagnostics, and
;; explicit formatter assignments for apheleia (:editor format).

;;; --- Indentation: 2-space fallback, 4 for py/sql/c/c++/zig ----------------
(setq-default tab-width 2
              indent-tabs-mode nil)

;; 4-space languages, legacy and native tree-sitter modes. Native python,
;; zig and c-ts modes already default to offset 4; cc-mode needs the offset.
(add-hook! '(python-mode-hook python-ts-mode-hook
            c-mode-hook c-ts-mode-hook c++-mode-hook c++-ts-mode-hook
            cuda-mode-hook cuda-ts-mode-hook
            sql-mode-hook zig-mode-hook)
  (setq-local tab-width 4))

(add-hook 'c-mode-common-hook
          (defun +lang-extras--c-indent-h ()
            (setq-local c-basic-offset 4)))

;;; --- clangd -----------------------------------------------------------------
;; Args ported from the Neovim config minus --fallback-style: clangd's
;; ancestor discovery already finds project .clang-format files, and
;; ~/.clang-format covers everything under $HOME.
(after! lsp-clangd
  (setq lsp-clients-clangd-args
        '("--background-index" "--clang-tidy" "--completion-style=detailed")))

;;; --- Python ------------------------------------------------------------------
;; lsp-pyright drives both pyright and basedpyright; pointed at the
;; basedpyright binary it becomes the single Python type server. Must be set
;; before lsp-pyright loads (no python buffer is open this early).
;; "standard" type checking is the client default; import organization is
;; owned by the ruff formatter chain below, not the server.
(setq lsp-pyright-langserver-command "basedpyright"
      lsp-pyright-disable-organize-imports t)

;; Chain ruff lint after the LSP checker: flycheck runs one checker at a
;; time, so lsp (basedpyright) + python-ruff report together.
(after! (flycheck lsp-mode)
  (defun +lang-extras--chain-ruff-h ()
    (when (and lsp--buffer-workspaces
               (derived-mode-p 'python-mode 'python-ts-mode))
      (flycheck-add-next-checker 'lsp 'python-ruff)))
  (add-hook 'lsp-managed-mode-hook #'+lang-extras--chain-ruff-h))

;;; --- LuaLS sees LuaJIT + Neovim globals (nvim config dev) ---------------------
(after! lsp-lua
  (setq lsp-lua-runtime-version "LuaJIT"
        lsp-lua-diagnostics-globals ["vim"]))

;;; --- Formatters (explicit tools, precedence ported from conform.nvim) ---------
;; c/c++/cuda (clang-format), lua (stylua), zig (zig fmt) and json/yaml
;; (prettier) already map to the right tools in apheleia's defaults; only
;; assignments that differ are declared here.

;; Python: ruff organize-imports then format, using apheleia's own
;; filename-aware ruff/ruff-isort definitions (mode default is black).
(after! apheleia
  (setf (alist-get 'python-mode apheleia-mode-alist) '(ruff-isort ruff)
        (alist-get 'python-ts-mode apheleia-mode-alist) '(ruff-isort ruff)))

;; apheleia doesn't format markdown by default; nvim ran prettier on it.
(set-formatter! 'prettier :modes '(markdown-mode gfm-mode))

;; cuda modes are missing from apheleia's default mode alist.
(set-formatter! 'clang-format :modes '(cuda-mode cuda-ts-mode))

;; Shell: exact flags from the Neovim config; they deliberately override
;; EditorConfig-driven indent settings, filename context kept for the rest.
(set-formatter! 'shfmt
  '("shfmt" "-i" "2" "-ci" "-bn" "-filename" filepath "-")
  :modes '(sh-mode bash-ts-mode))
