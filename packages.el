;;; packages.el -*- lexical-binding: t; -*-

(package! lsp-java)
(package! dap-mode)
(package! lsp-treemacs) 
(package! cinder-grove
  :recipe (:host github :repo "aileks/cinder-grove.el"))
(package! cinder-muted
  :recipe (:host github :repo "aileks/cinder-muted"
           :files ("emacs/cinder-muted-theme.el")))
