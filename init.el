;;; init.el -*- lexical-binding: t; -*-

(setq evil-respect-visual-line-mode t)

(doom!
 :completion
 (corfu +orderless +icons)
 vertico

 :ui
 doom
 dashboard
 doom-quit
 hl-todo
 indent-guides
 modeline
 nav-flash
 ophints
 (popup +defaults)
 (vc-gutter +pretty)
 vi-tilde-fringe
 window-select
 ligatures
 zen

 :editor
 (evil +everywhere)
 (format +onsave +lsp)
 file-templates
 fold
 multiple-cursors
 snippets
 word-wrap

 :emacs
 (dired +icons)
 electric
 ibuffer
 tramp
 undo
 vc

 :term
 vterm

 :checkers
 syntax

 :tools
 (eval +overlay)
 (debugger +lsp)
 (lsp +peek)
 editorconfig
 lookup
 magit
 tree-sitter
 direnv

 :lang
 emacs-lisp
 markdown
 web
 (javascript +lsp +tree-sitter)
 (ess +lsp)
 (julia +lsp +tree-sitter)
 (cc +lsp +tree-sitter)
 (json +lsp +tree-sitter)
 (lua +lsp +tree-sitter)
 (org +pretty)
 (python +lsp +pyright +tree-sitter +uv)
 (sh +lsp)
 (yaml +lsp +tree-sitter)
 (haskell +tree-sitter)

 :config
 (default +bindings +smartparens))
