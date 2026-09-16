;;; +org.el -*- lexical-binding: t; -*-

(after! org
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "WAIT(w)" "|" "DONE(d)" "CANCELLED(c)"))
        org-todo-keyword-faces
        '(("NEXT" . +org-todo-active)
          ("WAIT" . +org-todo-onhold)
          ("CANCELLED" . +org-todo-cancel)))

  (setq org-log-done 'time
        org-log-repeat 'time
        org-log-into-drawer t)

  (setq org-agenda-custom-commands
        '(("n" "Next actions" todo "NEXT")
          ("w" "Waiting on" todo "WAIT")
          ("o" "Open tasks" tags-todo "")
          ("a" "Agenda and all TODOs"
           ((agenda "")
            (alltodo "")))))

  (setq org-capture-templates
        '(("t" "Task" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* TODO %?\n  %U %a")
          ("i" "Inbox" entry
           (file+headline "inbox.org" "Inbox")
           "* %?\n  %U")
          ("n" "Note" entry
           (file+headline +org-capture-notes-file "Notes")
           "* %?\n  %U")
          ("j" "Daily log" entry
           (file+datetree +org-capture-journal-file)
           "* %?\n  %U")))

  (setq org-refile-targets '((org-agenda-files :maxlevel . 3))
        org-refile-use-outline-path 'file
        org-archive-location (expand-file-name "archive/%s_archive::"
                                               org-directory))

  (setq org-clock-idle-time 15
        org-clock-persist t)
  (org-clock-persistence-insinuate)

  (setq org-id-link-to-org-use-id 'create-if-interactive)

  (setq org-confirm-babel-evaluate t)

  (add-hook 'org-mode-hook #'org-modern-mode)
  (add-hook 'org-mode-hook #'org-appear-mode)
  (setq org-hide-emphasis-markers t
        org-ellipsis " ▾ ")

  (custom-theme-set-faces! 'user
    '(org-document-title :height 1.3)
    '(org-level-1 :height 1.2)
    '(org-level-2 :height 1.1)
    '(org-level-3 :height 1.0)))
