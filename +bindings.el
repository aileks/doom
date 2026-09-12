;;; +bindings.el -*- lexical-binding: t; -*-

(after! evil
  (setq evil-kill-on-visual-paste nil)

  (evil-define-command +evil-scroll-down-centered (count)
    "Scroll half a page down, then center the cursor line."
    (interactive "<c>")
    (evil-scroll-down count)
    (recenter))
  (evil-define-command +evil-scroll-up-centered (count)
    "Scroll half a page up, then center the cursor line."
    (interactive "<c>")
    (evil-scroll-up count)
    (recenter))

  (evil-define-motion +evil-search-next-centered (count)
    "Go to the next search match, centering the match line."
    :jump t
    (evil-ex-search-next count)
    (recenter))
  (evil-define-motion +evil-search-previous-centered (count)
    "Go to the previous search match, centering the match line."
    :jump t
    (evil-ex-search-previous count)
    (recenter)))

(map! :m "C-d" #'+evil-scroll-down-centered
      :m "C-u" #'+evil-scroll-up-centered
      :m "n" #'+evil-search-next-centered
      :m "N" #'+evil-search-previous-centered)

(defconst +todo-comment-keywords
  '("TODO" "NEXT" "WAIT" "FIXME" "BUG" "HACK" "WARN" "PERF" "NOTE" "TEST")
  "Keywords searched by `+todo/search'.")

(when (modulep! :completion vertico)
  (defun +todo/search ()
    "Search TODO-style keywords in the current project."
    (interactive)
    (+vertico/project-search
     nil
     (concat "\\b(" (string-join +todo-comment-keywords "|") ")\\b")
     (or (projectile-project-root) default-directory))))

(map! :leader :desc "Search TODO comments" "f t" #'+todo/search)

(map! :leader :desc "Project tasks" "p t" #'+tasks-menu)

(map! :leader
      :desc "Debug print variable below"     "c p v" #'+debug-print/var-below
      :desc "Debug print variable above"     "c p V" #'+debug-print/var-above
      :desc "Debug print expression below"   "c p e" #'+debug-print/expr-below
      :desc "Debug print expression above"   "c p E" #'+debug-print/expr-above
      :desc "Debug print location below"     "c p p" #'+debug-print/loc-below
      :desc "Debug print location above"     "c p P" #'+debug-print/loc-above
      :desc "Remove all debug prints"        "c p c" #'+debug-print/cleanup)
