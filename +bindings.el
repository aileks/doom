;;; +bindings.el -*- lexical-binding: t; -*-
;;
;; Keybindings layered on Doom's :config default +bindings map.
;; Doom already provides: C-hjkl window nav, SPC leader groups, SPC d dape,
;; SPC X / SPC n n org-capture, SPC n a org-agenda, SPC o t vterm popup.
;; Bindings are added as complete key sequences so Doom's own prefix maps
;; (SPC c, SPC p, ...) keep every default entry.
;; The full old-key -> new-key table lives in ~/doom-migration.md.

(after! evil
  ;; Visual paste keeps the clipboard register intact (nvim's "_dP policy).
  (setq evil-kill-on-visual-paste nil)

  ;; Centered half-page scroll (nvim: C-d/C-u -> zz). Count is forwarded;
  ;; nil keeps evil's half-window default.
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

  ;; Centered search jumps (nvim: n/N -> nzzzv), defined as motions so the
  ;; count and evil's jump bookkeeping still work.
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

;; TODO/FIXME keyword search across the project (todo-comments.nvim
;; replacement). Searches text matches, not only actual comments.
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

;; Project task menu (overseer.nvim replacement; +tasks.el provides commands)
(map! :leader :desc "Project tasks" "p t" #'+tasks-menu)

;; Debug print insertion/cleanup (refactoring.nvim replacement; nvim lived
;; under <leader>p which Doom reserves for projects).
(map! :leader
      :desc "Debug print variable below"     "c p v" #'+debug-print/var-below
      :desc "Debug print variable above"     "c p V" #'+debug-print/var-above
      :desc "Debug print expression below"   "c p e" #'+debug-print/expr-below
      :desc "Debug print expression above"   "c p E" #'+debug-print/expr-above
      :desc "Debug print location below"     "c p p" #'+debug-print/loc-below
      :desc "Debug print location above"     "c p P" #'+debug-print/loc-above
      :desc "Remove all debug prints"        "c p c" #'+debug-print/cleanup)
