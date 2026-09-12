;;; init.el -*- lexical-binding: t; -*-
;;
;; Doom Emacs private config (DOOMDIR) for aileks.
;; Ported from nvim-config @ 4e435e831fde1ee3b1f78cb8211d9822efe3eaf6.
;; Run `doom sync` after editing this file.

;; Must be set before the :editor evil module loads its window/wrap setup.
(defvar evil-respect-visual-line-mode t)

(doom!
 :completion
 (corfu +orderless +icons) ; in-buffer completion, Tab/RET like blink.cmp super-tab
 vertico                   ; minibuffer picker (fzf-lua replacement)

 :ui
 doom                      ; doom-themes/solaire machinery
 dashboard                 ; startup screen (alpha-nvim replacement)
 doom-quit                 ; confirm on quit (nvim `confirm = true`)
 hl-todo                   ; TODO/FIXME comment highlighting (todo-comments.nvim)
 indent-guides             ; indent-blankline.nvim
 modeline                  ; lualine.nvim
 nav-flash                 ; pulse the line after big jumps (glance.nvim feel)
 ophints                   ; highlight what an operation acted on
 (popup +defaults)         ; tame transient windows
 (vc-gutter +pretty)       ; gitsigns.nvim
 vi-tilde-fringe
 window-select             ; avy-style window jumping
 workspaces                ; per-project workspaces + session persistence

 :editor
 (evil +everywhere)        ; vim motions
 file-templates
 fold                      ; folding (za/zo, org TAB)
 (format +onsave)          ; apheleia: explicit tools on save (conform.nvim)
 multiple-cursors          ; evil-multiedit (refactoring.nvim's rename-ish niche)
 snippets                  ; yasnippet + friendly-snippets
 word-wrap                 ; language-aware soft wrap (nvim linebreak)

 :emacs
 (dired +icons)            ; oil.nvim replacement (wdired = editable browsing)
 electric
 ibuffer
 tramp
 undo                      ; undo-fu + persistent undo sessions
 vc

 :term
 vterm                     ; floating terminal (nvim C-/ terminal)

 :checkers
 syntax                    ; flycheck diagnostics (restrained, no inline noise)

 :tools
 debugger                  ; dape: debugpy + lldb-dap (nvim-dap replacement)
 editorconfig
 (eval +overlay)           ; REPLs and inline eval
 lookup                    ; xref-backed definitions/references/docs
 lsp                       ; lsp-mode (nvim LSP replacement)
 magit                     ; git porcelain (gitsigns + blame + diffs)
 tree-sitter               ; native treesit grammars

 :lang
 data                      ; csv/tsv (csvview.nvim)
 emacs-lisp
 (cc +lsp +tree-sitter)    ; c/c++/objc/cuda via clangd
 (json +lsp +tree-sitter)
 (lua +lsp +tree-sitter)   ; LuaLS w/ LuaJIT + nvim globals, stylua
 markdown                  ; markview.nvim closest supported stand-in
 org                       ; the main event
 (python +lsp +pyright +tree-sitter +uv) ; basedpyright (via lsp-pyright) + ruff, uv venvs
 sh                        ; shfmt + shellcheck (no bash LSP, like nvim)
 (yaml +lsp +tree-sitter)
 (zig +lsp +tree-sitter)   ; zls + zig fmt

 :config
 (default +bindings +smartparens)) ; evil bindings + autopairs (nvim-autopairs)
