;;; +bindings.el -*- lexical-binding: t; -*-

(map! :m "n" #'+evil-search-next-centered
      :m "N" #'+evil-search-previous-centered)
(map! :leader :desc "Search TODO comments" "f t" #'+todo/search)
(map! :leader :desc "Project tasks" "p t" #'+tasks-menu)
(map! :n "g RET" #'newline)
(after! ess
  (map! :map ess-mode-map
        "M--" #'ess-insert-assign
        :map inferior-ess-mode-map
        "M--" #'ess-insert-assign))
(after! r-ts-mode
  (map! :map r-ts-mode-map
        "M--" #'ess-insert-assign))
