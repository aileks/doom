;;; +org.el -*- lexical-binding: t; -*-
;;
;; Org setup: capture, agenda, TODO workflow, logging, clocking, refiling,
;; archiving. org-directory is set in config.el before org loads.
;; Starter files live in ~/org and are created on first use (never deleted).

(after! org
  ;; --- TODO workflow: TODO/NEXT/WAIT -> DONE/CANCELLED --------------------
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "WAIT(w)" "|" "DONE(d)" "CANCELLED(c)"))
        ;; Faces ship with Doom's org module (+org-todo-active/onhold/cancel)
        ;; and the theme extends them; map our keywords onto them.
        org-todo-keyword-faces
        '(("NEXT" . +org-todo-active)
          ("WAIT" . +org-todo-onhold)
          ("CANCELLED" . +org-todo-cancel)))

  ;; Completion logging and repeat logging into a LOGBOOK drawer.
  (setq org-log-done 'time
        org-log-repeat 'time
        org-log-into-drawer t)

  ;; --- Agenda -------------------------------------------------------------
  ;; org-agenda-files defaults to org-directory (all top-level .org files).
  (setq org-agenda-custom-commands
        '(("n" "Next actions" todo "NEXT")
          ("w" "Waiting on" todo "WAIT")
          ("o" "Open tasks" tags-todo "")
          ("a" "Agenda and all TODOs"
           ((agenda "")
            (alltodo "")))))

  ;; --- Capture: task, inbox, note, daily log ------------------------------
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

  ;; --- Refiling and archiving ---------------------------------------------
  (setq org-refile-targets '((org-agenda-files :maxlevel . 3))
        org-refile-use-outline-path 'file
        ;; Per-source-file archives: todo.org -> archive/todo.org_archive.
        org-archive-location (expand-file-name "archive/%s_archive::"
                                               org-directory))

  ;; --- Clocking -------------------------------------------------------------
  (setq org-clock-idle-time 15
        org-clock-persist t)
  (org-clock-persistence-insinuate)

  ;; --- Links ----------------------------------------------------------------
  ;; Store link creates an ID automatically so id: links keep working across
  ;; renames/moves.
  (setq org-id-link-to-org-use-id 'create-if-interactive)

  ;; --- Babel ----------------------------------------------------------------
  ;; Doom lazy-loads babel backends on first execution; python/shell/sql/elisp
  ;; need nothing registered here. Evaluation always confirms first, including
  ;; blocks triggered by export.
  (setq org-confirm-babel-evaluate t))
