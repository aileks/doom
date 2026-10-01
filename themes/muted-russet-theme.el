;;; muted-russet-theme.el -*- lexical-binding: t; -*-

(deftheme muted-russet
  "Muted Russet: warm dark grays with a russet accent."
  :background-mode 'dark
  :kind 'color-scheme)

(defgroup muted-russet nil
  "Muted Russet theme."
  :group 'faces
  :prefix "muted-russet-")

(defconst muted-russet-background     "#0A0908")
(defconst muted-russet-container      "#171412")
(defconst muted-russet-surface        "#23201C")
(defconst muted-russet-visual         "#8E8071")
(defconst muted-russet-overlay        "#2D2924")
(defconst muted-russet-text-muted     "#AA9F95")
(defconst muted-russet-text-subtle    "#AA9F95")
(defconst muted-russet-text-secondary "#C8C0B8")
(defconst muted-russet-text           "#C8C0B8")
(defconst muted-russet-text-bright    "#ECE5DE")
(defconst muted-russet-primary        "#A17869")
(defconst muted-russet-secondary      "#AC887B")
(defconst muted-russet-ui-accent      "#B8988D")
(defconst muted-russet-error          "#AC887B")
(defconst muted-russet-warning        "#C5ABA2")
(defconst muted-russet-success        "#B8988D")
(defconst muted-russet-info           "#D2BEB7")
(defconst muted-russet-tertiary       "#C5ABA2")
(defconst muted-russet-quaternary     "#DFD1CC")

(defconst muted-russet-selection "#2D2924")

(defcustom muted-russet-transparent nil
  "Use the terminal's default background when non-nil.
GUI frames always use the theme's dark canvas; set the frame
parameter `alpha-background' separately for GUI transparency.
Popup faces retain explicit backgrounds.  Reload the theme with
`load-theme' after changing this option."
  :type 'boolean
  :group 'muted-russet)

(let ((tty-background (if muted-russet-transparent "unspecified-bg" muted-russet-background)))
  (custom-theme-set-faces
   'muted-russet
   `(default ((((type tty)) (:background ,tty-background
                            :foreground ,muted-russet-text))
              (t (:background ,muted-russet-background :foreground ,muted-russet-text))))
   `(fringe ((((type tty)) (:background ,tty-background
                           :foreground ,muted-russet-text-muted))
             (t (:background ,muted-russet-background :foreground ,muted-russet-text-muted))))))

(custom-theme-set-faces
 'muted-russet

 ;; --- base -------------------------------------------------------------------
 `(cursor ((t (:background ,muted-russet-text-bright))))
 `(region ((t (:background ,muted-russet-selection :foreground ,muted-russet-text-bright :extend t))))
 `(highlight ((t (:background ,muted-russet-surface))))
 `(hl-line ((t (:background ,muted-russet-container))))
 `(secondary-selection ((t (:background ,muted-russet-selection :foreground ,muted-russet-text-bright :extend t))))
 `(vertical-border ((t (:foreground ,muted-russet-text-muted))))
 `(window-divider ((t (:foreground ,muted-russet-visual))))
 `(shadow ((t (:foreground ,muted-russet-text-subtle))))
 `(escape-glyph ((t (:foreground ,muted-russet-text-muted))))
 `(nobreak-space ((t (:foreground ,muted-russet-warning :underline t))))
 `(file-name-shadow ((t (:inherit shadow))))
 `(fill-column-indicator ((t (:foreground ,muted-russet-visual))))
 `(line-number ((t (:foreground ,muted-russet-text-muted :background unspecified))))
 `(line-number-current-line ((t (:foreground ,muted-russet-ui-accent
                                             :background ,muted-russet-surface
                                             :bold t))))
 `(minibuffer-prompt ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(trailing-whitespace ((t (:background ,muted-russet-surface))))
 `(show-paren-match ((t (:background ,muted-russet-surface :bold t))))
 `(show-paren-mismatch ((t (:foreground ,muted-russet-background
                                         :background ,muted-russet-error))))
 `(match ((t (:background ,muted-russet-surface
                          :foreground ,muted-russet-ui-accent))))

 ;; --- search -------------------------------------------------------------------
 `(isearch ((t (:background ,muted-russet-selection :foreground ,muted-russet-text-bright :extend t))))
 `(isearch-fail ((t (:foreground ,muted-russet-error :underline t))))
 `(lazy-highlight ((t (:background ,muted-russet-selection :foreground ,muted-russet-text-bright :extend t))))
 `(query-replace ((t (:background ,muted-russet-selection :foreground ,muted-russet-text-bright :extend t))))
 ;; --- mode-line, header-line, tab-bar ---------------------------------------------
 `(mode-line ((t (:background ,muted-russet-container
                              :foreground ,muted-russet-text-bright
                              :box (:color ,muted-russet-text-muted)))))
 `(mode-line-inactive ((t (:background ,muted-russet-surface
                                       :foreground ,muted-russet-text-subtle
                                       :box (:color ,muted-russet-container)))))
 `(mode-line-active ((t (:inherit mode-line))))
 `(mode-line-buffer-id ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(mode-line-highlight ((t (:foreground ,muted-russet-ui-accent))))
 `(mode-line-emphasis ((t (:foreground ,muted-russet-text-bright :bold t))))
 `(header-line ((t (:inherit mode-line))))
 `(header-line-highlight ((t (:inherit mode-line-highlight))))
 `(tab-bar ((t (:background ,muted-russet-container
                            :foreground ,muted-russet-text-subtle))))
 `(tab-bar-tab ((t (:background ,muted-russet-surface
                                :foreground ,muted-russet-text-bright :weight bold))))
 `(tab-bar-tab-inactive ((t (:background ,muted-russet-container
                                         :foreground ,muted-russet-text-subtle))))
 `(tab-bar-tab-group-current ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(tab-bar-tab-group-inactive ((t (:inherit tab-bar-tab-inactive))))
 `(tab-line ((t (:inherit tab-bar))))
 `(tab-line-tab ((t (:inherit tab-bar-tab-inactive))))
 `(tab-line-tab-current ((t (:inherit tab-bar-tab))))
 `(tab-line-tab-inactive ((t (:inherit tab-bar-tab-inactive))))
 `(tab-line-tab-inactive-alternate ((t (:inherit tab-line-tab-inactive))))
 `(tab-line-highlight ((t (:background ,muted-russet-selection :foreground ,muted-russet-text-bright :extend t))))
 `(tab-line-close-highlight ((t (:foreground ,muted-russet-ui-accent))))

 ;; --- doom-modeline ---------------------------------------------------------------
 `(doom-modeline-bar ((t (:background ,muted-russet-selection :foreground ,muted-russet-text-bright))))
 `(doom-modeline-bar-inactive ((t (:background ,muted-russet-text-muted))))
 `(doom-modeline-buffer-file ((t (:foreground ,muted-russet-text-bright))))
 `(doom-modeline-buffer-path ((t (:foreground ,muted-russet-text-bright))))
 `(doom-modeline-buffer-major-mode ((t (:foreground ,muted-russet-quaternary))))
 `(doom-modeline-buffer-minor-mode ((t (:inherit shadow))))
 `(doom-modeline-buffer-modified ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(doom-modeline-emphasis ((t (:foreground ,muted-russet-text-bright :bold t))))
 `(doom-modeline-highlight ((t (:foreground ,muted-russet-ui-accent))))
 `(doom-modeline-info ((t (:foreground ,muted-russet-info))))
 `(doom-modeline-warning ((t (:foreground ,muted-russet-warning))))
 `(doom-modeline-urgent ((t (:foreground ,muted-russet-error :bold t))))
 `(doom-modeline-debug ((t (:foreground ,muted-russet-tertiary))))
 `(doom-modeline-debug-visual ((t (:foreground ,muted-russet-tertiary :bold t))))
 `(doom-modeline-vcs-default ((t (:foreground ,muted-russet-text-secondary))))
 `(doom-modeline-lsp-error ((t (:foreground ,muted-russet-error))))
 `(doom-modeline-lsp-warning ((t (:foreground ,muted-russet-warning))))
 `(doom-modeline-lsp-success ((t (:foreground ,muted-russet-success))))
 `(doom-modeline-lsp-running ((t (:foreground ,muted-russet-warning))))
 `(doom-modeline-evil-normal-state ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(doom-modeline-evil-insert-state ((t (:foreground ,muted-russet-text-secondary :bold t))))
 `(doom-modeline-evil-visual-state ((t (:foreground ,muted-russet-tertiary :bold t))))
 `(doom-modeline-evil-replace-state ((t (:foreground ,muted-russet-secondary :bold t))))
 `(doom-modeline-evil-emacs-state ((t (:foreground ,muted-russet-quaternary :bold t))))
 `(doom-modeline-evil-motion-state ((t (:foreground ,muted-russet-quaternary :bold t))))
 `(doom-modeline-evil-operator-state ((t (:foreground ,muted-russet-tertiary :bold t))))
 `(doom-modeline-evil-user-state ((t (:foreground ,muted-russet-quaternary :bold t))))
 `(doom-modeline-battery-critical ((t (:foreground ,muted-russet-error :bold t))))
 `(doom-modeline-battery-error ((t (:foreground ,muted-russet-error))))
 `(doom-modeline-battery-warning ((t (:foreground ,muted-russet-warning))))
 `(doom-modeline-battery-charging ((t (:foreground ,muted-russet-success))))
 `(doom-modeline-battery-full ((t (:foreground ,muted-russet-success))))
 `(doom-modeline-battery-normal ((t (:foreground ,muted-russet-text-secondary))))
 `(doom-modeline-unread-number ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(doom-modeline-compilation ((t (:foreground ,muted-russet-warning))))
 `(doom-modeline-panel ((t (:background ,muted-russet-selection
                                         :foreground ,muted-russet-text-bright :bold t))))
 `(doom-modeline-persp-name ((t (:foreground ,muted-russet-tertiary))))
 `(doom-modeline-workspace-name ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(doom-modeline-persp-buffer-not-in-persp
   ((t (:inherit shadow :italic t))))
 `(doom-modeline-project-dir ((t (:foreground ,muted-russet-ui-accent))))
 `(doom-modeline-project-name ((t (:foreground ,muted-russet-ui-accent))))
 `(doom-modeline-project-parent-dir ((t (:inherit shadow))))
 `(doom-modeline-project-root-dir ((t (:inherit shadow))))
 `(doom-modeline-repl-success ((t (:foreground ,muted-russet-success))))
 `(doom-modeline-repl-warning ((t (:foreground ,muted-russet-warning))))
 `(doom-modeline-overwrite ((t (:foreground ,muted-russet-error :bold t))))
 `(doom-modeline-time ((t (:foreground ,muted-russet-text-subtle))))
 `(doom-modeline-host ((t (:foreground ,muted-russet-text-subtle))))
 `(doom-modeline-input-method ((t (:foreground ,muted-russet-text-subtle))))

 ;; --- solaire (secondary buffers) ---------------------------------------------------
 `(solaire-default-face ((t (:inherit default :background ,muted-russet-surface))))
 `(solaire-fringe-face ((t (:inherit fringe :background ,muted-russet-surface))))
 `(solaire-header-line-face ((t (:inherit header-line
                                :background ,muted-russet-surface))))
 `(solaire-hl-line-face ((t (:inherit hl-line :background ,muted-russet-surface))))
 `(solaire-line-number-face ((t (:inherit line-number
                                :background ,muted-russet-surface))))
 `(solaire-mode-line-face ((t (:inherit mode-line))))
 `(solaire-mode-line-active-face ((t (:inherit mode-line-active))))
 `(solaire-mode-line-inactive-face ((t (:inherit mode-line-inactive))))
 `(solaire-region-face ((t (:inherit region))))
 `(solaire-org-hide-face ((t (:foreground ,muted-russet-surface))))

 ;; --- font lock --------------------------------------------------------------------
 `(font-lock-comment-face ((t (:foreground ,muted-russet-text-muted :italic t))))
 `(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 `(font-lock-doc-face ((t (:foreground ,muted-russet-text-muted :italic t))))
 `(font-lock-doc-markup-face ((t (:foreground ,muted-russet-text))))
 `(font-lock-string-face ((t (:foreground ,muted-russet-text))))
 `(font-lock-keyword-face ((t (:foreground ,muted-russet-primary))))
 `(font-lock-builtin-face ((t (:foreground ,muted-russet-text))))
 `(font-lock-function-name-face ((t (:foreground ,muted-russet-text))))
 `(font-lock-function-call-face ((t (:inherit font-lock-function-name-face))))
 `(font-lock-variable-name-face ((t (:foreground ,muted-russet-text))))
 `(font-lock-variable-use-face ((t (:inherit font-lock-variable-name-face))))
 `(font-lock-constant-face ((t (:foreground ,muted-russet-text))))
 `(font-lock-type-face ((t (:foreground ,muted-russet-text))))
 `(font-lock-property-name-face ((t (:foreground ,muted-russet-text))))
 `(font-lock-property-use-face ((t (:inherit font-lock-property-name-face))))
 `(font-lock-regexp-face ((t (:inherit font-lock-string-face))))
 `(font-lock-number-face ((t (:foreground ,muted-russet-text))))
 `(font-lock-operator-face ((t (:foreground ,muted-russet-text))))
 `(font-lock-punctuation-face ((t (:foreground ,muted-russet-text))))
 `(font-lock-bracket-face ((t (:inherit font-lock-punctuation-face))))
 `(font-lock-delimiter-face ((t (:inherit font-lock-punctuation-face))))
 `(font-lock-misc-punctuation-face ((t (:inherit font-lock-punctuation-face))))
 `(font-lock-preprocessor-face ((t (:foreground ,muted-russet-primary))))
 `(font-lock-negation-char-face ((t (:foreground ,muted-russet-text))))
 `(font-lock-warning-face ((t (:foreground ,muted-russet-warning))))
 `(font-lock-escape-face ((t (:foreground ,muted-russet-text))))
 `(font-lock-regexp-grouping-backslash ((t (:inherit bold))))
 `(font-lock-regexp-grouping-construct ((t (:inherit bold))))

 ;; --- diagnostics (restrained: colored text, no noisy backgrounds) ----------------
 `(error ((t (:foreground ,muted-russet-error))))
 `(warning ((t (:foreground ,muted-russet-warning))))
 `(success ((t (:foreground ,muted-russet-success))))
 `(flycheck-error ((t (:underline (:style wave :color ,muted-russet-error)))))
 `(flycheck-warning ((t (:underline (:style wave :color ,muted-russet-warning)))))
 `(flycheck-info ((t (:underline (:style wave :color ,muted-russet-info)))))
 `(flycheck-fringe-error ((t (:inherit error))))
 `(flycheck-fringe-warning ((t (:inherit warning))))
 `(flycheck-fringe-info ((t (:inherit compilation-info))))
 `(flycheck-error-list-error ((t (:foreground ,muted-russet-error :bold t))))
 `(flycheck-error-list-warning ((t (:foreground ,muted-russet-warning :bold t))))
 `(flycheck-error-list-info ((t (:foreground ,muted-russet-info :bold t))))
 `(flycheck-error-list-line-number ((t (:inherit shadow))))
 `(flycheck-error-list-column-number ((t (:inherit shadow))))
 `(flycheck-error-list-id ((t (:foreground ,muted-russet-text-subtle))))
 `(flycheck-error-list-filename ((t (:foreground ,muted-russet-quaternary))))
 `(flymake-error ((t (:underline (:style wave :color ,muted-russet-error)))))
 `(flymake-warning ((t (:underline (:style wave :color ,muted-russet-warning)))))
 `(flymake-note ((t (:underline (:style wave :color ,muted-russet-info)))))

 ;; --- eglot ------------------------------------------------------------------------
 `(eglot-highlight-symbol-face ((t (:background ,muted-russet-surface))))
 `(eglot-diagnostic-tag-unnecessary-face ((t (:inherit shadow))))
 `(eglot-diagnostic-tag-deprecated-face ((t (:strike-through t))))
 `(eglot-inlay-hint-face ((t (:inherit shadow :height 0.8 :slant italic))))
 `(eglot-type-hint-face ((t (:inherit eglot-inlay-hint-face
                           :foreground ,muted-russet-tertiary))))
 `(eglot-parameter-hint-face ((t (:inherit eglot-inlay-hint-face
                                :foreground ,muted-russet-ui-accent))))

 ;; --- completions ---------------------------------------------------------------------
 `(completions-common-part ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(completions-first-difference ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(completions-annotations ((t (:inherit shadow :slant italic))))
 `(completions-highlight ((t (:background ,muted-russet-selection :foreground ,muted-russet-text-bright :extend t))))
 `(completions-group-title ((t (:foreground ,muted-russet-tertiary :weight bold))))
 `(completions-group-separator ((t (:foreground ,muted-russet-text-muted
                                   :strike-through t))))
 `(corfu-default ((t (:background ,muted-russet-container
                                  :foreground ,muted-russet-text))))
 `(corfu-current ((t (:background ,muted-russet-selection :foreground ,muted-russet-text-bright :extend t))))
 `(corfu-annotations ((t (:inherit completions-annotations))))
 `(corfu-deprecated ((t (:inherit shadow :strike-through t))))
 `(corfu-bar ((t (:background ,muted-russet-text-muted))))
 `(corfu-border ((t (:background ,muted-russet-selection :foreground ,muted-russet-text-bright))))
 `(corfu-echo ((t (:inherit completions-annotations))))
 `(corfu-popupinfo ((t (:background ,muted-russet-container
                                    :foreground ,muted-russet-text-secondary))))
 `(corfu-quick1 ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(corfu-quick2 ((t (:foreground ,muted-russet-tertiary :bold t))))
 `(vertico-current ((t (:background ,muted-russet-selection :foreground ,muted-russet-text-bright :extend t))))
 `(vertico-group-title ((t (:inherit completions-group-title))))
 `(vertico-group-separator ((t (:foreground ,muted-russet-text-muted))))
 `(orderless-match-face-0 ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(orderless-match-face-1 ((t (:foreground ,muted-russet-tertiary :bold t))))
 `(orderless-match-face-2 ((t (:foreground ,muted-russet-text-secondary :bold t))))
 `(orderless-match-face-3 ((t (:foreground ,muted-russet-quaternary :bold t))))
 `(marginalia-documentation ((t (:inherit completions-annotations))))
 `(marginalia-key ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(marginalia-value ((t (:foreground ,muted-russet-text-secondary))))
 `(marginalia-lighter ((t (:inherit shadow))))
 `(marginalia-modified ((t (:foreground ,muted-russet-warning))))
 `(marginalia-date ((t (:foreground ,muted-russet-quaternary))))
 `(marginalia-type ((t (:foreground ,muted-russet-quaternary))))
 `(marginalia-on ((t (:foreground ,muted-russet-success))))
 `(marginalia-off ((t (:inherit shadow))))
 `(marginalia-installed ((t (:foreground ,muted-russet-success))))
 `(marginalia-archive ((t (:inherit shadow))))
 `(marginalia-null ((t (:inherit shadow))))
 `(marginalia-number ((t (:foreground ,muted-russet-tertiary))))
 `(marginalia-function ((t (:foreground ,muted-russet-quaternary))))
 `(marginalia-symbol ((t (:foreground ,muted-russet-tertiary))))
 `(consult-help ((t (:foreground ,muted-russet-ui-accent))))
 `(consult-key ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(consult-grep-context ((t (:inherit completions-annotations))))
 `(consult-preview-line ((t (:background ,muted-russet-surface))))
 `(consult-preview-insertion ((t (:background ,muted-russet-surface))))
 `(consult-preview-match ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(consult-highlight-match ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(consult-highlight-mark ((t (:background ,muted-russet-surface))))
 `(consult-async-split ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(consult-async-running ((t (:foreground ,muted-russet-warning))))
 `(consult-async-failed ((t (:foreground ,muted-russet-error))))
 `(consult-async-finished ((t (:foreground ,muted-russet-success))))
 `(consult-async-option ((t (:foreground ,muted-russet-quaternary))))
 `(consult-narrow-indicator ((t (:foreground ,muted-russet-text-muted))))
 `(consult-imenu-prefix ((t (:inherit shadow))))
 `(consult-line-number ((t (:inherit shadow))))
 `(embark-keybinding ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(embark-keybinding-repeat ((t (:foreground ,muted-russet-ui-accent :bold t
                                              :underline t))))
 `(embark-keymap ((t (:foreground ,muted-russet-tertiary :bold t))))
 `(embark-target ((t (:foreground ,muted-russet-ui-accent))))
 `(embark-selected ((t (:background ,muted-russet-selection :foreground ,muted-russet-text-bright :extend t))))
 `(embark-collect-group-title ((t (:foreground ,muted-russet-tertiary :bold t))))
 `(embark-collect-group-separator ((t (:foreground ,muted-russet-text-muted))))
 `(embark-collect-candidate ((t (:foreground ,muted-russet-text))))
 `(embark-collect-annotation ((t (:inherit completions-annotations))))
 `(embark-verbose-indicator-title ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(embark-verbose-indicator-documentation
   ((t (:inherit completions-annotations))))
 `(embark-verbose-indicator-shadowed ((t (:foreground ,muted-russet-text-muted))))

 ;; --- dired, diredfl, dirvish -------------------------------------------------------
 `(dired-directory ((t (:foreground ,muted-russet-tertiary))))
 `(dired-symlink ((t (:foreground ,muted-russet-quaternary))))
 `(dired-broken-symlink ((t (:foreground ,muted-russet-error :bold t))))
 `(dired-flagged ((t (:foreground ,muted-russet-error
                                  :background ,muted-russet-surface))))
 `(dired-marked ((t (:foreground ,muted-russet-text-bright
                                 :background ,muted-russet-selection))))
 `(dired-mark ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(dired-header ((t (:foreground ,muted-russet-tertiary :bold t))))
 `(dired-special ((t (:foreground ,muted-russet-text-secondary))))
 `(dired-ignored ((t (:foreground ,muted-russet-text-muted))))
 `(dired-warning ((t (:foreground ,muted-russet-warning))))
 `(diredfl-dir-heading ((t (:foreground ,muted-russet-tertiary :bold t))))
 `(diredfl-dir-name ((t (:foreground ,muted-russet-quaternary :bold t))))
 `(diredfl-dir-priv ((t (:foreground ,muted-russet-quaternary))))
 `(diredfl-file-name ((t (:foreground ,muted-russet-text))))
 `(diredfl-file-suffix ((t (:foreground ,muted-russet-text-subtle))))
 `(diredfl-date-time ((t (:inherit shadow))))
 `(diredfl-number ((t (:inherit shadow))))
 `(diredfl-symlink ((t (:foreground ,muted-russet-quaternary))))
 `(diredfl-executable-tag ((t (:foreground ,muted-russet-text-secondary))))
 `(diredfl-compressed-file-name ((t (:foreground ,muted-russet-text))))
 `(diredfl-compressed-file-suffix ((t (:foreground ,muted-russet-tertiary))))
 `(diredfl-ignored-file-name ((t (:foreground ,muted-russet-text-muted))))
 `(diredfl-flag-mark ((t (:foreground ,muted-russet-text-bright
                                       :background ,muted-russet-selection :bold t))))
 `(diredfl-flag-mark-line ((t (:background ,muted-russet-selection
                                           :foreground ,muted-russet-text-bright))))
 `(diredfl-deletion ((t (:foreground ,muted-russet-background
                                      :background ,muted-russet-error :bold t))))
 `(diredfl-deletion-file-name ((t (:foreground ,muted-russet-error))))
 `(diredfl-read-priv ((t (:inherit shadow))))
 `(diredfl-write-priv ((t (:inherit shadow))))
 `(diredfl-exec-priv ((t (:foreground ,muted-russet-text-secondary))))
 `(diredfl-no-priv ((t (:foreground ,muted-russet-text-muted))))
 `(diredfl-link-priv ((t (:foreground ,muted-russet-quaternary))))
 `(diredfl-other-priv ((t (:foreground ,muted-russet-text-muted))))
 `(diredfl-rare-priv ((t (:foreground ,muted-russet-tertiary))))
 `(dirvish-hl-line ((t (:background ,muted-russet-surface))))
 `(dirvish-hl-line-inactive ((t (:background ,muted-russet-container))))
 `(dirvish-inactive ((t (:inherit shadow))))
 `(dirvish-subtree-guide ((t (:foreground ,muted-russet-visual))))
 `(dirvish-emerge-group-title ((t (:foreground ,muted-russet-tertiary :bold t))))
 `(dirvish-narrow-match-face-0 ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(dirvish-narrow-match-face-1 ((t (:foreground ,muted-russet-tertiary :bold t))))
 `(dirvish-narrow-match-face-2 ((t (:foreground ,muted-russet-text-secondary :bold t))))
 `(dirvish-narrow-match-face-3 ((t (:foreground ,muted-russet-quaternary :bold t))))
 `(dirvish-narrow-split ((t (:foreground ,muted-russet-text-muted))))
 `(dirvish-vc-added-state ((t (:foreground ,muted-russet-success))))
 `(dirvish-vc-edited-state ((t (:foreground ,muted-russet-warning))))
 `(dirvish-vc-conflict-state ((t (:foreground ,muted-russet-error :bold t))))
 `(dirvish-vc-removed-state ((t (:foreground ,muted-russet-text-muted))))
 `(dirvish-vc-unregistered-face ((t (:foreground ,muted-russet-text-muted))))
 `(dirvish-proc-failed ((t (:foreground ,muted-russet-error))))
 `(dirvish-proc-finished ((t (:foreground ,muted-russet-success))))
 `(dirvish-proc-running ((t (:foreground ,muted-russet-warning))))
 `(dirvish-free-space ((t (:inherit shadow))))
 `(dirvish-file-device-number ((t (:inherit shadow))))
 `(dirvish-file-group-id ((t (:inherit shadow))))
 `(dirvish-file-inode-number ((t (:inherit shadow))))
 `(dirvish-file-link-number ((t (:inherit shadow))))
 `(dirvish-file-modes ((t (:inherit shadow))))
 `(dirvish-file-size ((t (:inherit shadow))))
 `(dirvish-file-time ((t (:inherit shadow))))
 `(dirvish-file-user-id ((t (:inherit shadow))))
 `(dirvish-git-commit-message-face ((t (:foreground ,muted-russet-text))))
 `(dirvish-collapse-dir-face ((t (:foreground ,muted-russet-quaternary))))
 `(dirvish-collapse-file-face ((t (:foreground ,muted-russet-text))))
 `(dirvish-collapse-empty-dir-face ((t (:foreground ,muted-russet-text-muted))))
 `(dirvish-media-info-heading ((t (:foreground ,muted-russet-ui-accent :bold t))))

 ;; --- diff, magit, vc ------------------------------------------------------------------
 `(diff-hl-change ((t (:foreground ,muted-russet-warning))))
 `(diff-hl-delete ((t (:foreground ,muted-russet-error))))
 `(diff-hl-insert ((t (:foreground ,muted-russet-success))))
 `(diff-added ((t (:foreground ,muted-russet-success
                               :background ,muted-russet-container))))
 `(diff-removed ((t (:foreground ,muted-russet-error
                                 :background ,muted-russet-container))))
 `(diff-changed ((t (:foreground ,muted-russet-warning))))
 `(diff-refine-added ((t (:foreground ,muted-russet-success :bold t))))
 `(diff-refine-removed ((t (:foreground ,muted-russet-error :bold t))))
 `(diff-refine-changed ((t (:foreground ,muted-russet-warning :bold t))))
 `(diff-header ((t (:foreground ,muted-russet-text-subtle))))
 `(diff-hunk-header ((t (:foreground ,muted-russet-text-subtle
                                     :background ,muted-russet-surface))))
 `(diff-file-header ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(magit-section-highlight ((t (:background ,muted-russet-surface))))
 `(magit-section-heading ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(magit-section-heading-selection ((t (:foreground ,muted-russet-ui-accent))))
 `(magit-dimmed ((t (:foreground ,muted-russet-text-muted))))
 `(magit-hash ((t (:inherit shadow))))
 `(magit-header-line ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(magit-branch-local ((t (:foreground ,muted-russet-quaternary))))
 `(magit-branch-remote ((t (:foreground ,muted-russet-tertiary))))
 `(magit-branch-current ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(magit-tag ((t (:foreground ,muted-russet-tertiary))))
 `(magit-refname ((t (:foreground ,muted-russet-text-secondary))))
 `(magit-log-author ((t (:foreground ,muted-russet-quaternary))))
 `(magit-log-date ((t (:inherit shadow))))
 `(magit-diff-hunk-heading ((t (:foreground ,muted-russet-text-subtle
                                            :background ,muted-russet-container))))
 `(magit-diff-hunk-heading-highlight ((t (:foreground ,muted-russet-text-subtle
                                                      :background
                                                      ,muted-russet-surface))))
 `(magit-diff-added ((t (:foreground ,muted-russet-success))))
 `(magit-diff-added-highlight ((t (:foreground ,muted-russet-success
                                               :background ,muted-russet-surface))))
 `(magit-diff-removed ((t (:foreground ,muted-russet-error))))
 `(magit-diff-removed-highlight ((t (:foreground ,muted-russet-error
                                                 :background
                                                 ,muted-russet-surface))))
 `(magit-diff-context ((t (:foreground ,muted-russet-text-secondary))))
 `(magit-diff-context-highlight ((t (:foreground ,muted-russet-text
                                                 :background
                                                 ,muted-russet-surface))))
 `(magit-diff-our ((t (:foreground ,muted-russet-error))))
 `(magit-diff-their ((t (:foreground ,muted-russet-success))))
 `(magit-diff-base ((t (:foreground ,muted-russet-tertiary))))
 `(magit-diff-base-highlight ((t (:foreground ,muted-russet-tertiary
                                              :background
                                              ,muted-russet-surface))))
 `(magit-diffstat-added ((t (:foreground ,muted-russet-success))))
 `(magit-diffstat-removed ((t (:foreground ,muted-russet-error))))
 `(git-commit-summary ((t (:foreground ,muted-russet-text-bright))))
 `(ediff-current-diff-A ((t (:foreground ,muted-russet-error
                                         :background ,muted-russet-surface))))
 `(ediff-current-diff-B ((t (:foreground ,muted-russet-success
                                         :background ,muted-russet-surface))))
 `(ediff-current-diff-C ((t (:foreground ,muted-russet-warning
                                         :background ,muted-russet-surface))))
 `(ediff-current-diff-Ancestor ((t (:foreground ,muted-russet-text-subtle
                                                :background
                                                ,muted-russet-visual))))
 `(ediff-fine-diff-A ((t (:foreground ,muted-russet-error :bold t
                                      :background ,muted-russet-surface))))
 `(ediff-fine-diff-B ((t (:foreground ,muted-russet-success :bold t
                                      :background ,muted-russet-surface))))
 `(ediff-fine-diff-C ((t (:foreground ,muted-russet-warning :bold t
                                      :background ,muted-russet-surface))))
 `(ediff-fine-diff-Ancestor ((t (:foreground ,muted-russet-text-subtle
                                             :background
                                             ,muted-russet-surface))))
 `(ediff-even-diff-A ((t (:foreground ,muted-russet-text-secondary
                                      :background ,muted-russet-container))))
 `(ediff-even-diff-B ((t (:foreground ,muted-russet-text-secondary
                                      :background ,muted-russet-container))))
 `(ediff-even-diff-C ((t (:foreground ,muted-russet-text-secondary
                                      :background ,muted-russet-container))))
 `(ediff-even-diff-Ancestor ((t (:foreground ,muted-russet-text-secondary
                                             :background
                                             ,muted-russet-container))))
 `(ediff-odd-diff-A ((t (:foreground ,muted-russet-text
                                     :background ,muted-russet-surface))))
 `(ediff-odd-diff-B ((t (:foreground ,muted-russet-text
                                     :background ,muted-russet-surface))))
 `(ediff-odd-diff-C ((t (:foreground ,muted-russet-text
                                     :background ,muted-russet-surface))))
 `(ediff-odd-diff-Ancestor ((t (:foreground ,muted-russet-text
                                            :background
                                            ,muted-russet-surface))))
 `(smerge-upper ((t (:foreground ,muted-russet-error
                                 :background ,muted-russet-container))))
 `(smerge-lower ((t (:foreground ,muted-russet-success
                                 :background ,muted-russet-container))))
 `(smerge-base ((t (:foreground ,muted-russet-tertiary
                                :background ,muted-russet-container))))
 `(smerge-markers ((t (:foreground ,muted-russet-text-subtle
                                   :background ,muted-russet-surface))))
 `(smerge-refined-added ((t (:foreground ,muted-russet-success :bold t))))
 `(smerge-refined-removed ((t (:foreground ,muted-russet-error :bold t))))
 `(smerge-refined-changed ((t (:foreground ,muted-russet-warning :bold t))))
 `(git-timemachine-commit ((t (:foreground ,muted-russet-text-bright :bold t))))
 `(git-timemachine-minibuffer-author-face ((t (:foreground ,muted-russet-quaternary))))
 `(git-timemachine-minibuffer-detail-face ((t (:foreground ,muted-russet-text))))

 ;; --- org ---------------------------------------------------------------------------
 ;; Includes the +org-todo-* faces Doom's org module declares dynamically.
 ;; A TTY cannot use its unknown default background as an invisible foreground.
 `(org-hide ((t (:foreground ,muted-russet-background))))
 `(org-document-title ((t (:foreground ,muted-russet-ui-accent :bold t :height 1.2))))
 `(org-document-info ((t (:foreground ,muted-russet-text-subtle))))
 `(org-level-1 ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(org-level-2 ((t (:foreground ,muted-russet-quaternary :bold t))))
 `(org-level-3 ((t (:foreground ,muted-russet-tertiary))))
 `(org-level-4 ((t (:foreground ,muted-russet-text))))
 `(org-level-5 ((t (:foreground ,muted-russet-tertiary))))
 `(org-level-6 ((t (:foreground ,muted-russet-quaternary))))
 `(org-level-7 ((t (:foreground ,muted-russet-text-secondary))))
 `(org-level-8 ((t (:foreground ,muted-russet-text-subtle))))
 `(org-todo ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(org-done ((t (:foreground ,muted-russet-success :bold t))))
 `(+org-todo-active ((t (:foreground ,muted-russet-warning :bold t))))
 `(+org-todo-onhold ((t (:foreground ,muted-russet-info :bold t))))
 `(+org-todo-cancel ((t (:foreground ,muted-russet-text-muted :strike-through t))))
 `(+org-todo-project ((t (:foreground ,muted-russet-tertiary :bold t))))
 `(org-priority ((t (:foreground ,muted-russet-warning))))
 `(org-tag ((t (:inherit shadow))))
 `(org-date ((t (:foreground ,muted-russet-text-secondary :underline t))))
 `(org-special-keyword ((t (:inherit shadow))))
 `(org-meta-line ((t (:inherit shadow))))
 `(org-drawer ((t (:inherit shadow))))
 `(org-property-value ((t (:foreground ,muted-russet-text-secondary))))
 `(org-table ((t (:foreground ,muted-russet-text-secondary))))
 `(org-formula ((t (:foreground ,muted-russet-tertiary))))
 `(org-block ((t (:background ,muted-russet-container :extend t))))
 `(org-block-begin-line ((t (:foreground ,muted-russet-text-subtle
                                          :background ,muted-russet-container
                                          :extend t))))
 `(org-block-end-line ((t (:inherit org-block-begin-line))))
 `(org-code ((t (:foreground ,muted-russet-text-secondary
                             :background ,muted-russet-container :extend nil))))
 `(org-inline-src-block ((t (:inherit org-block :extend nil))))
 `(org-verbatim ((t (:foreground ,muted-russet-text-secondary))))
 `(org-quote ((t (:inherit org-block :slant italic :extend t))))
 `(org-headline-done ((t (:foreground ,muted-russet-text-muted))))
 `(org-checkbox ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(org-link ((t (:foreground ,muted-russet-ui-accent :underline t))))
 `(org-footnote ((t (:foreground ,muted-russet-text-subtle))))
 `(org-ellipsis ((t (:foreground ,muted-russet-text-muted))))
 `(org-column ((t (:background ,muted-russet-surface))))
 `(org-column-title ((t (:foreground ,muted-russet-ui-accent :bold t
                                      :background ,muted-russet-surface))))
 `(org-clock-overlay ((t (:background ,muted-russet-surface))))
 `(org-agenda-clocking ((t (:background ,muted-russet-surface))))
 `(org-agenda-structure ((t (:foreground ,muted-russet-tertiary :bold t))))
 `(org-agenda-date ((t (:foreground ,muted-russet-quaternary))))
 `(org-agenda-date-today ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(org-agenda-date-weekend ((t (:foreground ,muted-russet-text-secondary))))
 `(org-agenda-done ((t (:foreground ,muted-russet-text-muted))))
 `(org-scheduled ((t (:foreground ,muted-russet-text))))
 `(org-scheduled-today ((t (:foreground ,muted-russet-success))))
 `(org-imminent-deadline ((t (:inherit org-warning))))
 `(org-upcoming-deadline ((t (:foreground ,muted-russet-warning))))
 `(org-time-grid ((t (:inherit shadow))))
 `(org-warning ((t (:foreground ,muted-russet-error :bold t))))

 ;; --- markdown -------------------------------------------------------------------------
 `(markdown-header-face-1 ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(markdown-header-face-2 ((t (:foreground ,muted-russet-text-secondary :bold t))))
 `(markdown-header-face-3 ((t (:foreground ,muted-russet-tertiary))))
 `(markdown-header-face-4 ((t (:foreground ,muted-russet-quaternary))))
 `(markdown-header-face-5 ((t (:foreground ,muted-russet-tertiary))))
 `(markdown-header-face-6 ((t (:foreground ,muted-russet-quaternary))))
 `(markdown-header-delimiter-face ((t (:foreground ,muted-russet-text-muted))))
 `(markdown-header-rule-face ((t (:foreground ,muted-russet-text-muted))))
 `(markdown-hr-face ((t (:foreground ,muted-russet-text-muted))))
 `(markdown-blockquote-face ((t (:foreground ,muted-russet-tertiary :italic t))))
 `(markdown-code-face ((t (:background ,muted-russet-container
                                       :foreground ,muted-russet-text-bright
                                       :inherit fixed-pitch :extend nil))))
 `(markdown-pre-face ((t (:inherit markdown-code-face :extend t))))
 `(markdown-inline-code-face ((t (:inherit markdown-code-face
                                 :foreground ,muted-russet-text-secondary :extend nil))))
 `(markdown-language-keyword-face ((t (:foreground ,muted-russet-tertiary))))
 `(markdown-markup-face ((t (:foreground ,muted-russet-text-muted))))
 `(markdown-list-face ((t (:foreground ,muted-russet-text-secondary))))
 `(markdown-link-face ((t (:foreground ,muted-russet-quaternary))))
 `(markdown-url-face ((t (:foreground ,muted-russet-quaternary :underline t))))
 `(markdown-plain-url-face ((t (:foreground ,muted-russet-quaternary :underline t))))
 `(markdown-reference-face ((t (:foreground ,muted-russet-quaternary))))
 `(markdown-footnote-marker-face ((t (:foreground ,muted-russet-text-subtle))))
 `(markdown-metadata-key-face ((t (:foreground ,muted-russet-tertiary))))
 `(markdown-metadata-value-face ((t (:foreground ,muted-russet-text-secondary))))
 `(markdown-gfm-checkbox-face ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(markdown-math-face ((t (:foreground ,muted-russet-quaternary))))
 `(markdown-missing-link-face ((t (:foreground ,muted-russet-error))))
 `(markdown-comment-face ((t (:inherit font-lock-comment-face))))
 `(markdown-strike-through-face ((t (:foreground ,muted-russet-text-muted
                                                 :strike-through t))))

 ;; --- info, help, custom, compilation --------------------------------------------------
 `(info-title-1 ((t (:foreground ,muted-russet-tertiary :bold t))))
 `(info-title-2 ((t (:foreground ,muted-russet-tertiary))))
 `(info-title-3 ((t (:foreground ,muted-russet-ui-accent))))
 `(info-title-4 ((t (:foreground ,muted-russet-ui-accent))))
 `(info-menu-header ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(info-menu-star ((t (:foreground ,muted-russet-ui-accent))))
 `(info-node ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(info-header-node ((t (:foreground ,muted-russet-text-subtle))))
 `(info-header-xref ((t (:foreground ,muted-russet-quaternary))))
 `(info-xref ((t (:foreground ,muted-russet-quaternary :underline t))))
 `(info-xref-visited ((t (:foreground ,muted-russet-tertiary :underline t))))
 `(info-index-match ((t (:inherit isearch))))
 `(help-argument-name ((t (:foreground ,muted-russet-quaternary :italic t))))
 `(help-key-binding ((t (:background ,muted-russet-container
                                      :foreground ,muted-russet-text-bright :bold t))))
 `(widget-field ((t (:background ,muted-russet-container
                                 :foreground ,muted-russet-text))))
 `(widget-single-line-field ((t (:background ,muted-russet-container
                                             :foreground ,muted-russet-text))))
 `(widget-button ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(custom-variable-tag ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(custom-face-tag ((t (:foreground ,muted-russet-tertiary))))
 `(custom-group-tag ((t (:foreground ,muted-russet-tertiary :bold t))))
 `(custom-state ((t (:foreground ,muted-russet-success))))
 `(custom-comment ((t (:inherit font-lock-comment-face))))
 `(custom-comment-tag ((t (:foreground ,muted-russet-text-subtle))))
 `(custom-documentation ((t (:foreground ,muted-russet-text-secondary))))
 `(compilation-error ((t (:inherit error))))
 `(compilation-warning ((t (:inherit warning))))
 `(compilation-info ((t (:foreground ,muted-russet-info))))
 `(compilation-line-number ((t (:inherit shadow))))
 `(compilation-column-number ((t (:inherit shadow))))
 `(compilation-mode-line-fail ((t (:foreground ,muted-russet-error :bold t))))
 `(compilation-mode-line-exit ((t (:foreground ,muted-russet-success :bold t))))
 `(compilation-mode-line-run ((t (:foreground ,muted-russet-warning :bold t))))
 `(whitespace-trailing ((t (:background ,muted-russet-surface))))
 `(whitespace-line ((t (:background ,muted-russet-surface
                                    :foreground ,muted-russet-warning))))
 `(whitespace-space ((t (:foreground ,muted-russet-visual))))
 `(whitespace-hspace ((t (:foreground ,muted-russet-visual))))
 `(whitespace-tab ((t (:foreground ,muted-russet-visual))))
 `(whitespace-newline ((t (:foreground ,muted-russet-visual))))
 `(whitespace-indentation ((t (:foreground ,muted-russet-visual))))
 `(whitespace-empty ((t (:foreground ,muted-russet-visual))))

 ;; --- evil, search previews -----------------------------------------------------------
 `(evil-ex-substitute-matches ((t (:background ,muted-russet-selection :foreground ,muted-russet-text-bright :extend t))))
 `(evil-ex-substitute-replacement ((t (:foreground ,muted-russet-success))))
 `(evil-search-highlight-persist-highlight-face ((t (:background ,muted-russet-selection :foreground ,muted-russet-text-bright :extend t))))
 `(evil-traces-default ((t (:background ,muted-russet-surface
                                        :foreground ,muted-russet-text))))
 `(evil-traces-global-match ((t (:background ,muted-russet-surface
                                             :foreground ,muted-russet-text-bright
                                             :strike-through t))))
 `(evil-traces-global-range ((t (:background ,muted-russet-surface
                                             :foreground ,muted-russet-text-bright))))
 `(evil-traces-substitute-range ((t (:background ,muted-russet-surface
                                                 :foreground
                                                 ,muted-russet-text-bright))))
 `(evil-traces-delete ((t (:background ,muted-russet-error
                                       :foreground ,muted-russet-background :bold t))))
 `(evil-traces-change ((t (:background ,muted-russet-selection
                                       :foreground ,muted-russet-text-bright :bold t))))
 `(evil-traces-yank ((t (:background ,muted-russet-success
                                     :foreground ,muted-russet-background :bold t))))
 `(evil-traces-copy-preview ((t (:background ,muted-russet-surface
                                             :foreground ,muted-russet-text-bright))))
 `(evil-traces-copy-range ((t (:background ,muted-russet-surface
                                           :foreground ,muted-russet-text-bright))))
 `(evil-traces-move-preview ((t (:background ,muted-russet-surface))))
 `(evil-traces-move-range ((t (:background ,muted-russet-surface))))
 `(evil-traces-normal ((t (:foreground ,muted-russet-text))))
 `(evil-goggles-default-face ((t (:background ,muted-russet-surface
                                              :foreground ,muted-russet-text-bright))))
 `(evil-goggles-delete-face ((t (:background ,muted-russet-error
                                             :foreground ,muted-russet-background))))
 `(evil-goggles-change-face ((t (:background ,muted-russet-selection
                                             :foreground ,muted-russet-text-bright))))
 `(evil-goggles-yank-face ((t (:background ,muted-russet-success
                                           :foreground ,muted-russet-background))))
 `(evil-goggles-paste-face ((t (:background ,muted-russet-info
                                            :foreground ,muted-russet-background))))
 `(evil-goggles-replace-with-register-face ((t (:background ,muted-russet-selection
                                                           :foreground ,muted-russet-text-bright))))
 `(evil-goggles-surround-face ((t (:background ,muted-russet-selection
                                               :foreground ,muted-russet-text-bright))))
 `(evil-snipe-first-match-face ((t (:background ,muted-russet-selection
                                                :foreground ,muted-russet-text-bright
                                                :bold t))))
 `(evil-snipe-matches-face ((t (:background ,muted-russet-surface
                                            :foreground ,muted-russet-text-bright))))
 `(anzu-mode-line ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(anzu-mode-line-no-match ((t (:foreground ,muted-russet-error :bold t))))
 `(anzu-replace-highlight ((t (:background ,muted-russet-surface
                                           :foreground ,muted-russet-text-bright))))
 `(anzu-replace-to ((t (:foreground ,muted-russet-success :bold t))))
 `(anzu-match-1 ((t (:foreground ,muted-russet-ui-accent))))
 `(anzu-match-2 ((t (:foreground ,muted-russet-tertiary))))
 `(anzu-match-3 ((t (:foreground ,muted-russet-quaternary))))
 `(iedit-occurrence ((t (:background ,muted-russet-surface
                                     :foreground ,muted-russet-text-bright :bold t))))
 `(iedit-read-only-occurrence ((t (:background ,muted-russet-surface
                                               :foreground ,muted-russet-text-muted
                                               :italic t))))

 ;; --- navigation -------------------------------------------------------------------------
 `(avy-lead-face ((t (:background ,muted-russet-selection
                                  :foreground ,muted-russet-text-bright :bold t))))
 `(avy-lead-face-0 ((t (:background ,muted-russet-selection
                                    :foreground ,muted-russet-text-bright :bold t))))
 `(avy-lead-face-1 ((t (:background ,muted-russet-surface
                                    :foreground ,muted-russet-text-bright :bold t))))
 `(avy-lead-face-2 ((t (:background ,muted-russet-overlay
                                    :foreground ,muted-russet-text-bright :bold t))))
 `(avy-background-face ((t (:foreground ,muted-russet-text-muted))))
 `(avy-goto-char-timer-face ((t (:background ,muted-russet-surface
                                             :foreground
                                             ,muted-russet-text-bright :bold t))))
 `(aw-leading-char-face ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(aw-background-face ((t (:foreground ,muted-russet-text-muted))))
 `(aw-mode-line-face ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(aw-minibuffer-leading-char-face ((t (:foreground ,muted-russet-ui-accent
                                                    :bold t))))

 ;; --- misc ui ------------------------------------------------------------------------------
 `(hl-todo ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(link ((t (:foreground ,muted-russet-ui-accent :underline t))))
 `(link-visited ((t (:foreground ,muted-russet-tertiary :underline t))))
 `(tooltip ((t (:background ,muted-russet-container
                            :foreground ,muted-russet-text))))
 `(popup-face ((t (:background ,muted-russet-container
                               :foreground ,muted-russet-text))))
 `(popup-tip-face ((t (:background ,muted-russet-surface
                                   :foreground ,muted-russet-ui-accent))))
 `(popup-menu-selection-face ((t (:background ,muted-russet-selection :foreground ,muted-russet-text-bright :extend t))))
 `(popup-menu-summary-face ((t (:inherit shadow))))
 `(child-frame-border ((t (:background ,muted-russet-text-muted))))
 `(nav-flash-face ((t (:background ,muted-russet-surface
                                   :foreground ,muted-russet-ui-accent))))
 `(which-key-key-face ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(which-key-command-description-face ((t (:foreground ,muted-russet-text))))
 `(which-key-group-description-face ((t (:foreground ,muted-russet-text-subtle))))
 `(which-key-special-key-face ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(which-key-separator-face ((t (:foreground ,muted-russet-text-muted))))
 `(which-key-note-face ((t (:inherit shadow :italic t))))
 `(dashboard-banner-logo-title ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(doom-dashboard-default ((t (:background ,muted-russet-background :foreground ,muted-russet-text))))
 `(dashboard-items-face ((t (:foreground ,muted-russet-text))))
 `(dashboard-heading ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(dashboard-navigator-face ((t (:foreground ,muted-russet-quaternary))))
 `(transient-key ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(transient-heading ((t (:foreground ,muted-russet-tertiary :bold t))))
 `(transient-argument ((t (:foreground ,muted-russet-quaternary))))
 `(transient-value ((t (:foreground ,muted-russet-tertiary))))
 `(transient-inactive-argument ((t (:inherit shadow))))
 `(transient-inactive-value ((t (:inherit shadow))))
 `(transient-unreachable ((t (:foreground ,muted-russet-text-muted :strike-through t))))
 `(transient-unreachable-key ((t (:foreground ,muted-russet-text-muted))))
 `(vundo-default ((t (:foreground ,muted-russet-text))))
 `(vundo-highlight ((t (:foreground ,muted-russet-ui-accent :bold t))))
 `(vundo-stem ((t (:foreground ,muted-russet-visual))))
 `(vundo-saved ((t (:foreground ,muted-russet-success))))
 `(vundo-last-saved ((t (:foreground ,muted-russet-success :bold t))))
 `(treesit-fold-fringe-face ((t (:foreground ,muted-russet-text-muted))))
 `(treesit-fold-replacement-face ((t (:foreground ,muted-russet-text-muted))))
 `(macrostep-expansion-highlight-face ((t (:background ,muted-russet-surface))))
 `(macrostep-macro-face ((t (:foreground ,muted-russet-text :bold t))))
 `(macrostep-compiler-macro-face ((t (:foreground ,muted-russet-text :bold t))))
 `(macrostep-gensym-1 ((t (:foreground ,muted-russet-text))))
 `(macrostep-gensym-2 ((t (:foreground ,muted-russet-text))))
 `(macrostep-gensym-3 ((t (:foreground ,muted-russet-text))))
 `(macrostep-gensym-4 ((t (:foreground ,muted-russet-text))))
 `(macrostep-gensym-5 ((t (:foreground ,muted-russet-text))))
 `(wgrep-face ((t (:foreground ,muted-russet-warning))))
 `(wgrep-done-face ((t (:foreground ,muted-russet-success))))
 `(wgrep-delete-face ((t (:foreground ,muted-russet-error :strike-through t))))
 `(wgrep-file-face ((t (:foreground ,muted-russet-text))))
 `(wgrep-reject-face ((t (:foreground ,muted-russet-error :bold t))))
 `(highlight-quoted-quote ((t (:foreground ,muted-russet-text))))
 `(highlight-quoted-symbol ((t (:foreground ,muted-russet-text))))
 `(eros-result-overlay-face ((t (:background ,muted-russet-container
                                             :foreground ,muted-russet-text-secondary))))
 `(yas-field-highlight-face ((t (:background ,muted-russet-surface))))
 `(dape-breakpoint-face ((t (:background ,muted-russet-error
                                         :foreground ,muted-russet-background))))
 `(dape-breakpoint-until-face ((t (:background ,muted-russet-selection
                                               :foreground ,muted-russet-text-bright))))
 `(dape-source-line-face ((t (:background ,muted-russet-surface
                                          :foreground ,muted-russet-text-bright))))
 `(dape-expression-face ((t (:foreground ,muted-russet-text-secondary))))
 `(dape-inlay-hint-face ((t (:foreground ,muted-russet-text-subtle
                                         :background ,muted-russet-surface
                                         :italic t))))
 `(dape-repl-error-face ((t (:foreground ,muted-russet-error))))
 `(dape-log-face ((t (:inherit shadow))))
 `(dape-header-line-active-face ((t (:background ,muted-russet-selection
                                                 :foreground ,muted-russet-text-bright))))
 `(dape-header-line-inactive-face ((t (:background ,muted-russet-container
                                                   :foreground
                                                   ,muted-russet-text-muted))))
 `(dape-hits-face ((t (:foreground ,muted-russet-success))))

 ;; --- nerd-icons -------------------------------------------------------------------------------
 `(nerd-icons-blue ((t (:foreground ,muted-russet-quaternary))))
 `(nerd-icons-blue-alt ((t (:foreground ,muted-russet-quaternary))))
 `(nerd-icons-cyan ((t (:foreground ,muted-russet-quaternary))))
 `(nerd-icons-cyan-alt ((t (:foreground ,muted-russet-quaternary))))
 `(nerd-icons-green ((t (:foreground ,muted-russet-text-secondary))))
 `(nerd-icons-orange ((t (:foreground ,muted-russet-ui-accent))))
 `(nerd-icons-purple ((t (:foreground ,muted-russet-tertiary))))
 `(nerd-icons-purple-alt ((t (:foreground ,muted-russet-tertiary))))
 `(nerd-icons-red ((t (:foreground ,muted-russet-secondary))))
 `(nerd-icons-red-alt ((t (:foreground ,muted-russet-secondary))))
 `(nerd-icons-yellow ((t (:foreground ,muted-russet-tertiary))))
 `(nerd-icons-pink ((t (:foreground ,muted-russet-tertiary))))
 `(nerd-icons-maroon ((t (:foreground ,muted-russet-secondary))))
 `(nerd-icons-silver ((t (:foreground ,muted-russet-text-subtle))))
 `(nerd-icons-dblue ((t (:foreground ,muted-russet-quaternary))))
 `(nerd-icons-dcyan ((t (:foreground ,muted-russet-quaternary))))
 `(nerd-icons-dgreen ((t (:foreground ,muted-russet-text-secondary))))
 `(nerd-icons-dorange ((t (:foreground ,muted-russet-ui-accent))))
 `(nerd-icons-dpurple ((t (:foreground ,muted-russet-tertiary))))
 `(nerd-icons-dpink ((t (:foreground ,muted-russet-tertiary))))
 `(nerd-icons-dred ((t (:foreground ,muted-russet-secondary))))
 `(nerd-icons-dyellow ((t (:foreground ,muted-russet-tertiary))))
 `(nerd-icons-dsilver ((t (:foreground ,muted-russet-text-subtle))))
 `(nerd-icons-lblue ((t (:foreground ,muted-russet-quaternary))))
 `(nerd-icons-lcyan ((t (:foreground ,muted-russet-quaternary))))
 `(nerd-icons-lgreen ((t (:foreground ,muted-russet-text-secondary))))
 `(nerd-icons-lorange ((t (:foreground ,muted-russet-ui-accent))))
 `(nerd-icons-lpurple ((t (:foreground ,muted-russet-tertiary))))
 `(nerd-icons-lpink ((t (:foreground ,muted-russet-tertiary))))
 `(nerd-icons-lred ((t (:foreground ,muted-russet-secondary))))
 `(nerd-icons-lyellow ((t (:foreground ,muted-russet-tertiary))))
 `(nerd-icons-lsilver ((t (:foreground ,muted-russet-text-bright))))

 ;; --- lsp-mode -----------------------------------------------------------------------------------
 `(lsp-face-highlight-read ((t (:background ,muted-russet-surface))))
 `(lsp-face-highlight-textual ((t (:background ,muted-russet-surface))))
 `(lsp-face-highlight-write ((t (:background ,muted-russet-surface
                                             :box (:color ,muted-russet-primary)))))
 `(lsp-face-rename ((t (:background ,muted-russet-surface))))
 `(lsp-ui-doc-background ((t (:background ,muted-russet-container))))
 `(lsp-inlay-hint-face ((t (:foreground ,muted-russet-text-subtle
                                        :background ,muted-russet-surface
                                        :italic t))))
 `(lsp-inlay-hint-parameter-face ((t (:foreground ,muted-russet-text-muted
                                                 :background
                                                 ,muted-russet-surface
                                                 :italic t))))
 `(lsp-inlay-hint-type-face ((t (:foreground ,muted-russet-text-muted
                                             :background ,muted-russet-surface
                                             :italic t))))
 `(lsp-lens-face ((t (:inherit shadow))))
 `(lsp-details-face ((t (:inherit shadow :italic t))))
 `(lsp-modeline-code-actions-face ((t (:foreground ,muted-russet-warning))))
 `(lsp-signature-face ((t (:foreground ,muted-russet-text-secondary :italic t))))
 `(lsp-signature-highlight-function-argument ((t (:foreground
                                                  ,muted-russet-primary :bold t))))
 `(lsp-signature-posframe ((t (:background ,muted-russet-container
                                           :foreground ,muted-russet-text))))
 `(lsp-headerline-breadcrumb-path-face ((t (:foreground ,muted-russet-text-subtle))))
 `(lsp-headerline-breadcrumb-symbols-face ((t (:foreground ,muted-russet-ui-accent))))
 `(lsp-headerline-breadcrumb-separator-face ((t (:foreground ,muted-russet-text-muted))))
 `(lsp-headerline-breadcrumb-project-prefix-face ((t (:foreground
                                                     ,muted-russet-tertiary))))
 `(lsp-headerline-breadcrumb-path-error-face ((t (:foreground ,muted-russet-error))))
 `(lsp-headerline-breadcrumb-path-warning-face ((t (:foreground
                                                   ,muted-russet-warning))))
 `(lsp-headerline-breadcrumb-path-info-face ((t (:foreground ,muted-russet-info))))
 `(lsp-headerline-breadcrumb-path-hint-face ((t (:foreground ,muted-russet-quaternary))))
 `(lsp-headerline-breadcrumb-symbols-error-face ((t (:foreground
                                                     ,muted-russet-error))))
 `(lsp-headerline-breadcrumb-symbols-warning-face ((t (:foreground
                                                      ,muted-russet-warning))))
 `(lsp-headerline-breadcrumb-symbols-info-face ((t (:foreground
                                                   ,muted-russet-info))))
 `(lsp-headerline-breadcrumb-symbols-hint-face ((t (:foreground
                                                   ,muted-russet-quaternary))))
 `(lsp-headerline-breadcrumb-deprecated-face ((t (:foreground ,muted-russet-text-muted
                                                              :strike-through t))))
 `(lsp-face-semhl-keyword ((t (:foreground ,muted-russet-primary))))
 `(lsp-face-semhl-string ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-number ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-constant ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-enum-member ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-function ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-method ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-macro ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-variable ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-parameter ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-property ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-member ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-class ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-struct ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-interface ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-enum ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-event ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-type-parameter ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-decorator ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-namespace ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-label ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-operator ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-regexp ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-default-library ((t (:foreground ,muted-russet-text))))
 `(lsp-face-semhl-deprecated ((t (:strike-through t))))

)

(let ((colors '((black . "#1A1715") (red . "#956F6B")
                (green . "#788578") (yellow . "#928569")
                (blue . "#74818B") (magenta . "#85778A")
                (cyan . "#6F8782") (white . "#C8C0B8")
                (bright-black . "#655F5A") (bright-red . "#AD807A")
                (bright-green . "#8C998B") (bright-yellow . "#A99A7A")
                (bright-blue . "#87949E") (bright-magenta . "#998A9E")
                (bright-cyan . "#829A94") (bright-white . "#ECE5DE"))))
  (dolist (prefix '("ansi-color-" "term-color-" "vterm-color-"))
    (dolist (entry colors)
      (custom-theme-set-faces
       'muted-russet
       `(,(intern (concat prefix (symbol-name (car entry))))
         ((t (:foreground ,(cdr entry) :background ,(cdr entry)))))))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide 'muted-russet-theme)
(provide-theme 'muted-russet)
