;;; muted-umber-theme.el -*- lexical-binding: t; -*-

(deftheme muted-umber
  "Muted Umber: a Doom Emacs dark theme in muted brown tones."
  :background-mode 'dark
  :kind 'color-scheme)

(defgroup muted-umber nil
  "Muted Umber theme."
  :group 'faces
  :prefix "muted-umber-")

(defconst muted-umber-background     "#080503")
(defconst muted-umber-container      "#140E0A")
(defconst muted-umber-surface        "#221B17")
(defconst muted-umber-visual         "#80756E")
(defconst muted-umber-overlay        "#342C26")
(defconst muted-umber-text-muted     "#A2968E")
(defconst muted-umber-text-subtle    "#B4A8A1")
(defconst muted-umber-text-secondary "#C6BBB5")
(defconst muted-umber-text           "#DED6D0")
(defconst muted-umber-text-bright    "#F1EAE5")
(defconst muted-umber-primary        "#B39887")
(defconst muted-umber-secondary      "#A69082")
(defconst muted-umber-error          "#E07972")
(defconst muted-umber-warning        "#C69E58")
(defconst muted-umber-success        "#78AA79")
(defconst muted-umber-info           "#6DA1CD")
(defconst muted-umber-tertiary       "#C1AD9F")
(defconst muted-umber-quaternary     "#D1C0B6")

(defconst muted-umber-selection "#725F52")

(defcustom muted-umber-transparent nil
  "Use the terminal's default background when non-nil.
GUI frames always use the theme's dark canvas; set the frame
parameter `alpha-background' separately for GUI transparency.
Popup faces retain explicit backgrounds.  Reload the theme with
`load-theme' after changing this option."
  :type 'boolean
  :group 'muted-umber)

(let ((tty-background (if muted-umber-transparent "unspecified-bg" muted-umber-background)))
  (custom-theme-set-faces
   'muted-umber
   `(default ((((type tty)) (:background ,tty-background
                            :foreground ,muted-umber-text))
              (t (:background ,muted-umber-background :foreground ,muted-umber-text))))
   `(fringe ((((type tty)) (:background ,tty-background
                           :foreground ,muted-umber-text-muted))
             (t (:background ,muted-umber-background :foreground ,muted-umber-text-muted))))))

(custom-theme-set-faces
 'muted-umber

 ;; --- base -------------------------------------------------------------------
 `(cursor ((t (:background ,muted-umber-text-bright))))
 `(region ((t (:background ,muted-umber-selection :foreground ,muted-umber-text-bright :extend t))))
 `(highlight ((t (:background ,muted-umber-surface))))
 `(hl-line ((t (:background ,muted-umber-container))))
 `(secondary-selection ((t (:background ,muted-umber-selection :foreground ,muted-umber-text-bright :extend t))))
 `(vertical-border ((t (:foreground ,muted-umber-text-muted))))
 `(window-divider ((t (:foreground ,muted-umber-visual))))
 `(shadow ((t (:foreground ,muted-umber-text-subtle))))
 `(escape-glyph ((t (:foreground ,muted-umber-text-muted))))
 `(nobreak-space ((t (:foreground ,muted-umber-warning :underline t))))
 `(file-name-shadow ((t (:inherit shadow))))
 `(fill-column-indicator ((t (:foreground ,muted-umber-visual))))
 `(line-number ((t (:foreground ,muted-umber-text-muted :background unspecified))))
 `(line-number-current-line ((t (:foreground ,muted-umber-primary
                                             :background ,muted-umber-surface
                                             :bold t))))
 `(minibuffer-prompt ((t (:foreground ,muted-umber-primary :bold t))))
 `(trailing-whitespace ((t (:background ,muted-umber-surface))))
 `(show-paren-match ((t (:background ,muted-umber-surface :bold t))))
 `(show-paren-mismatch ((t (:foreground ,muted-umber-background
                                         :background ,muted-umber-error))))
 `(match ((t (:background ,muted-umber-surface
                          :foreground ,muted-umber-primary))))

 ;; --- search -------------------------------------------------------------------
 `(isearch ((t (:background ,muted-umber-selection :foreground ,muted-umber-text-bright :extend t))))
 `(isearch-fail ((t (:foreground ,muted-umber-error :underline t))))
 `(lazy-highlight ((t (:background ,muted-umber-selection :foreground ,muted-umber-text-bright :extend t))))
 `(query-replace ((t (:background ,muted-umber-selection :foreground ,muted-umber-text-bright :extend t))))
 ;; --- mode-line, header-line, tab-bar ---------------------------------------------
 `(mode-line ((t (:background ,muted-umber-container
                              :foreground ,muted-umber-text-bright
                              :box (:color ,muted-umber-text-muted)))))
 `(mode-line-inactive ((t (:background ,muted-umber-surface
                                       :foreground ,muted-umber-text-subtle
                                       :box (:color ,muted-umber-container)))))
 `(mode-line-active ((t (:inherit mode-line))))
 `(mode-line-buffer-id ((t (:foreground ,muted-umber-primary :bold t))))
 `(mode-line-highlight ((t (:foreground ,muted-umber-primary))))
 `(mode-line-emphasis ((t (:foreground ,muted-umber-text-bright :bold t))))
 `(header-line ((t (:inherit mode-line))))
 `(header-line-highlight ((t (:inherit mode-line-highlight))))
 `(tab-bar ((t (:background ,muted-umber-container
                            :foreground ,muted-umber-text-subtle))))
 `(tab-bar-tab ((t (:background ,muted-umber-surface
                                :foreground ,muted-umber-text-bright :weight bold))))
 `(tab-bar-tab-inactive ((t (:background ,muted-umber-container
                                         :foreground ,muted-umber-text-subtle))))
 `(tab-bar-tab-group-current ((t (:foreground ,muted-umber-primary :bold t))))
 `(tab-bar-tab-group-inactive ((t (:inherit tab-bar-tab-inactive))))
 `(tab-line ((t (:inherit tab-bar))))
 `(tab-line-tab ((t (:inherit tab-bar-tab-inactive))))
 `(tab-line-tab-current ((t (:inherit tab-bar-tab))))
 `(tab-line-tab-inactive ((t (:inherit tab-bar-tab-inactive))))
 `(tab-line-tab-inactive-alternate ((t (:inherit tab-line-tab-inactive))))
 `(tab-line-highlight ((t (:background ,muted-umber-selection :foreground ,muted-umber-text-bright :extend t))))
 `(tab-line-close-highlight ((t (:foreground ,muted-umber-primary))))

 ;; --- doom-modeline ---------------------------------------------------------------
 `(doom-modeline-bar ((t (:background ,muted-umber-selection :foreground ,muted-umber-text-bright))))
 `(doom-modeline-bar-inactive ((t (:background ,muted-umber-text-muted))))
 `(doom-modeline-buffer-file ((t (:foreground ,muted-umber-text-bright))))
 `(doom-modeline-buffer-path ((t (:foreground ,muted-umber-text-bright))))
 `(doom-modeline-buffer-major-mode ((t (:foreground ,muted-umber-quaternary))))
 `(doom-modeline-buffer-minor-mode ((t (:inherit shadow))))
 `(doom-modeline-buffer-modified ((t (:foreground ,muted-umber-primary :bold t))))
 `(doom-modeline-emphasis ((t (:foreground ,muted-umber-text-bright :bold t))))
 `(doom-modeline-highlight ((t (:foreground ,muted-umber-primary))))
 `(doom-modeline-info ((t (:foreground ,muted-umber-info))))
 `(doom-modeline-warning ((t (:foreground ,muted-umber-warning))))
 `(doom-modeline-urgent ((t (:foreground ,muted-umber-error :bold t))))
 `(doom-modeline-debug ((t (:foreground ,muted-umber-tertiary))))
 `(doom-modeline-debug-visual ((t (:foreground ,muted-umber-tertiary :bold t))))
 `(doom-modeline-vcs-default ((t (:foreground ,muted-umber-text-secondary))))
 `(doom-modeline-lsp-error ((t (:foreground ,muted-umber-error))))
 `(doom-modeline-lsp-warning ((t (:foreground ,muted-umber-warning))))
 `(doom-modeline-lsp-success ((t (:foreground ,muted-umber-success))))
 `(doom-modeline-lsp-running ((t (:foreground ,muted-umber-warning))))
 `(doom-modeline-evil-normal-state ((t (:foreground ,muted-umber-primary :bold t))))
 `(doom-modeline-evil-insert-state ((t (:foreground ,muted-umber-text-secondary :bold t))))
 `(doom-modeline-evil-visual-state ((t (:foreground ,muted-umber-tertiary :bold t))))
 `(doom-modeline-evil-replace-state ((t (:foreground ,muted-umber-secondary :bold t))))
 `(doom-modeline-evil-emacs-state ((t (:foreground ,muted-umber-quaternary :bold t))))
 `(doom-modeline-evil-motion-state ((t (:foreground ,muted-umber-quaternary :bold t))))
 `(doom-modeline-evil-operator-state ((t (:foreground ,muted-umber-tertiary :bold t))))
 `(doom-modeline-evil-user-state ((t (:foreground ,muted-umber-quaternary :bold t))))
 `(doom-modeline-battery-critical ((t (:foreground ,muted-umber-error :bold t))))
 `(doom-modeline-battery-error ((t (:foreground ,muted-umber-error))))
 `(doom-modeline-battery-warning ((t (:foreground ,muted-umber-warning))))
 `(doom-modeline-battery-charging ((t (:foreground ,muted-umber-success))))
 `(doom-modeline-battery-full ((t (:foreground ,muted-umber-success))))
 `(doom-modeline-battery-normal ((t (:foreground ,muted-umber-text-secondary))))
 `(doom-modeline-unread-number ((t (:foreground ,muted-umber-primary :bold t))))
 `(doom-modeline-compilation ((t (:foreground ,muted-umber-warning))))
 `(doom-modeline-panel ((t (:background ,muted-umber-selection
                                         :foreground ,muted-umber-text-bright :bold t))))
 `(doom-modeline-persp-name ((t (:foreground ,muted-umber-tertiary))))
 `(doom-modeline-workspace-name ((t (:foreground ,muted-umber-primary :bold t))))
 `(doom-modeline-persp-buffer-not-in-persp
   ((t (:inherit shadow :italic t))))
 `(doom-modeline-project-dir ((t (:foreground ,muted-umber-primary))))
 `(doom-modeline-project-name ((t (:foreground ,muted-umber-primary))))
 `(doom-modeline-project-parent-dir ((t (:inherit shadow))))
 `(doom-modeline-project-root-dir ((t (:inherit shadow))))
 `(doom-modeline-repl-success ((t (:foreground ,muted-umber-success))))
 `(doom-modeline-repl-warning ((t (:foreground ,muted-umber-warning))))
 `(doom-modeline-overwrite ((t (:foreground ,muted-umber-error :bold t))))
 `(doom-modeline-time ((t (:foreground ,muted-umber-text-subtle))))
 `(doom-modeline-host ((t (:foreground ,muted-umber-text-subtle))))
 `(doom-modeline-input-method ((t (:foreground ,muted-umber-text-subtle))))

 ;; --- solaire (secondary buffers) ---------------------------------------------------
 `(solaire-default-face ((t (:inherit default :background ,muted-umber-surface))))
 `(solaire-fringe-face ((t (:inherit fringe :background ,muted-umber-surface))))
 `(solaire-header-line-face ((t (:inherit header-line
                                :background ,muted-umber-surface))))
 `(solaire-hl-line-face ((t (:inherit hl-line :background ,muted-umber-surface))))
 `(solaire-line-number-face ((t (:inherit line-number
                                :background ,muted-umber-surface))))
 `(solaire-mode-line-face ((t (:inherit mode-line))))
 `(solaire-mode-line-active-face ((t (:inherit mode-line-active))))
 `(solaire-mode-line-inactive-face ((t (:inherit mode-line-inactive))))
 `(solaire-region-face ((t (:inherit region))))
 `(solaire-org-hide-face ((t (:foreground ,muted-umber-surface))))

 ;; --- font lock --------------------------------------------------------------------
 `(font-lock-comment-face ((t (:foreground ,muted-umber-text-muted :italic t))))
 `(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 `(font-lock-doc-face ((t (:foreground ,muted-umber-text-subtle :italic t))))
 `(font-lock-doc-markup-face ((t (:foreground ,muted-umber-text-secondary))))
 `(font-lock-string-face ((t (:foreground ,muted-umber-text-secondary))))
 `(font-lock-keyword-face ((t (:foreground ,muted-umber-primary))))
 `(font-lock-builtin-face ((t (:foreground ,muted-umber-tertiary))))
 `(font-lock-function-name-face ((t (:foreground ,muted-umber-quaternary))))
 `(font-lock-function-call-face ((t (:inherit font-lock-function-name-face))))
 `(font-lock-variable-name-face ((t (:foreground ,muted-umber-text))))
 `(font-lock-variable-use-face ((t (:inherit font-lock-variable-name-face))))
 `(font-lock-constant-face ((t (:foreground ,muted-umber-text-secondary))))
 `(font-lock-type-face ((t (:foreground ,muted-umber-tertiary))))
 `(font-lock-property-name-face ((t (:foreground ,muted-umber-text-secondary))))
 `(font-lock-property-use-face ((t (:inherit font-lock-property-name-face))))
 `(font-lock-regexp-face ((t (:inherit font-lock-string-face))))
 `(font-lock-number-face ((t (:foreground ,muted-umber-text-secondary))))
 `(font-lock-operator-face ((t (:foreground ,muted-umber-text-subtle))))
 `(font-lock-punctuation-face ((t (:foreground ,muted-umber-text-subtle))))
 `(font-lock-bracket-face ((t (:inherit font-lock-punctuation-face))))
 `(font-lock-delimiter-face ((t (:inherit font-lock-punctuation-face))))
 `(font-lock-misc-punctuation-face ((t (:inherit font-lock-punctuation-face))))
 `(font-lock-preprocessor-face ((t (:foreground ,muted-umber-primary :italic t))))
 `(font-lock-negation-char-face ((t (:foreground ,muted-umber-text-subtle))))
 `(font-lock-warning-face ((t (:foreground ,muted-umber-warning))))
 `(font-lock-escape-face ((t (:foreground ,muted-umber-text-bright))))
 `(font-lock-regexp-grouping-backslash ((t (:inherit bold))))
 `(font-lock-regexp-grouping-construct ((t (:inherit bold))))

 ;; --- diagnostics (restrained: colored text, no noisy backgrounds) ----------------
 `(error ((t (:foreground ,muted-umber-error))))
 `(warning ((t (:foreground ,muted-umber-warning))))
 `(success ((t (:foreground ,muted-umber-success))))
 `(flycheck-error ((t (:underline (:style wave :color ,muted-umber-error)))))
 `(flycheck-warning ((t (:underline (:style wave :color ,muted-umber-warning)))))
 `(flycheck-info ((t (:underline (:style wave :color ,muted-umber-info)))))
 `(flycheck-fringe-error ((t (:inherit error))))
 `(flycheck-fringe-warning ((t (:inherit warning))))
 `(flycheck-fringe-info ((t (:inherit compilation-info))))
 `(flycheck-error-list-error ((t (:foreground ,muted-umber-error :bold t))))
 `(flycheck-error-list-warning ((t (:foreground ,muted-umber-warning :bold t))))
 `(flycheck-error-list-info ((t (:foreground ,muted-umber-info :bold t))))
 `(flycheck-error-list-line-number ((t (:inherit shadow))))
 `(flycheck-error-list-column-number ((t (:inherit shadow))))
 `(flycheck-error-list-id ((t (:foreground ,muted-umber-text-subtle))))
 `(flycheck-error-list-filename ((t (:foreground ,muted-umber-quaternary))))
 `(flymake-error ((t (:underline (:style wave :color ,muted-umber-error)))))
 `(flymake-warning ((t (:underline (:style wave :color ,muted-umber-warning)))))
 `(flymake-note ((t (:underline (:style wave :color ,muted-umber-info)))))

 ;; --- eglot ------------------------------------------------------------------------
 `(eglot-highlight-symbol-face ((t (:background ,muted-umber-surface))))
 `(eglot-diagnostic-tag-unnecessary-face ((t (:inherit shadow))))
 `(eglot-diagnostic-tag-deprecated-face ((t (:strike-through t))))
 `(eglot-inlay-hint-face ((t (:inherit shadow :height 0.8 :slant italic))))
 `(eglot-type-hint-face ((t (:inherit eglot-inlay-hint-face
                           :foreground ,muted-umber-tertiary))))
 `(eglot-parameter-hint-face ((t (:inherit eglot-inlay-hint-face
                                :foreground ,muted-umber-primary))))

 ;; --- completions ---------------------------------------------------------------------
 `(completions-common-part ((t (:foreground ,muted-umber-primary :bold t))))
 `(completions-first-difference ((t (:foreground ,muted-umber-primary :bold t))))
 `(completions-annotations ((t (:inherit shadow :slant italic))))
 `(completions-highlight ((t (:background ,muted-umber-selection :foreground ,muted-umber-text-bright :extend t))))
 `(completions-group-title ((t (:foreground ,muted-umber-tertiary :weight bold))))
 `(completions-group-separator ((t (:foreground ,muted-umber-text-muted
                                   :strike-through t))))
 `(corfu-default ((t (:background ,muted-umber-container
                                  :foreground ,muted-umber-text))))
 `(corfu-current ((t (:background ,muted-umber-selection :foreground ,muted-umber-text-bright :extend t))))
 `(corfu-annotations ((t (:inherit completions-annotations))))
 `(corfu-deprecated ((t (:inherit shadow :strike-through t))))
 `(corfu-bar ((t (:background ,muted-umber-text-muted))))
 `(corfu-border ((t (:background ,muted-umber-selection :foreground ,muted-umber-text-bright))))
 `(corfu-echo ((t (:inherit completions-annotations))))
 `(corfu-popupinfo ((t (:background ,muted-umber-container
                                    :foreground ,muted-umber-text-secondary))))
 `(corfu-quick1 ((t (:foreground ,muted-umber-primary :bold t))))
 `(corfu-quick2 ((t (:foreground ,muted-umber-tertiary :bold t))))
 `(vertico-current ((t (:background ,muted-umber-selection :foreground ,muted-umber-text-bright :extend t))))
 `(vertico-group-title ((t (:inherit completions-group-title))))
 `(vertico-group-separator ((t (:foreground ,muted-umber-text-muted))))
 `(orderless-match-face-0 ((t (:foreground ,muted-umber-primary :bold t))))
 `(orderless-match-face-1 ((t (:foreground ,muted-umber-tertiary :bold t))))
 `(orderless-match-face-2 ((t (:foreground ,muted-umber-text-secondary :bold t))))
 `(orderless-match-face-3 ((t (:foreground ,muted-umber-quaternary :bold t))))
 `(marginalia-documentation ((t (:inherit completions-annotations))))
 `(marginalia-key ((t (:foreground ,muted-umber-primary :bold t))))
 `(marginalia-value ((t (:foreground ,muted-umber-text-secondary))))
 `(marginalia-lighter ((t (:inherit shadow))))
 `(marginalia-modified ((t (:foreground ,muted-umber-warning))))
 `(marginalia-date ((t (:foreground ,muted-umber-quaternary))))
 `(marginalia-type ((t (:foreground ,muted-umber-quaternary))))
 `(marginalia-on ((t (:foreground ,muted-umber-success))))
 `(marginalia-off ((t (:inherit shadow))))
 `(marginalia-installed ((t (:foreground ,muted-umber-success))))
 `(marginalia-archive ((t (:inherit shadow))))
 `(marginalia-null ((t (:inherit shadow))))
 `(marginalia-number ((t (:foreground ,muted-umber-tertiary))))
 `(marginalia-function ((t (:foreground ,muted-umber-quaternary))))
 `(marginalia-symbol ((t (:foreground ,muted-umber-tertiary))))
 `(consult-help ((t (:foreground ,muted-umber-primary))))
 `(consult-key ((t (:foreground ,muted-umber-primary :bold t))))
 `(consult-grep-context ((t (:inherit completions-annotations))))
 `(consult-preview-line ((t (:background ,muted-umber-surface))))
 `(consult-preview-insertion ((t (:background ,muted-umber-surface))))
 `(consult-preview-match ((t (:foreground ,muted-umber-primary :bold t))))
 `(consult-highlight-match ((t (:foreground ,muted-umber-primary :bold t))))
 `(consult-highlight-mark ((t (:background ,muted-umber-surface))))
 `(consult-async-split ((t (:foreground ,muted-umber-primary :bold t))))
 `(consult-async-running ((t (:foreground ,muted-umber-warning))))
 `(consult-async-failed ((t (:foreground ,muted-umber-error))))
 `(consult-async-finished ((t (:foreground ,muted-umber-success))))
 `(consult-async-option ((t (:foreground ,muted-umber-quaternary))))
 `(consult-narrow-indicator ((t (:foreground ,muted-umber-text-muted))))
 `(consult-imenu-prefix ((t (:inherit shadow))))
 `(consult-line-number ((t (:inherit shadow))))
 `(embark-keybinding ((t (:foreground ,muted-umber-primary :bold t))))
 `(embark-keybinding-repeat ((t (:foreground ,muted-umber-primary :bold t
                                              :underline t))))
 `(embark-keymap ((t (:foreground ,muted-umber-tertiary :bold t))))
 `(embark-target ((t (:foreground ,muted-umber-primary))))
 `(embark-selected ((t (:background ,muted-umber-selection :foreground ,muted-umber-text-bright :extend t))))
 `(embark-collect-group-title ((t (:foreground ,muted-umber-tertiary :bold t))))
 `(embark-collect-group-separator ((t (:foreground ,muted-umber-text-muted))))
 `(embark-collect-candidate ((t (:foreground ,muted-umber-text))))
 `(embark-collect-annotation ((t (:inherit completions-annotations))))
 `(embark-verbose-indicator-title ((t (:foreground ,muted-umber-primary :bold t))))
 `(embark-verbose-indicator-documentation
   ((t (:inherit completions-annotations))))
 `(embark-verbose-indicator-shadowed ((t (:foreground ,muted-umber-text-muted))))

 ;; --- dired, diredfl, dirvish -------------------------------------------------------
 `(dired-directory ((t (:foreground ,muted-umber-tertiary))))
 `(dired-symlink ((t (:foreground ,muted-umber-quaternary))))
 `(dired-broken-symlink ((t (:foreground ,muted-umber-error :bold t))))
 `(dired-flagged ((t (:foreground ,muted-umber-error
                                  :background ,muted-umber-surface))))
 `(dired-marked ((t (:foreground ,muted-umber-text-bright
                                 :background ,muted-umber-selection))))
 `(dired-mark ((t (:foreground ,muted-umber-primary :bold t))))
 `(dired-header ((t (:foreground ,muted-umber-tertiary :bold t))))
 `(dired-special ((t (:foreground ,muted-umber-text-secondary))))
 `(dired-ignored ((t (:foreground ,muted-umber-text-muted))))
 `(dired-warning ((t (:foreground ,muted-umber-warning))))
 `(diredfl-dir-heading ((t (:foreground ,muted-umber-tertiary :bold t))))
 `(diredfl-dir-name ((t (:foreground ,muted-umber-quaternary :bold t))))
 `(diredfl-dir-priv ((t (:foreground ,muted-umber-quaternary))))
 `(diredfl-file-name ((t (:foreground ,muted-umber-text))))
 `(diredfl-file-suffix ((t (:foreground ,muted-umber-text-subtle))))
 `(diredfl-date-time ((t (:inherit shadow))))
 `(diredfl-number ((t (:inherit shadow))))
 `(diredfl-symlink ((t (:foreground ,muted-umber-quaternary))))
 `(diredfl-executable-tag ((t (:foreground ,muted-umber-text-secondary))))
 `(diredfl-compressed-file-name ((t (:foreground ,muted-umber-text))))
 `(diredfl-compressed-file-suffix ((t (:foreground ,muted-umber-tertiary))))
 `(diredfl-ignored-file-name ((t (:foreground ,muted-umber-text-muted))))
 `(diredfl-flag-mark ((t (:foreground ,muted-umber-text-bright
                                       :background ,muted-umber-selection :bold t))))
 `(diredfl-flag-mark-line ((t (:background ,muted-umber-selection
                                           :foreground ,muted-umber-text-bright))))
 `(diredfl-deletion ((t (:foreground ,muted-umber-background
                                      :background ,muted-umber-error :bold t))))
 `(diredfl-deletion-file-name ((t (:foreground ,muted-umber-error))))
 `(diredfl-read-priv ((t (:inherit shadow))))
 `(diredfl-write-priv ((t (:inherit shadow))))
 `(diredfl-exec-priv ((t (:foreground ,muted-umber-text-secondary))))
 `(diredfl-no-priv ((t (:foreground ,muted-umber-text-muted))))
 `(diredfl-link-priv ((t (:foreground ,muted-umber-quaternary))))
 `(diredfl-other-priv ((t (:foreground ,muted-umber-text-muted))))
 `(diredfl-rare-priv ((t (:foreground ,muted-umber-tertiary))))
 `(dirvish-hl-line ((t (:background ,muted-umber-surface))))
 `(dirvish-hl-line-inactive ((t (:background ,muted-umber-container))))
 `(dirvish-inactive ((t (:inherit shadow))))
 `(dirvish-subtree-guide ((t (:foreground ,muted-umber-visual))))
 `(dirvish-emerge-group-title ((t (:foreground ,muted-umber-tertiary :bold t))))
 `(dirvish-narrow-match-face-0 ((t (:foreground ,muted-umber-primary :bold t))))
 `(dirvish-narrow-match-face-1 ((t (:foreground ,muted-umber-tertiary :bold t))))
 `(dirvish-narrow-match-face-2 ((t (:foreground ,muted-umber-text-secondary :bold t))))
 `(dirvish-narrow-match-face-3 ((t (:foreground ,muted-umber-quaternary :bold t))))
 `(dirvish-narrow-split ((t (:foreground ,muted-umber-text-muted))))
 `(dirvish-vc-added-state ((t (:foreground ,muted-umber-success))))
 `(dirvish-vc-edited-state ((t (:foreground ,muted-umber-warning))))
 `(dirvish-vc-conflict-state ((t (:foreground ,muted-umber-error :bold t))))
 `(dirvish-vc-removed-state ((t (:foreground ,muted-umber-text-muted))))
 `(dirvish-vc-unregistered-face ((t (:foreground ,muted-umber-text-muted))))
 `(dirvish-proc-failed ((t (:foreground ,muted-umber-error))))
 `(dirvish-proc-finished ((t (:foreground ,muted-umber-success))))
 `(dirvish-proc-running ((t (:foreground ,muted-umber-warning))))
 `(dirvish-free-space ((t (:inherit shadow))))
 `(dirvish-file-device-number ((t (:inherit shadow))))
 `(dirvish-file-group-id ((t (:inherit shadow))))
 `(dirvish-file-inode-number ((t (:inherit shadow))))
 `(dirvish-file-link-number ((t (:inherit shadow))))
 `(dirvish-file-modes ((t (:inherit shadow))))
 `(dirvish-file-size ((t (:inherit shadow))))
 `(dirvish-file-time ((t (:inherit shadow))))
 `(dirvish-file-user-id ((t (:inherit shadow))))
 `(dirvish-git-commit-message-face ((t (:foreground ,muted-umber-text))))
 `(dirvish-collapse-dir-face ((t (:foreground ,muted-umber-quaternary))))
 `(dirvish-collapse-file-face ((t (:foreground ,muted-umber-text))))
 `(dirvish-collapse-empty-dir-face ((t (:foreground ,muted-umber-text-muted))))
 `(dirvish-media-info-heading ((t (:foreground ,muted-umber-primary :bold t))))

 ;; --- diff, magit, vc ------------------------------------------------------------------
 `(diff-hl-change ((t (:foreground ,muted-umber-warning))))
 `(diff-hl-delete ((t (:foreground ,muted-umber-error))))
 `(diff-hl-insert ((t (:foreground ,muted-umber-success))))
 `(diff-added ((t (:foreground ,muted-umber-success
                               :background ,muted-umber-container))))
 `(diff-removed ((t (:foreground ,muted-umber-error
                                 :background ,muted-umber-container))))
 `(diff-changed ((t (:foreground ,muted-umber-warning))))
 `(diff-refine-added ((t (:foreground ,muted-umber-success :bold t))))
 `(diff-refine-removed ((t (:foreground ,muted-umber-error :bold t))))
 `(diff-refine-changed ((t (:foreground ,muted-umber-warning :bold t))))
 `(diff-header ((t (:foreground ,muted-umber-text-subtle))))
 `(diff-hunk-header ((t (:foreground ,muted-umber-text-subtle
                                     :background ,muted-umber-surface))))
 `(diff-file-header ((t (:foreground ,muted-umber-primary :bold t))))
 `(magit-section-highlight ((t (:background ,muted-umber-surface))))
 `(magit-section-heading ((t (:foreground ,muted-umber-primary :bold t))))
 `(magit-section-heading-selection ((t (:foreground ,muted-umber-primary))))
 `(magit-dimmed ((t (:foreground ,muted-umber-text-muted))))
 `(magit-hash ((t (:inherit shadow))))
 `(magit-header-line ((t (:foreground ,muted-umber-primary :bold t))))
 `(magit-branch-local ((t (:foreground ,muted-umber-quaternary))))
 `(magit-branch-remote ((t (:foreground ,muted-umber-tertiary))))
 `(magit-branch-current ((t (:foreground ,muted-umber-primary :bold t))))
 `(magit-tag ((t (:foreground ,muted-umber-tertiary))))
 `(magit-refname ((t (:foreground ,muted-umber-text-secondary))))
 `(magit-log-author ((t (:foreground ,muted-umber-quaternary))))
 `(magit-log-date ((t (:inherit shadow))))
 `(magit-diff-hunk-heading ((t (:foreground ,muted-umber-text-subtle
                                            :background ,muted-umber-container))))
 `(magit-diff-hunk-heading-highlight ((t (:foreground ,muted-umber-text-subtle
                                                      :background
                                                      ,muted-umber-surface))))
 `(magit-diff-added ((t (:foreground ,muted-umber-success))))
 `(magit-diff-added-highlight ((t (:foreground ,muted-umber-success
                                               :background ,muted-umber-surface))))
 `(magit-diff-removed ((t (:foreground ,muted-umber-error))))
 `(magit-diff-removed-highlight ((t (:foreground ,muted-umber-error
                                                 :background
                                                 ,muted-umber-surface))))
 `(magit-diff-context ((t (:foreground ,muted-umber-text-secondary))))
 `(magit-diff-context-highlight ((t (:foreground ,muted-umber-text
                                                 :background
                                                 ,muted-umber-surface))))
 `(magit-diff-our ((t (:foreground ,muted-umber-error))))
 `(magit-diff-their ((t (:foreground ,muted-umber-success))))
 `(magit-diff-base ((t (:foreground ,muted-umber-tertiary))))
 `(magit-diff-base-highlight ((t (:foreground ,muted-umber-tertiary
                                              :background
                                              ,muted-umber-surface))))
 `(magit-diffstat-added ((t (:foreground ,muted-umber-success))))
 `(magit-diffstat-removed ((t (:foreground ,muted-umber-error))))
 `(git-commit-summary ((t (:foreground ,muted-umber-text-bright))))
 `(ediff-current-diff-A ((t (:foreground ,muted-umber-error
                                         :background ,muted-umber-surface))))
 `(ediff-current-diff-B ((t (:foreground ,muted-umber-success
                                         :background ,muted-umber-surface))))
 `(ediff-current-diff-C ((t (:foreground ,muted-umber-warning
                                         :background ,muted-umber-surface))))
 `(ediff-current-diff-Ancestor ((t (:foreground ,muted-umber-text-subtle
                                                :background
                                                ,muted-umber-visual))))
 `(ediff-fine-diff-A ((t (:foreground ,muted-umber-error :bold t
                                      :background ,muted-umber-surface))))
 `(ediff-fine-diff-B ((t (:foreground ,muted-umber-success :bold t
                                      :background ,muted-umber-surface))))
 `(ediff-fine-diff-C ((t (:foreground ,muted-umber-warning :bold t
                                      :background ,muted-umber-surface))))
 `(ediff-fine-diff-Ancestor ((t (:foreground ,muted-umber-text-subtle
                                             :background
                                             ,muted-umber-surface))))
 `(ediff-even-diff-A ((t (:foreground ,muted-umber-text-secondary
                                      :background ,muted-umber-container))))
 `(ediff-even-diff-B ((t (:foreground ,muted-umber-text-secondary
                                      :background ,muted-umber-container))))
 `(ediff-even-diff-C ((t (:foreground ,muted-umber-text-secondary
                                      :background ,muted-umber-container))))
 `(ediff-even-diff-Ancestor ((t (:foreground ,muted-umber-text-secondary
                                             :background
                                             ,muted-umber-container))))
 `(ediff-odd-diff-A ((t (:foreground ,muted-umber-text
                                     :background ,muted-umber-surface))))
 `(ediff-odd-diff-B ((t (:foreground ,muted-umber-text
                                     :background ,muted-umber-surface))))
 `(ediff-odd-diff-C ((t (:foreground ,muted-umber-text
                                     :background ,muted-umber-surface))))
 `(ediff-odd-diff-Ancestor ((t (:foreground ,muted-umber-text
                                            :background
                                            ,muted-umber-surface))))
 `(smerge-upper ((t (:foreground ,muted-umber-error
                                 :background ,muted-umber-container))))
 `(smerge-lower ((t (:foreground ,muted-umber-success
                                 :background ,muted-umber-container))))
 `(smerge-base ((t (:foreground ,muted-umber-tertiary
                                :background ,muted-umber-container))))
 `(smerge-markers ((t (:foreground ,muted-umber-text-subtle
                                   :background ,muted-umber-surface))))
 `(smerge-refined-added ((t (:foreground ,muted-umber-success :bold t))))
 `(smerge-refined-removed ((t (:foreground ,muted-umber-error :bold t))))
 `(smerge-refined-changed ((t (:foreground ,muted-umber-warning :bold t))))
 `(git-timemachine-commit ((t (:foreground ,muted-umber-text-bright :bold t))))
 `(git-timemachine-minibuffer-author-face ((t (:foreground ,muted-umber-quaternary))))
 `(git-timemachine-minibuffer-detail-face ((t (:foreground ,muted-umber-text))))

 ;; --- org ---------------------------------------------------------------------------
 ;; Includes the +org-todo-* faces Doom's org module declares dynamically.
 ;; A TTY cannot use its unknown default background as an invisible foreground.
 `(org-hide ((t (:foreground ,muted-umber-background))))
 `(org-document-title ((t (:foreground ,muted-umber-primary :bold t :height 1.2))))
 `(org-document-info ((t (:foreground ,muted-umber-text-subtle))))
 `(org-level-1 ((t (:foreground ,muted-umber-primary :bold t))))
 `(org-level-2 ((t (:foreground ,muted-umber-quaternary :bold t))))
 `(org-level-3 ((t (:foreground ,muted-umber-tertiary))))
 `(org-level-4 ((t (:foreground ,muted-umber-text))))
 `(org-level-5 ((t (:foreground ,muted-umber-tertiary))))
 `(org-level-6 ((t (:foreground ,muted-umber-quaternary))))
 `(org-level-7 ((t (:foreground ,muted-umber-text-secondary))))
 `(org-level-8 ((t (:foreground ,muted-umber-text-subtle))))
 `(org-todo ((t (:foreground ,muted-umber-primary :bold t))))
 `(org-done ((t (:foreground ,muted-umber-success :bold t))))
 `(+org-todo-active ((t (:foreground ,muted-umber-warning :bold t))))
 `(+org-todo-onhold ((t (:foreground ,muted-umber-info :bold t))))
 `(+org-todo-cancel ((t (:foreground ,muted-umber-text-muted :strike-through t))))
 `(+org-todo-project ((t (:foreground ,muted-umber-tertiary :bold t))))
 `(org-priority ((t (:foreground ,muted-umber-warning))))
 `(org-tag ((t (:inherit shadow))))
 `(org-date ((t (:foreground ,muted-umber-text-secondary :underline t))))
 `(org-special-keyword ((t (:inherit shadow))))
 `(org-meta-line ((t (:inherit shadow))))
 `(org-drawer ((t (:inherit shadow))))
 `(org-property-value ((t (:foreground ,muted-umber-text-secondary))))
 `(org-table ((t (:foreground ,muted-umber-text-secondary))))
 `(org-formula ((t (:foreground ,muted-umber-tertiary))))
 `(org-block ((t (:background ,muted-umber-container :extend t))))
 `(org-block-begin-line ((t (:foreground ,muted-umber-text-subtle
                                          :background ,muted-umber-container
                                          :extend t))))
 `(org-block-end-line ((t (:inherit org-block-begin-line))))
 `(org-code ((t (:foreground ,muted-umber-text-secondary
                             :background ,muted-umber-container :extend nil))))
 `(org-inline-src-block ((t (:inherit org-block :extend nil))))
 `(org-verbatim ((t (:foreground ,muted-umber-text-secondary))))
 `(org-quote ((t (:inherit org-block :slant italic :extend t))))
 `(org-headline-done ((t (:foreground ,muted-umber-text-muted))))
 `(org-checkbox ((t (:foreground ,muted-umber-primary :bold t))))
 `(org-link ((t (:foreground ,muted-umber-primary :underline t))))
 `(org-footnote ((t (:foreground ,muted-umber-text-subtle))))
 `(org-ellipsis ((t (:foreground ,muted-umber-text-muted))))
 `(org-column ((t (:background ,muted-umber-surface))))
 `(org-column-title ((t (:foreground ,muted-umber-primary :bold t
                                      :background ,muted-umber-surface))))
 `(org-clock-overlay ((t (:background ,muted-umber-surface))))
 `(org-agenda-clocking ((t (:background ,muted-umber-surface))))
 `(org-agenda-structure ((t (:foreground ,muted-umber-tertiary :bold t))))
 `(org-agenda-date ((t (:foreground ,muted-umber-quaternary))))
 `(org-agenda-date-today ((t (:foreground ,muted-umber-primary :bold t))))
 `(org-agenda-date-weekend ((t (:foreground ,muted-umber-text-secondary))))
 `(org-agenda-done ((t (:foreground ,muted-umber-text-muted))))
 `(org-scheduled ((t (:foreground ,muted-umber-text))))
 `(org-scheduled-today ((t (:foreground ,muted-umber-success))))
 `(org-imminent-deadline ((t (:inherit org-warning))))
 `(org-upcoming-deadline ((t (:foreground ,muted-umber-warning))))
 `(org-time-grid ((t (:inherit shadow))))
 `(org-warning ((t (:foreground ,muted-umber-error :bold t))))

 ;; --- markdown -------------------------------------------------------------------------
 `(markdown-header-face-1 ((t (:foreground ,muted-umber-primary :bold t))))
 `(markdown-header-face-2 ((t (:foreground ,muted-umber-text-secondary :bold t))))
 `(markdown-header-face-3 ((t (:foreground ,muted-umber-tertiary))))
 `(markdown-header-face-4 ((t (:foreground ,muted-umber-quaternary))))
 `(markdown-header-face-5 ((t (:foreground ,muted-umber-tertiary))))
 `(markdown-header-face-6 ((t (:foreground ,muted-umber-quaternary))))
 `(markdown-header-delimiter-face ((t (:foreground ,muted-umber-text-muted))))
 `(markdown-header-rule-face ((t (:foreground ,muted-umber-text-muted))))
 `(markdown-hr-face ((t (:foreground ,muted-umber-text-muted))))
 `(markdown-blockquote-face ((t (:foreground ,muted-umber-tertiary :italic t))))
 `(markdown-code-face ((t (:background ,muted-umber-container
                                       :foreground ,muted-umber-text-bright
                                       :inherit fixed-pitch :extend nil))))
 `(markdown-pre-face ((t (:inherit markdown-code-face :extend t))))
 `(markdown-inline-code-face ((t (:inherit markdown-code-face
                                 :foreground ,muted-umber-text-secondary :extend nil))))
 `(markdown-language-keyword-face ((t (:foreground ,muted-umber-tertiary))))
 `(markdown-markup-face ((t (:foreground ,muted-umber-text-muted))))
 `(markdown-list-face ((t (:foreground ,muted-umber-text-secondary))))
 `(markdown-link-face ((t (:foreground ,muted-umber-quaternary))))
 `(markdown-url-face ((t (:foreground ,muted-umber-quaternary :underline t))))
 `(markdown-plain-url-face ((t (:foreground ,muted-umber-quaternary :underline t))))
 `(markdown-reference-face ((t (:foreground ,muted-umber-quaternary))))
 `(markdown-footnote-marker-face ((t (:foreground ,muted-umber-text-subtle))))
 `(markdown-metadata-key-face ((t (:foreground ,muted-umber-tertiary))))
 `(markdown-metadata-value-face ((t (:foreground ,muted-umber-text-secondary))))
 `(markdown-gfm-checkbox-face ((t (:foreground ,muted-umber-primary :bold t))))
 `(markdown-math-face ((t (:foreground ,muted-umber-quaternary))))
 `(markdown-missing-link-face ((t (:foreground ,muted-umber-error))))
 `(markdown-comment-face ((t (:inherit font-lock-comment-face))))
 `(markdown-strike-through-face ((t (:foreground ,muted-umber-text-muted
                                                 :strike-through t))))

 ;; --- info, help, custom, compilation --------------------------------------------------
 `(info-title-1 ((t (:foreground ,muted-umber-tertiary :bold t))))
 `(info-title-2 ((t (:foreground ,muted-umber-tertiary))))
 `(info-title-3 ((t (:foreground ,muted-umber-primary))))
 `(info-title-4 ((t (:foreground ,muted-umber-primary))))
 `(info-menu-header ((t (:foreground ,muted-umber-primary :bold t))))
 `(info-menu-star ((t (:foreground ,muted-umber-primary))))
 `(info-node ((t (:foreground ,muted-umber-primary :bold t))))
 `(info-header-node ((t (:foreground ,muted-umber-text-subtle))))
 `(info-header-xref ((t (:foreground ,muted-umber-quaternary))))
 `(info-xref ((t (:foreground ,muted-umber-quaternary :underline t))))
 `(info-xref-visited ((t (:foreground ,muted-umber-tertiary :underline t))))
 `(info-index-match ((t (:inherit isearch))))
 `(help-argument-name ((t (:foreground ,muted-umber-quaternary :italic t))))
 `(help-key-binding ((t (:background ,muted-umber-container
                                      :foreground ,muted-umber-text-bright :bold t))))
 `(widget-field ((t (:background ,muted-umber-container
                                 :foreground ,muted-umber-text))))
 `(widget-single-line-field ((t (:background ,muted-umber-container
                                             :foreground ,muted-umber-text))))
 `(widget-button ((t (:foreground ,muted-umber-primary :bold t))))
 `(custom-variable-tag ((t (:foreground ,muted-umber-primary :bold t))))
 `(custom-face-tag ((t (:foreground ,muted-umber-tertiary))))
 `(custom-group-tag ((t (:foreground ,muted-umber-tertiary :bold t))))
 `(custom-state ((t (:foreground ,muted-umber-success))))
 `(custom-comment ((t (:inherit font-lock-comment-face))))
 `(custom-comment-tag ((t (:foreground ,muted-umber-text-subtle))))
 `(custom-documentation ((t (:foreground ,muted-umber-text-secondary))))
 `(compilation-error ((t (:inherit error))))
 `(compilation-warning ((t (:inherit warning))))
 `(compilation-info ((t (:foreground ,muted-umber-info))))
 `(compilation-line-number ((t (:inherit shadow))))
 `(compilation-column-number ((t (:inherit shadow))))
 `(compilation-mode-line-fail ((t (:foreground ,muted-umber-error :bold t))))
 `(compilation-mode-line-exit ((t (:foreground ,muted-umber-success :bold t))))
 `(compilation-mode-line-run ((t (:foreground ,muted-umber-warning :bold t))))
 `(whitespace-trailing ((t (:background ,muted-umber-surface))))
 `(whitespace-line ((t (:background ,muted-umber-surface
                                    :foreground ,muted-umber-warning))))
 `(whitespace-space ((t (:foreground ,muted-umber-visual))))
 `(whitespace-hspace ((t (:foreground ,muted-umber-visual))))
 `(whitespace-tab ((t (:foreground ,muted-umber-visual))))
 `(whitespace-newline ((t (:foreground ,muted-umber-visual))))
 `(whitespace-indentation ((t (:foreground ,muted-umber-visual))))
 `(whitespace-empty ((t (:foreground ,muted-umber-visual))))

 ;; --- evil, search previews -----------------------------------------------------------
 `(evil-ex-substitute-matches ((t (:background ,muted-umber-selection :foreground ,muted-umber-text-bright :extend t))))
 `(evil-ex-substitute-replacement ((t (:foreground ,muted-umber-success))))
 `(evil-search-highlight-persist-highlight-face ((t (:background ,muted-umber-selection :foreground ,muted-umber-text-bright :extend t))))
 `(evil-traces-default ((t (:background ,muted-umber-surface
                                        :foreground ,muted-umber-text))))
 `(evil-traces-global-match ((t (:background ,muted-umber-surface
                                             :foreground ,muted-umber-text-bright
                                             :strike-through t))))
 `(evil-traces-global-range ((t (:background ,muted-umber-surface
                                             :foreground ,muted-umber-text-bright))))
 `(evil-traces-substitute-range ((t (:background ,muted-umber-surface
                                                 :foreground
                                                 ,muted-umber-text-bright))))
 `(evil-traces-delete ((t (:background ,muted-umber-error
                                       :foreground ,muted-umber-background :bold t))))
 `(evil-traces-change ((t (:background ,muted-umber-selection
                                       :foreground ,muted-umber-text-bright :bold t))))
 `(evil-traces-yank ((t (:background ,muted-umber-success
                                     :foreground ,muted-umber-background :bold t))))
 `(evil-traces-copy-preview ((t (:background ,muted-umber-surface
                                             :foreground ,muted-umber-text-bright))))
 `(evil-traces-copy-range ((t (:background ,muted-umber-surface
                                           :foreground ,muted-umber-text-bright))))
 `(evil-traces-move-preview ((t (:background ,muted-umber-surface))))
 `(evil-traces-move-range ((t (:background ,muted-umber-surface))))
 `(evil-traces-normal ((t (:foreground ,muted-umber-text))))
 `(evil-goggles-default-face ((t (:background ,muted-umber-surface
                                              :foreground ,muted-umber-text-bright))))
 `(evil-goggles-delete-face ((t (:background ,muted-umber-error
                                             :foreground ,muted-umber-background))))
 `(evil-goggles-change-face ((t (:background ,muted-umber-selection
                                             :foreground ,muted-umber-text-bright))))
 `(evil-goggles-yank-face ((t (:background ,muted-umber-success
                                           :foreground ,muted-umber-background))))
 `(evil-goggles-paste-face ((t (:background ,muted-umber-info
                                            :foreground ,muted-umber-background))))
 `(evil-goggles-replace-with-register-face ((t (:background ,muted-umber-selection
                                                           :foreground ,muted-umber-text-bright))))
 `(evil-goggles-surround-face ((t (:background ,muted-umber-selection
                                               :foreground ,muted-umber-text-bright))))
 `(evil-snipe-first-match-face ((t (:background ,muted-umber-selection
                                                :foreground ,muted-umber-text-bright
                                                :bold t))))
 `(evil-snipe-matches-face ((t (:background ,muted-umber-surface
                                            :foreground ,muted-umber-text-bright))))
 `(anzu-mode-line ((t (:foreground ,muted-umber-primary :bold t))))
 `(anzu-mode-line-no-match ((t (:foreground ,muted-umber-error :bold t))))
 `(anzu-replace-highlight ((t (:background ,muted-umber-surface
                                           :foreground ,muted-umber-text-bright))))
 `(anzu-replace-to ((t (:foreground ,muted-umber-success :bold t))))
 `(anzu-match-1 ((t (:foreground ,muted-umber-primary))))
 `(anzu-match-2 ((t (:foreground ,muted-umber-tertiary))))
 `(anzu-match-3 ((t (:foreground ,muted-umber-quaternary))))
 `(iedit-occurrence ((t (:background ,muted-umber-surface
                                     :foreground ,muted-umber-text-bright :bold t))))
 `(iedit-read-only-occurrence ((t (:background ,muted-umber-surface
                                               :foreground ,muted-umber-text-muted
                                               :italic t))))

 ;; --- navigation -------------------------------------------------------------------------
 `(avy-lead-face ((t (:background ,muted-umber-selection
                                  :foreground ,muted-umber-text-bright :bold t))))
 `(avy-lead-face-0 ((t (:background ,muted-umber-selection
                                    :foreground ,muted-umber-text-bright :bold t))))
 `(avy-lead-face-1 ((t (:background ,muted-umber-surface
                                    :foreground ,muted-umber-text-bright :bold t))))
 `(avy-lead-face-2 ((t (:background ,muted-umber-overlay
                                    :foreground ,muted-umber-text-bright :bold t))))
 `(avy-background-face ((t (:foreground ,muted-umber-text-muted))))
 `(avy-goto-char-timer-face ((t (:background ,muted-umber-surface
                                             :foreground
                                             ,muted-umber-text-bright :bold t))))
 `(aw-leading-char-face ((t (:foreground ,muted-umber-primary :bold t))))
 `(aw-background-face ((t (:foreground ,muted-umber-text-muted))))
 `(aw-mode-line-face ((t (:foreground ,muted-umber-primary :bold t))))
 `(aw-minibuffer-leading-char-face ((t (:foreground ,muted-umber-primary
                                                    :bold t))))

 ;; --- misc ui ------------------------------------------------------------------------------
 `(hl-todo ((t (:foreground ,muted-umber-primary :bold t))))
 `(link ((t (:foreground ,muted-umber-primary :underline t))))
 `(link-visited ((t (:foreground ,muted-umber-tertiary :underline t))))
 `(tooltip ((t (:background ,muted-umber-container
                            :foreground ,muted-umber-text))))
 `(popup-face ((t (:background ,muted-umber-container
                               :foreground ,muted-umber-text))))
 `(popup-tip-face ((t (:background ,muted-umber-surface
                                   :foreground ,muted-umber-primary))))
 `(popup-menu-selection-face ((t (:background ,muted-umber-selection :foreground ,muted-umber-text-bright :extend t))))
 `(popup-menu-summary-face ((t (:inherit shadow))))
 `(child-frame-border ((t (:background ,muted-umber-text-muted))))
 `(nav-flash-face ((t (:background ,muted-umber-surface
                                   :foreground ,muted-umber-primary))))
 `(which-key-key-face ((t (:foreground ,muted-umber-primary :bold t))))
 `(which-key-command-description-face ((t (:foreground ,muted-umber-text))))
 `(which-key-group-description-face ((t (:foreground ,muted-umber-text-subtle))))
 `(which-key-special-key-face ((t (:foreground ,muted-umber-primary :bold t))))
 `(which-key-separator-face ((t (:foreground ,muted-umber-text-muted))))
 `(which-key-note-face ((t (:inherit shadow :italic t))))
 `(dashboard-banner-logo-title ((t (:foreground ,muted-umber-primary :bold t))))
 `(doom-dashboard-default ((t (:background ,muted-umber-background :foreground ,muted-umber-text))))
 `(dashboard-items-face ((t (:foreground ,muted-umber-text))))
 `(dashboard-heading ((t (:foreground ,muted-umber-primary :bold t))))
 `(dashboard-navigator-face ((t (:foreground ,muted-umber-quaternary))))
 `(transient-key ((t (:foreground ,muted-umber-primary :bold t))))
 `(transient-heading ((t (:foreground ,muted-umber-tertiary :bold t))))
 `(transient-argument ((t (:foreground ,muted-umber-quaternary))))
 `(transient-value ((t (:foreground ,muted-umber-tertiary))))
 `(transient-inactive-argument ((t (:inherit shadow))))
 `(transient-inactive-value ((t (:inherit shadow))))
 `(transient-unreachable ((t (:foreground ,muted-umber-text-muted :strike-through t))))
 `(transient-unreachable-key ((t (:foreground ,muted-umber-text-muted))))
 `(vundo-default ((t (:foreground ,muted-umber-text))))
 `(vundo-highlight ((t (:foreground ,muted-umber-primary :bold t))))
 `(vundo-stem ((t (:foreground ,muted-umber-visual))))
 `(vundo-saved ((t (:foreground ,muted-umber-success))))
 `(vundo-last-saved ((t (:foreground ,muted-umber-success :bold t))))
 `(treesit-fold-fringe-face ((t (:foreground ,muted-umber-text-muted))))
 `(treesit-fold-replacement-face ((t (:foreground ,muted-umber-text-muted))))
 `(macrostep-expansion-highlight-face ((t (:background ,muted-umber-surface))))
 `(macrostep-macro-face ((t (:foreground ,muted-umber-primary :bold t))))
 `(macrostep-compiler-macro-face ((t (:foreground ,muted-umber-primary :bold t))))
 `(macrostep-gensym-1 ((t (:foreground ,muted-umber-primary))))
 `(macrostep-gensym-2 ((t (:foreground ,muted-umber-tertiary))))
 `(macrostep-gensym-3 ((t (:foreground ,muted-umber-text-secondary))))
 `(macrostep-gensym-4 ((t (:foreground ,muted-umber-quaternary))))
 `(macrostep-gensym-5 ((t (:foreground ,muted-umber-tertiary))))
 `(wgrep-face ((t (:foreground ,muted-umber-warning))))
 `(wgrep-done-face ((t (:foreground ,muted-umber-success))))
 `(wgrep-delete-face ((t (:foreground ,muted-umber-error :strike-through t))))
 `(wgrep-file-face ((t (:foreground ,muted-umber-text))))
 `(wgrep-reject-face ((t (:foreground ,muted-umber-error :bold t))))
 `(highlight-quoted-quote ((t (:foreground ,muted-umber-tertiary))))
 `(highlight-quoted-symbol ((t (:foreground ,muted-umber-quaternary))))
 `(eros-result-overlay-face ((t (:background ,muted-umber-container
                                             :foreground ,muted-umber-text-secondary))))
 `(yas-field-highlight-face ((t (:background ,muted-umber-surface))))
 `(dape-breakpoint-face ((t (:background ,muted-umber-error
                                         :foreground ,muted-umber-background))))
 `(dape-breakpoint-until-face ((t (:background ,muted-umber-selection
                                               :foreground ,muted-umber-text-bright))))
 `(dape-source-line-face ((t (:background ,muted-umber-surface
                                          :foreground ,muted-umber-text-bright))))
 `(dape-expression-face ((t (:foreground ,muted-umber-text-secondary))))
 `(dape-inlay-hint-face ((t (:foreground ,muted-umber-text-subtle
                                         :background ,muted-umber-surface
                                         :italic t))))
 `(dape-repl-error-face ((t (:foreground ,muted-umber-error))))
 `(dape-log-face ((t (:inherit shadow))))
 `(dape-header-line-active-face ((t (:background ,muted-umber-selection
                                                 :foreground ,muted-umber-text-bright))))
 `(dape-header-line-inactive-face ((t (:background ,muted-umber-container
                                                   :foreground
                                                   ,muted-umber-text-muted))))
 `(dape-hits-face ((t (:foreground ,muted-umber-success))))

 ;; --- nerd-icons -------------------------------------------------------------------------------
 `(nerd-icons-blue ((t (:foreground ,muted-umber-quaternary))))
 `(nerd-icons-blue-alt ((t (:foreground ,muted-umber-quaternary))))
 `(nerd-icons-cyan ((t (:foreground ,muted-umber-quaternary))))
 `(nerd-icons-cyan-alt ((t (:foreground ,muted-umber-quaternary))))
 `(nerd-icons-green ((t (:foreground ,muted-umber-text-secondary))))
 `(nerd-icons-orange ((t (:foreground ,muted-umber-primary))))
 `(nerd-icons-purple ((t (:foreground ,muted-umber-tertiary))))
 `(nerd-icons-purple-alt ((t (:foreground ,muted-umber-tertiary))))
 `(nerd-icons-red ((t (:foreground ,muted-umber-secondary))))
 `(nerd-icons-red-alt ((t (:foreground ,muted-umber-secondary))))
 `(nerd-icons-yellow ((t (:foreground ,muted-umber-tertiary))))
 `(nerd-icons-pink ((t (:foreground ,muted-umber-tertiary))))
 `(nerd-icons-maroon ((t (:foreground ,muted-umber-secondary))))
 `(nerd-icons-silver ((t (:foreground ,muted-umber-text-subtle))))
 `(nerd-icons-dblue ((t (:foreground ,muted-umber-quaternary))))
 `(nerd-icons-dcyan ((t (:foreground ,muted-umber-quaternary))))
 `(nerd-icons-dgreen ((t (:foreground ,muted-umber-text-secondary))))
 `(nerd-icons-dorange ((t (:foreground ,muted-umber-primary))))
 `(nerd-icons-dpurple ((t (:foreground ,muted-umber-tertiary))))
 `(nerd-icons-dpink ((t (:foreground ,muted-umber-tertiary))))
 `(nerd-icons-dred ((t (:foreground ,muted-umber-secondary))))
 `(nerd-icons-dyellow ((t (:foreground ,muted-umber-tertiary))))
 `(nerd-icons-dsilver ((t (:foreground ,muted-umber-text-subtle))))
 `(nerd-icons-lblue ((t (:foreground ,muted-umber-quaternary))))
 `(nerd-icons-lcyan ((t (:foreground ,muted-umber-quaternary))))
 `(nerd-icons-lgreen ((t (:foreground ,muted-umber-text-secondary))))
 `(nerd-icons-lorange ((t (:foreground ,muted-umber-primary))))
 `(nerd-icons-lpurple ((t (:foreground ,muted-umber-tertiary))))
 `(nerd-icons-lpink ((t (:foreground ,muted-umber-tertiary))))
 `(nerd-icons-lred ((t (:foreground ,muted-umber-secondary))))
 `(nerd-icons-lyellow ((t (:foreground ,muted-umber-tertiary))))
 `(nerd-icons-lsilver ((t (:foreground ,muted-umber-text-bright))))

 ;; --- lsp-mode -----------------------------------------------------------------------------------
 `(lsp-face-highlight-read ((t (:background ,muted-umber-surface))))
 `(lsp-face-highlight-textual ((t (:background ,muted-umber-surface))))
 `(lsp-face-highlight-write ((t (:background ,muted-umber-surface
                                             :box (:color ,muted-umber-primary)))))
 `(lsp-face-rename ((t (:background ,muted-umber-surface))))
 `(lsp-ui-doc-background ((t (:background ,muted-umber-container))))
 `(lsp-inlay-hint-face ((t (:foreground ,muted-umber-text-subtle
                                        :background ,muted-umber-surface
                                        :italic t))))
 `(lsp-inlay-hint-parameter-face ((t (:foreground ,muted-umber-primary
                                                 :background
                                                 ,muted-umber-surface
                                                 :italic t))))
 `(lsp-inlay-hint-type-face ((t (:foreground ,muted-umber-tertiary
                                             :background ,muted-umber-surface
                                             :italic t))))
 `(lsp-lens-face ((t (:inherit shadow))))
 `(lsp-details-face ((t (:inherit shadow :italic t))))
 `(lsp-modeline-code-actions-face ((t (:foreground ,muted-umber-warning))))
 `(lsp-signature-face ((t (:foreground ,muted-umber-text-secondary :italic t))))
 `(lsp-signature-highlight-function-argument ((t (:foreground
                                                  ,muted-umber-primary :bold t))))
 `(lsp-signature-posframe ((t (:background ,muted-umber-container
                                           :foreground ,muted-umber-text))))
 `(lsp-headerline-breadcrumb-path-face ((t (:foreground ,muted-umber-text-subtle))))
 `(lsp-headerline-breadcrumb-symbols-face ((t (:foreground ,muted-umber-primary))))
 `(lsp-headerline-breadcrumb-separator-face ((t (:foreground ,muted-umber-text-muted))))
 `(lsp-headerline-breadcrumb-project-prefix-face ((t (:foreground
                                                     ,muted-umber-tertiary))))
 `(lsp-headerline-breadcrumb-path-error-face ((t (:foreground ,muted-umber-error))))
 `(lsp-headerline-breadcrumb-path-warning-face ((t (:foreground
                                                   ,muted-umber-warning))))
 `(lsp-headerline-breadcrumb-path-info-face ((t (:foreground ,muted-umber-info))))
 `(lsp-headerline-breadcrumb-path-hint-face ((t (:foreground ,muted-umber-quaternary))))
 `(lsp-headerline-breadcrumb-symbols-error-face ((t (:foreground
                                                     ,muted-umber-error))))
 `(lsp-headerline-breadcrumb-symbols-warning-face ((t (:foreground
                                                      ,muted-umber-warning))))
 `(lsp-headerline-breadcrumb-symbols-info-face ((t (:foreground
                                                   ,muted-umber-info))))
 `(lsp-headerline-breadcrumb-symbols-hint-face ((t (:foreground
                                                   ,muted-umber-quaternary))))
 `(lsp-headerline-breadcrumb-deprecated-face ((t (:foreground ,muted-umber-text-muted
                                                              :strike-through t))))
 `(lsp-face-semhl-keyword ((t (:foreground ,muted-umber-primary))))
 `(lsp-face-semhl-string ((t (:foreground ,muted-umber-text-secondary))))
 `(lsp-face-semhl-number ((t (:foreground ,muted-umber-text-secondary))))
 `(lsp-face-semhl-constant ((t (:foreground ,muted-umber-text-secondary))))
 `(lsp-face-semhl-enum-member ((t (:foreground ,muted-umber-text-secondary))))
 `(lsp-face-semhl-function ((t (:foreground ,muted-umber-quaternary))))
 `(lsp-face-semhl-method ((t (:foreground ,muted-umber-quaternary))))
 `(lsp-face-semhl-macro ((t (:foreground ,muted-umber-tertiary))))
 `(lsp-face-semhl-variable ((t (:foreground ,muted-umber-text))))
 `(lsp-face-semhl-parameter ((t (:foreground ,muted-umber-text-bright :italic t))))
 `(lsp-face-semhl-property ((t (:foreground ,muted-umber-text-secondary))))
 `(lsp-face-semhl-member ((t (:foreground ,muted-umber-text-secondary))))
 `(lsp-face-semhl-class ((t (:foreground ,muted-umber-tertiary))))
 `(lsp-face-semhl-struct ((t (:foreground ,muted-umber-tertiary))))
 `(lsp-face-semhl-interface ((t (:foreground ,muted-umber-tertiary))))
 `(lsp-face-semhl-enum ((t (:foreground ,muted-umber-tertiary))))
 `(lsp-face-semhl-event ((t (:foreground ,muted-umber-tertiary))))
 `(lsp-face-semhl-type-parameter ((t (:foreground ,muted-umber-tertiary :italic t))))
 `(lsp-face-semhl-decorator ((t (:foreground ,muted-umber-primary))))
 `(lsp-face-semhl-namespace ((t (:foreground ,muted-umber-tertiary :bold t))))
 `(lsp-face-semhl-label ((t (:foreground ,muted-umber-tertiary))))
 `(lsp-face-semhl-operator ((t (:foreground ,muted-umber-text-subtle))))
 `(lsp-face-semhl-regexp ((t (:foreground ,muted-umber-text-secondary))))
 `(lsp-face-semhl-default-library ((t (:foreground ,muted-umber-tertiary
                                                  :italic t))))
 `(lsp-face-semhl-deprecated ((t (:strike-through t))))

)

(let ((colors '((black . "#887E78") (red . "#E07972")
                (green . "#9E8F85") (yellow . "#B4A094")
                (blue . "#C9B2A3") (magenta . "#DBC6B8")
                (cyan . "#EBDACF") (white . "#F3E9E2")
                (bright-black . "#A1968F") (bright-red . "#FF8A83")
                (bright-green . "#B3A195") (bright-yellow . "#C8B3A4")
                (bright-blue . "#DEC5B5") (bright-magenta . "#F0D9CA")
                (bright-cyan . "#FAE7DB") (bright-white . "#FCF3EE"))))
  (dolist (prefix '("ansi-color-" "term-color-" "vterm-color-"))
    (dolist (entry colors)
      (custom-theme-set-faces
       'muted-umber
       `(,(intern (concat prefix (symbol-name (car entry))))
         ((t (:foreground ,(cdr entry) :background ,(cdr entry)))))))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide 'muted-umber-theme)
(provide-theme 'muted-umber)
