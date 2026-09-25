;;; +bindings.el -*- lexical-binding: t; -*-

(map! :m "C-d" #'+evil-scroll-down-centered
      :m "C-u" #'+evil-scroll-up-centered
      :m "n" #'+evil-search-next-centered
      :m "N" #'+evil-search-previous-centered)

(map! :leader :desc "Search TODO comments" "f t" #'+todo/search)

(map! :leader :desc "Project tasks" "p t" #'+tasks-menu)

(map! :n "g RET" #'newline)
