;;; cinder-grove-theme.el -*- lexical-binding: t; -*-
;;
;; Cinder Grove - dark ember/grove palette for Doom Emacs.
;; Ported from cinder-grove.nvim @ 44bc0b3 (aileks/cinder-grove.nvim),
;; with `transparent = true`: the default background stays clear so the
;; frame (or a compositor) shows through; floats keep the container color.

(deftheme cinder-grove
  "Cinder Grove: smoldering dark theme with ember-orange accents.")

(defgroup cinder-grove nil
  "Cinder Grove theme."
  :group 'faces
  :prefix "cinder-grove-")

(defconst cinder-grove-bg        "#131210")
(defconst cinder-grove-container "#1B1916")
(defconst cinder-grove-surface   "#23201C")
(defconst cinder-grove-visual    "#3E3A34")
(defconst cinder-grove-muted     "#58534C")
(defconst cinder-grove-subtle    "#9A938A")
(defconst cinder-grove-secondary "#ACA49B")
(defconst cinder-grove-fg        "#BBB3A9")
(defconst cinder-grove-bright    "#DDD5CA")
(defconst cinder-grove-orange    "#E17A3F")
(defconst cinder-grove-green     "#879B5C")
(defconst cinder-grove-red       "#B34A45")
(defconst cinder-grove-yellow    "#D9A441")
(defconst cinder-grove-blue      "#6785A1")
(defconst cinder-grove-purple    "#9A788F")
(defconst cinder-grove-cyan      "#58918C")

(custom-theme-set-faces
 'cinder-grove

 ;; --- base (background intentionally transparent) -------------------------
 '(default ((t (:background nil))))
 '(cursor ((t (:background ,cinder-grove-orange))))
 '(region ((t (:background ,cinder-grove-visual))))
 '(highlight ((t (:background ,cinder-grove-surface))))
 '(hl-line ((t (:background ,cinder-grove-container))))
 '(fringe ((t (:background nil :foreground ,cinder-grove-muted))))
 '(vertical-border ((t (:foreground ,cinder-grove-muted))))
 '(shadow ((t (:foreground ,cinder-grove-muted))))
 '(line-number ((t (:foreground ,cinder-grove-muted :background nil))))
 '(line-number-current-line ((t (:foreground ,cinder-grove-orange
                                             :background ,cinder-grove-surface
                                             :bold t))))
 '(minibuffer-prompt ((t (:foreground ,cinder-grove-orange :bold t))))
 '(trailing-whitespace ((t (:background ,cinder-grove-surface))))
 '(show-paren-match ((t (:background ,cinder-grove-visual :bold t))))
 '(show-paren-mismatch ((t (:foreground ,cinder-grove-bg
                                         :background ,cinder-grove-red))))
 '(match ((t (:background ,cinder-grove-surface :foreground ,cinder-grove-orange))))

 ;; --- search ---------------------------------------------------------------
 '(isearch ((t (:background ,cinder-grove-orange :foreground ,cinder-grove-bg))))
 '(lazy-highlight ((t (:background ,cinder-grove-visual :foreground ,cinder-grove-bright))))
 '(query-replace ((t (:inherit isearch))))

 ;; --- modeline / header ------------------------------------------------------
 '(mode-line ((t (:background ,cinder-grove-container :foreground ,cinder-grove-bright
                              :box (:color ,cinder-grove-muted)))))
 '(mode-line-inactive ((t (:background ,cinder-grove-surface
                                       :foreground ,cinder-grove-muted
                                       :box (:color ,cinder-grove-container)))))
 '(mode-line-buffer-id ((t (:foreground ,cinder-grove-orange :bold t))))
 '(header-line ((t (:inherit mode-line))))
 '(which-key-key-face ((t (:foreground ,cinder-grove-orange))))
 '(which-key-group-description-face ((t (:foreground ,cinder-grove-subtle))))
 '(which-key-command-description-face ((t (:foreground ,cinder-grove-fg))))

 ;; --- font lock ----------------------------------------------------------------
 '(font-lock-comment-face ((t (:foreground ,cinder-grove-muted :italic t))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-doc-face ((t (:foreground ,cinder-grove-subtle :italic t))))
 '(font-lock-string-face ((t (:foreground ,cinder-grove-green))))
 '(font-lock-keyword-face ((t (:foreground ,cinder-grove-orange))))
 '(font-lock-builtin-face ((t (:foreground ,cinder-grove-blue))))
 '(font-lock-function-name-face ((t (:foreground ,cinder-grove-cyan))))
 '(font-lock-method-call-face ((t (:foreground ,cinder-grove-cyan))))
 '(font-lock-variable-name-face ((t (:foreground ,cinder-grove-fg))))
 '(font-lock-variable-use-face ((t (:foreground ,cinder-grove-fg))))
 '(font-lock-constant-face ((t (:foreground ,cinder-grove-purple))))
 '(font-lock-type-face ((t (:foreground ,cinder-grove-yellow))))
 '(font-lock-property-name-face ((t (:foreground ,cinder-grove-secondary))))
 '(font-lock-number-face ((t (:foreground ,cinder-grove-purple))))
 '(font-lock-operator-face ((t (:foreground ,cinder-grove-secondary))))
 '(font-lock-punctuation-face ((t (:foreground ,cinder-grove-secondary))))
 '(font-lock-preprocessor-face ((t (:foreground ,cinder-grove-orange :italic t))))
 '(font-lock-negation-char-face ((t (:foreground ,cinder-grove-red))))
 '(font-lock-warning-face ((t (:foreground ,cinder-grove-yellow))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit bold))))
 '(font-lock-regexp-grouping-construct ((t (:inherit bold))))

 ;; --- diagnostics (restrained: colored text, no noisy backgrounds) -----------
 '(error ((t (:foreground ,cinder-grove-red))))
 '(warning ((t (:foreground ,cinder-grove-yellow))))
 '(success ((t (:foreground ,cinder-grove-green))))
 '(flycheck-error ((t (:underline (:style wave :color ,cinder-grove-red)))))
 '(flycheck-warning ((t (:underline (:style wave :color ,cinder-grove-yellow)))))
 '(flycheck-info ((t (:underline (:style wave :color ,cinder-grove-blue)))))
 '(flycheck-fringe-error ((t (:foreground ,cinder-grove-red))))
 '(flycheck-fringe-warning ((t (:foreground ,cinder-grove-yellow))))
 '(flycheck-fringe-info ((t (:foreground ,cinder-grove-blue))))
 '(flymake-error ((t (:underline (:style wave :color ,cinder-grove-red)))))
 '(flymake-warning ((t (:underline (:style wave :color ,cinder-grove-yellow)))))
 '(flymake-note ((t (:underline (:style wave :color ,cinder-grove-blue)))))

 ;; --- completions ------------------------------------------------------------
 '(corfu-default ((t (:background ,cinder-grove-container :foreground ,cinder-grove-fg))))
 '(corfu-current ((t (:background ,cinder-grove-surface :foreground ,cinder-grove-bright))))
 '(corfu-annotations ((t (:inherit corfu-default :foreground ,cinder-grove-muted))))
 '(vertico-current ((t (:background ,cinder-grove-surface :foreground ,cinder-grove-bright))))
 '(marginalia-documentation ((t (:foreground ,cinder-grove-muted :italic t))))
 '(orderless-match-face-0 ((t (:foreground ,cinder-grove-orange :bold t))))
 '(orderless-match-face-1 ((t (:foreground ,cinder-grove-yellow :bold t))))
 '(orderless-match-face-2 ((t (:foreground ,cinder-grove-green :bold t))))
 '(orderless-match-face-3 ((t (:foreground ,cinder-grove-cyan :bold t))))
 '(consult-preview-insertion ((t (:background ,cinder-grove-surface))))

 ;; --- git / vc-gutter ------------------------------------------------------------
 '(diff-hl-change ((t (:foreground ,cinder-grove-yellow))))
 '(diff-hl-delete ((t (:foreground ,cinder-grove-red))))
 '(diff-hl-insert ((t (:foreground ,cinder-grove-green))))
 '(diff-added ((t (:foreground ,cinder-grove-green :background ,cinder-grove-container))))
 '(diff-removed ((t (:foreground ,cinder-grove-red :background ,cinder-grove-container))))
 '(diff-changed ((t (:foreground ,cinder-grove-yellow))))
 '(diff-header ((t (:foreground ,cinder-grove-subtle))))
 '(diff-hunk-header ((t (:foreground ,cinder-grove-muted :background ,cinder-grove-surface))))
 '(diff-file-header ((t (:foreground ,cinder-grove-orange :bold t))))
 '(magit-section-highlight ((t (:background ,cinder-grove-surface))))
 '(magit-section-heading ((t (:foreground ,cinder-grove-orange :bold t))))
 '(magit-branch-local ((t (:foreground ,cinder-grove-cyan))))
 '(magit-branch-remote ((t (:foreground ,cinder-grove-green))))
 '(magit-hash ((t (:foreground ,cinder-grove-muted))))
 '(magit-header-line ((t (:foreground ,cinder-grove-orange :bold t))))
 '(magit-digest ((t (:foreground ,cinder-grove-purple))))
 '(git-commit-summary ((t (:foreground ,cinder-grove-bright))))

 ;; --- org ---------------------------------------------------------------------------
 '(org-document-title ((t (:foreground ,cinder-grove-orange :bold t :height 1.2))))
 '(org-document-info ((t (:foreground ,cinder-grove-subtle))))
 '(org-level-1 ((t (:foreground ,cinder-grove-orange :bold t))))
 '(org-level-2 ((t (:foreground ,cinder-grove-green :bold t))))
 '(org-level-3 ((t (:foreground ,cinder-grove-yellow))))
 '(org-level-4 ((t (:foreground ,cinder-grove-blue))))
 '(org-level-5 ((t (:foreground ,cinder-grove-purple))))
 '(org-level-6 ((t (:foreground ,cinder-grove-cyan))))
 '(org-level-7 ((t (:foreground ,cinder-grove-secondary))))
 '(org-level-8 ((t (:foreground ,cinder-grove-subtle))))
 '(org-todo ((t (:foreground ,cinder-grove-orange :bold t))))
 '(org-done ((t (:foreground ,cinder-grove-green :bold t))))
 '(org-priority ((t (:foreground ,cinder-grove-yellow))))
 '(org-tag ((t (:foreground ,cinder-grove-muted))))
 '(org-date ((t (:foreground ,cinder-grove-blue :underline t))))
 '(org-special-keyword ((t (:foreground ,cinder-grove-muted))))
 '(org-table ((t (:foreground ,cinder-grove-secondary))))
 '(org-formula ((t (:foreground ,cinder-grove-purple))))
 '(org-block ((t (:background ,cinder-grove-container))))
 '(org-block-begin-line ((t (:foreground ,cinder-grove-muted :background ,cinder-grove-container))))
 '(org-block-end-line ((t (:inherit org-block-begin-line))))
 '(org-code ((t (:foreground ,cinder-grove-green :background ,cinder-grove-container))))
 '(org-verbatim ((t (:foreground ,cinder-grove-secondary))))
 '(org-quote ((t (:background ,cinder-grove-container :slant italic))))
 '(org-headline-done ((t (:foreground ,cinder-grove-muted))))
 '(org-checkbox ((t (:foreground ,cinder-grove-orange :bold t))))
 '(org-link ((t (:foreground ,cinder-grove-blue :underline t))))
 '(org-clock-overlay ((t (:background ,cinder-grove-visual))))
 '(org-agenda-clocking ((t (:background ,cinder-grove-visual))))
 '(org-scheduled ((t (:foreground ,cinder-grove-fg))))
 '(org-deadline-announce ((t (:foreground ,cinder-grove-red))))
 '(org-upcoming-deadline ((t (:foreground ,cinder-grove-yellow))))
 '(org-warning ((t (:foreground ,cinder-grove-red :bold t)))))

;; Module faces that Doom's org module declares dynamically.
(after! org
  (custom-theme-set-faces
   'cinder-grove
   `(+org-todo-active ((t (:foreground ,cinder-grove-yellow :bold t))))
   `(+org-todo-onhold ((t (:foreground ,cinder-grove-blue :bold t))))
   `(+org-todo-cancel ((t (:foreground ,cinder-grove-muted :strike-through t))))
   `(+org-todo-project ((t (:foreground ,cinder-grove-purple :bold t))))))

(custom-theme-set-faces
 'cinder-grove
 ;; --- misc ui --------------------------------------------------------------
 '(hl-todo ((t (:foreground ,cinder-grove-orange :bold t))))
 '(link ((t (:foreground ,cinder-grove-blue :underline t))))
 '(link-visited ((t (:foreground ,cinder-grove-purple :underline t))))
 '(help-argument-name ((t (:foreground ,cinder-grove-cyan :italic t))))
 '(tooltip ((t (:background ,cinder-grove-container :foreground ,cinder-grove-fg))))
 '(popup-face ((t (:background ,cinder-grove-container :foreground ,cinder-grove-fg))))
 '(popup-tip-face ((t (:background ,cinder-grove-surface :foreground ,cinder-grove-orange))))
 '(child-frame-border ((t (:background ,cinder-grove-muted))))
 '(nav-flash-face ((t (:background ,cinder-grove-visual :foreground ,cinder-grove-orange))))
 '(lsp-face-highlight-read ((t (:background ,cinder-grove-visual))))
 '(lsp-face-highlight-write ((t (:background ,cinder-grove-visual :box (:color ,cinder-grove-orange)))))
 '(lsp-headerline-breadcrumb-path-face ((t (:foreground ,cinder-grove-subtle))))
 '(lsp-headerline-breadcrumb-symbols-face ((t (:foreground ,cinder-grove-orange))))
 '(lsp-ui-doc-background ((t (:background ,cinder-grove-container))))
 '(evil-ex-substitute-matches ((t (:background ,cinder-grove-surface :strike-through t))))
 '(evil-ex-substitute-replacement ((t (:foreground ,cinder-grove-green))))
 '(evil-search-highlight-persist-highlight-face ((t (:background ,cinder-grove-visual))))
 '(indent-bars-face ((t (:foreground ,cinder-grove-visual))))
 '(dashboard-banner-logo-title ((t (:foreground ,cinder-grove-orange :bold t))))
 '(dashboard-items-face ((t (:foreground ,cinder-grove-fg))))
 '(dashboard-heading ((t (:foreground ,cinder-grove-orange :bold t))))
 '(term-color-black ((t (:foreground ,cinder-grove-surface :background ,cinder-grove-surface))))
 '(term-color-red ((t (:foreground ,cinder-grove-red :background ,cinder-grove-red))))
 '(term-color-green ((t (:foreground ,cinder-grove-green :background ,cinder-grove-green))))
 '(term-color-yellow ((t (:foreground ,cinder-grove-yellow :background ,cinder-grove-yellow))))
 '(term-color-blue ((t (:foreground ,cinder-grove-blue :background ,cinder-grove-blue))))
 '(term-color-magenta ((t (:foreground ,cinder-grove-purple :background ,cinder-grove-purple))))
 '(term-color-cyan ((t (:foreground ,cinder-grove-cyan :background ,cinder-grove-cyan))))
 '(term-color-white ((t (:foreground ,cinder-grove-bright :background ,cinder-grove-bright)))))

;; Terminal ANSI palette (cinder-grove terminal_colors = true upstream).
(custom-theme-set-variables
 'cinder-grove
 '(ansi-color-names-vector
   ["#23201C" "#B34A45" "#879B5C" "#D9A441" "#6785A1" "#9A788F" "#58918C" "#DDD5CA"])
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold]))

(provide-theme 'cinder-grove)
;;; cinder-grove-theme.el ends here
