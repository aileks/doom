;;; +org.el -*- lexical-binding: t; -*-


(defun my/org-pretty-buffer-h ()
  "Make Org buffers feel more like polished documents."
  (setq-local line-spacing 0.16)
  (visual-line-mode 1)
  (variable-pitch-mode 1)
  (display-line-numbers-mode -1))

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

  (setq org-hide-emphasis-markers t
        org-pretty-entities t
        org-pretty-entities-include-sub-superscripts nil
        org-highlight-latex-and-related '(native script entities)
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t
        org-fontify-whole-heading-line t
        org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-image-actual-width nil
        org-tags-column 0
        org-auto-align-tags nil
        org-ellipsis "  …"
        org-startup-indented t
        org-hide-leading-stars nil)

  (setq org-agenda-tags-column 0
        org-agenda-block-separator ?─
        org-agenda-current-time-string "  ◀ now ─────────────────────────"
        org-agenda-time-grid
        '((daily today require-timed)
          (800 1000 1200 1400 1600 1800 2000)
          "  ┄┄┄┄┄ "
          "┄┄┄┄┄┄┄┄┄┄"))

  (add-hook 'org-mode-hook #'my/org-pretty-buffer-h)
  (add-hook 'org-mode-hook #'org-modern-mode)
  (add-hook 'org-mode-hook #'org-appear-mode)

  (custom-theme-set-faces! 'user
    '((org-document-title org-document-info org-document-info-keyword)
      :inherit (fixed-pitch font-lock-comment-face)
      :height 0.9 :weight normal)
    '(org-indent :inherit (org-hide fixed-pitch))

    '(org-level-1
      :inherit (variable-pitch font-lock-keyword-face)
      :height 1.45 :weight bold)
    '(org-level-2
      :inherit (variable-pitch font-lock-function-name-face)
      :height 1.30 :weight bold)
    '(org-level-3
      :inherit (variable-pitch font-lock-type-face)
      :height 1.20 :weight bold)
    '(org-level-4
      :inherit (variable-pitch font-lock-variable-name-face)
      :height 1.12 :weight semi-bold)
    '(org-level-5
      :inherit (variable-pitch font-lock-constant-face)
      :height 1.06 :weight semi-bold)
    '(org-level-6
      :inherit (variable-pitch font-lock-builtin-face)
      :height 1.03 :weight semi-bold)
    '(org-level-7
      :inherit (variable-pitch font-lock-string-face)
      :height 1.0 :weight semi-bold)
    '(org-level-8
      :inherit (variable-pitch font-lock-doc-face)
      :height 1.0 :weight semi-bold)

    '(org-link :inherit link :weight semi-bold)
    '(org-date :inherit (fixed-pitch font-lock-constant-face) :height 0.95)
    '(org-tag :inherit (fixed-pitch shadow) :height 0.85 :weight bold)
    '(org-todo :inherit fixed-pitch :weight bold)
    '(org-done :inherit fixed-pitch :weight bold)
    '(org-priority :inherit (fixed-pitch font-lock-warning-face) :weight bold)
    '(org-checkbox :inherit (fixed-pitch font-lock-builtin-face) :weight bold)
    '(org-special-keyword :inherit (fixed-pitch font-lock-comment-face) :height 0.9)
    '(org-meta-line :inherit (fixed-pitch font-lock-comment-face) :height 0.9)
    '(org-drawer :inherit (fixed-pitch shadow) :height 0.9)
    '(org-property-value :inherit (fixed-pitch font-lock-string-face))

    '(org-code :inherit (fixed-pitch font-lock-constant-face))
    '(org-verbatim :inherit (fixed-pitch font-lock-string-face))
    '(org-table :inherit fixed-pitch)
    '(org-formula :inherit (fixed-pitch font-lock-function-name-face))
    '(org-block :inherit fixed-pitch :extend t)
    '(org-block-begin-line
      :inherit (fixed-pitch font-lock-comment-face)
      :height 0.85 :slant italic :extend t)
    '(org-block-end-line
      :inherit (fixed-pitch font-lock-comment-face)
      :height 0.85 :slant italic :extend t)

    '(org-quote :inherit variable-pitch :slant italic)
    '(org-verse :inherit variable-pitch :slant italic)
    '(org-footnote :inherit (fixed-pitch font-lock-comment-face) :height 0.9)
    '(org-latex-and-related :inherit font-lock-string-face)))

(after! org-modern
  (setq org-modern-label-border 0.18
        org-modern-star 'replace
        org-modern-replace-stars '("◆" "○" "✸" "✿")
        org-modern-cycle-stars t
        org-modern-hide-stars ?\s

        org-modern-list
        `((?- . ,(propertize "• " 'face 'org-modern-symbol))
          (?+ . ,(propertize "◦ " 'face 'org-modern-symbol))
          (?* . ,(propertize "▪ " 'face 'org-modern-symbol)))
        org-modern-checkbox
        '((?X . "☑")
          (?- . "◩")
          (?\s . "☐"))

        org-modern-todo t
        org-modern-tag t
        org-modern-priority t
        org-modern-timestamp t
        org-modern-progress 14
        org-modern-internal-target '(" 󱞩 " t " ")
        org-modern-radio-target '(" ◉ " t " ")

        org-modern-table t
        org-modern-table-vertical 2
        org-modern-table-horizontal 0.12
        org-modern-horizontal-rule
        "────────────────────────────────────────────────────────"

        org-modern-keyword nil

        org-modern-block-name
        '(("src" "╭─" "╰─")
          ("example" "╭┄" "╰┄")
          ("quote" "╭❝" "╰❞")
          ("verse" "╭♪" "╰♪")
          ("export" "╭»" "╰«")
          (t "╭─" "╰─"))
        org-modern-block-fringe nil

        org-modern-priority-faces
        '((?A . error)
          (?B . warning)
          (?C . success))
        org-modern-todo-faces
        '(("TODO" . warning)
          ("NEXT" . success)
          ("WAIT" . font-lock-constant-face)
          ("DONE" . success)
          ("CANCELLED" . shadow)))

  (add-hook 'org-agenda-finalize-hook #'org-modern-agenda)

  (custom-theme-set-faces! 'user
    '(org-modern-symbol :family "Iosevka Nerd Font" :weight normal)
    '(org-modern-block-name
      :inherit (fixed-pitch font-lock-comment-face)
      :height 0.85 :weight semi-bold)
    '(org-modern-tag :inherit (fixed-pitch secondary-selection) :weight semi-bold)
    '(org-modern-priority :inherit fixed-pitch :weight bold)
    '(org-modern-todo :inherit (fixed-pitch org-todo) :weight bold)
    '(org-modern-done :inherit (fixed-pitch org-done) :weight bold)
    '(org-modern-date-active :inherit (fixed-pitch org-date) :weight semi-bold)
    '(org-modern-date-inactive :inherit (fixed-pitch shadow) :weight semi-bold)
    '(org-modern-time-active :inherit (fixed-pitch org-date) :weight semi-bold)
    '(org-modern-time-inactive :inherit (fixed-pitch shadow) :weight semi-bold)
    '(org-modern-horizontal-rule :inherit shadow)
    '(org-modern-internal-target :inherit (fixed-pitch font-lock-constant-face))
    '(org-modern-radio-target :inherit (fixed-pitch font-lock-keyword-face))))

(after! org-appear
  (setq org-appear-autoemphasis t
        org-appear-autolinks t
        org-appear-autosubmarkers t
        org-appear-autoentities t
        org-appear-autokeywords t
        org-appear-inside-latex t
        org-appear-delay 0.05))

(after! org-agenda
  (custom-theme-set-faces! 'user
    '(org-agenda-structure
      :inherit (variable-pitch font-lock-keyword-face)
      :height 1.30 :weight bold)
    '(org-agenda-date
      :inherit (variable-pitch font-lock-function-name-face)
      :height 1.12 :weight bold)
    '(org-agenda-date-today
      :inherit (variable-pitch font-lock-keyword-face)
      :height 1.20 :weight bold :slant normal)
    '(org-agenda-date-weekend
      :inherit (variable-pitch font-lock-comment-face)
      :height 1.08 :weight semi-bold)
    '(org-agenda-current-time
      :inherit (fixed-pitch font-lock-warning-face)
      :weight bold)
    '(org-agenda-done :inherit shadow)
    '(org-agenda-dimmed-todo-face :inherit shadow)
    '(org-agenda-clocking
      :inherit (fixed-pitch font-lock-constant-face)
      :weight semi-bold)))
