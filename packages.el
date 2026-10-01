;;; packages.el -*- lexical-binding: t; -*-

(package! r-ts-mode)
(package! dap-mode)
(package! lsp-treemacs) 
(package! lsp-julia
  :recipe (:host github
           :repo "non-Jedi/lsp-julia"
           :files ("*.el" "languageserver")))

