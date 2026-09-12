;;; +bindings.el -*- lexical-binding: t; -*-
;;
;; Keybindings layered on Doom's :config default +bindings map.
;; Doom already provides: C-hjkl window nav, SPC leader groups, SPC d dape,
;; SPC X / SPC n n org-capture, SPC n a org-agenda, SPC o t vterm popup.
;; The old-key -> new-key table lives in docs/keybindings.md.

;; Centered half-page scroll (nvim: C-d/C-u -> zz)
(defun +evil-scroll-down-centered () (interactive) (evil-scroll-down) (recenter))
(defun +evil-scroll-up-centered () (interactive) (evil-scroll-up) (recenter))
(map! :m "C-d" #'+evil-scroll-down-centered
      :m "C-u" #'+evil-scroll-up-centered)

;; Centered search jumps (nvim: n/N -> nzzzv)
(defun +evil-search-next-centered ()
  (interactive) (evil-ex-search-next) (recenter))
(defun +evil-search-previous-centered ()
  (interactive) (evil-ex-search-previous) (recenter))
(map! :m "n" #'+evil-search-next-centered
      :m "N" #'+evil-search-previous-centered)

;; Visual paste without clobbering the clipboard register (nvim: "_dP)
(defun +evil-visual-restore-paste ()
  (interactive)
  (evil-delete (region-beginning) (region-end) (evil-visual-type) ?_)
  (evil-paste-after 1))
(map! :v "p" #'+evil-visual-restore-paste)

;; TODO/FIXME comment search across the project (todo-comments.nvim pickers)
(defconst +todo-comment-keywords
  '("TODO" "NEXT" "WAIT" "FIXME" "BUG" "HACK" "WARN" "PERF" "NOTE" "TEST")
  "Keywords searched by `+todo/search' and highlighted by hl-todo.")

(defun +todo/search ()
  "Search TODO-style comment keywords in the current project."
  (interactive)
  (+default/search-project
   (concat "\\b(" (string-join +todo-comment-keywords "\\b|\\b") ")\\b")))
(map! :leader :desc "Search TODO comments" "f t" #'+todo/search)

;; Project task menu (overseer.nvim replacement; +tasks.el provides commands)
(map! :leader :desc "Project tasks" "p t" #'+tasks-menu)

;; Debug print insertion/cleanup (refactoring.nvim replacement; nvim lived
;; under <leader>p which Doom reserves for projects)
(map! :leader
      (:prefix-map ("c" . "code")
       (:prefix-map ("p" . "debug print")
        :nv "v" #'+debug-print/var-below
        :nv "V" #'+debug-print/var-above
        :nv "e" #'+debug-print/expr-below
        :nv "E" #'+debug-print/expr-above
        :nv "p" #'+debug-print/loc-below
        :nv "P" #'+debug-print/loc-above
        :nv "c" #'+debug-print/cleanup)))
