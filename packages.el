;;; packages.el -*- lexical-binding: t; -*-

(package! lsp-java)
(package! dap-mode)
(package! lsp-treemacs) 
(package! cinder-grove
  :recipe (:host github :repo "aileks/cinder-grove.el")
  :pin "d7555f75e3304f614ca40c5d9791824fcb036986")
(package! cinder-muted
  :recipe (:host github :repo "aileks/cinder-muted"
           :files ("emacs/cinder-muted-theme.el")))
