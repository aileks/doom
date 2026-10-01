;;; packages.el -*- lexical-binding: t; -*-

(package! dap-mode)
(package! lsp-treemacs) 
(package! r-ts-mode)
(package! lsp-julia
  :recipe (:host github
           :repo "non-Jedi/lsp-julia"
           :files ("*.el" "languageserver")))

