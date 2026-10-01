;;; dustveil-theme.el -*- lexical-binding: t; -*-

(deftheme dustveil
  "Dustveil: dark monochrome surfaces and warm gray tones."
  :background-mode 'dark
  :kind 'color-scheme)

(defgroup dustveil nil
  "Dustveil theme."
  :group 'faces
  :prefix "dustveil-")

(defconst dustveil-foreground "#f3f3f3")
(defconst dustveil-background "#090909")
(defconst dustveil-surface "#1b1917")
(defconst dustveil-accent "#978e86")
(defconst dustveil-border "#7b726b")
(defconst dustveil-syntax-comment "#8a8179")
(defconst dustveil-syntax-punctuation "#978e86")
(defconst dustveil-syntax-literal "#aaa198")
(defconst dustveil-syntax-variable "#c1b8af")
(defconst dustveil-syntax-keyword "#e0d7ce")
(defconst dustveil-syntax-function "#fcf2e9")
(defconst dustveil-color-0 "#8a8179")
(defconst dustveil-color-1 "#8c837b")
(defconst dustveil-color-2 "#978e86")
(defconst dustveil-color-3 "#aaa198")
(defconst dustveil-color-4 "#8b827a")
(defconst dustveil-color-5 "#8e857d")
(defconst dustveil-color-6 "#9e958d")
(defconst dustveil-color-7 "#e0d7ce")
(defconst dustveil-color-8 "#8a8179")
(defconst dustveil-color-9 "#8c837b")
(defconst dustveil-color-10 "#978e86")
(defconst dustveil-color-11 "#aaa198")
(defconst dustveil-color-12 "#8b827a")
(defconst dustveil-color-13 "#8e857d")
(defconst dustveil-color-14 "#9e958d")
(defconst dustveil-color-15 "#fcf2e9")

(defface dustveil-parameter-face
  '((t (:inherit font-lock-variable-name-face)))
  "Face for formal parameters and named arguments."
  :group 'dustveil)

(defface lsp-face-semhl-declaration
  '((t (:inherit nil :foreground unspecified :weight unspecified)))
  "Face for LSP declaration modifiers without a token color."
  :group 'dustveil)

(defcustom dustveil-transparent nil
  "Use the terminal's default background when non-nil.
GUI frames always use the theme's dark canvas; set the frame
parameter `alpha-background' separately for GUI transparency.
Popup faces retain explicit backgrounds.  Reload the theme with
`load-theme' after changing this option."
  :type 'boolean
  :group 'dustveil)

(let ((tty-background (if dustveil-transparent "unspecified-bg" dustveil-background)))
  (custom-theme-set-faces
   'dustveil
   `(default ((((type tty)) (:background ,tty-background
                            :foreground ,dustveil-foreground))
              (t (:background ,dustveil-background :foreground ,dustveil-foreground))))
   `(fringe ((((type tty)) (:background ,tty-background
                           :foreground ,dustveil-color-1))
             (t (:background ,dustveil-background :foreground ,dustveil-color-1))))))

(custom-theme-set-faces
 'dustveil

 ;; --- base -------------------------------------------------------------------
 `(cursor ((t (:background ,dustveil-foreground))))
 `(region ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 `(highlight ((t (:background ,dustveil-surface))))
 `(hl-line ((t (:background ,dustveil-background))))
 `(secondary-selection ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 `(vertical-border ((t (:foreground ,dustveil-color-1))))
 `(window-divider ((t (:foreground ,dustveil-border))))
 `(shadow ((t (:foreground ,dustveil-color-1))))
 `(escape-glyph ((t (:foreground ,dustveil-color-1))))
 `(nobreak-space ((t (:foreground ,dustveil-color-3 :underline t))))
 `(file-name-shadow ((t (:inherit shadow))))
 `(fill-column-indicator ((t (:foreground ,dustveil-border))))
 `(line-number ((t (:foreground ,dustveil-color-1 :background unspecified))))
 `(line-number-current-line ((t (:foreground ,dustveil-accent
                                             :background ,dustveil-surface
                                             :bold t))))
 `(minibuffer-prompt ((t (:foreground ,dustveil-accent :bold t))))
 `(trailing-whitespace ((t (:background ,dustveil-surface))))
 `(show-paren-match ((t (:background ,dustveil-surface :bold t :underline t))))
 `(show-paren-mismatch ((t (:foreground ,dustveil-background
                                         :background ,dustveil-color-15))))
 `(match ((t (:background ,dustveil-surface
                          :foreground ,dustveil-accent))))

 ;; --- search -------------------------------------------------------------------
 `(isearch ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 `(isearch-fail ((t (:foreground ,dustveil-color-15 :underline t))))
 `(lazy-highlight ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 `(query-replace ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 ;; --- mode-line, header-line, tab-bar ---------------------------------------------
 `(mode-line ((t (:background ,dustveil-background
                              :foreground ,dustveil-color-15
                              :box (:color ,dustveil-color-1)))))
 `(mode-line-inactive ((t (:background ,dustveil-surface
                                       :foreground ,dustveil-color-1
                                       :box (:color ,dustveil-border)))))
 `(mode-line-active ((t (:inherit mode-line))))
 `(mode-line-buffer-id ((t (:foreground ,dustveil-accent :bold t))))
 `(mode-line-highlight ((t (:foreground ,dustveil-accent))))
 `(mode-line-emphasis ((t (:foreground ,dustveil-color-15 :bold t))))
 `(header-line ((t (:inherit mode-line))))
 `(header-line-highlight ((t (:inherit mode-line-highlight))))
 `(tab-bar ((t (:background ,dustveil-background
                            :foreground ,dustveil-color-1))))
 `(tab-bar-tab ((t (:background ,dustveil-surface
                                :foreground ,dustveil-color-15 :weight bold))))
 `(tab-bar-tab-inactive ((t (:background ,dustveil-background
                                         :foreground ,dustveil-color-1))))
 `(tab-bar-tab-group-current ((t (:foreground ,dustveil-accent :bold t))))
 `(tab-bar-tab-group-inactive ((t (:inherit tab-bar-tab-inactive))))
 `(tab-line ((t (:inherit tab-bar))))
 `(tab-line-tab ((t (:inherit tab-bar-tab-inactive))))
 `(tab-line-tab-current ((t (:inherit tab-bar-tab))))
 `(tab-line-tab-inactive ((t (:inherit tab-bar-tab-inactive))))
 `(tab-line-tab-inactive-alternate ((t (:inherit tab-line-tab-inactive))))
 `(tab-line-highlight ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 `(tab-line-close-highlight ((t (:foreground ,dustveil-accent))))

 ;; --- doom-modeline ---------------------------------------------------------------
 `(doom-modeline-bar ((t (:background ,dustveil-foreground :foreground ,dustveil-background))))
 `(doom-modeline-bar-inactive ((t (:background ,dustveil-color-1))))
 `(doom-modeline-buffer-file ((t (:foreground ,dustveil-color-15))))
 `(doom-modeline-buffer-path ((t (:foreground ,dustveil-color-15))))
 `(doom-modeline-buffer-major-mode ((t (:foreground ,dustveil-color-6))))
 `(doom-modeline-buffer-minor-mode ((t (:inherit shadow))))
 `(doom-modeline-buffer-modified ((t (:foreground ,dustveil-accent :bold t))))
 `(doom-modeline-emphasis ((t (:foreground ,dustveil-color-15 :bold t))))
 `(doom-modeline-highlight ((t (:foreground ,dustveil-accent))))
 `(doom-modeline-info ((t (:foreground ,dustveil-color-5))))
 `(doom-modeline-warning ((t (:foreground ,dustveil-color-3))))
 `(doom-modeline-urgent ((t (:foreground ,dustveil-color-15 :bold t))))
 `(doom-modeline-debug ((t (:foreground ,dustveil-color-3))))
 `(doom-modeline-debug-visual ((t (:foreground ,dustveil-color-3 :bold t))))
 `(doom-modeline-vcs-default ((t (:foreground ,dustveil-color-7))))
 `(doom-modeline-lsp-error ((t (:foreground ,dustveil-color-15))))
 `(doom-modeline-lsp-warning ((t (:foreground ,dustveil-color-3))))
 `(doom-modeline-lsp-success ((t (:foreground ,dustveil-accent))))
 `(doom-modeline-lsp-running ((t (:foreground ,dustveil-color-3))))
 `(doom-modeline-evil-normal-state ((t (:foreground ,dustveil-accent :bold t))))
 `(doom-modeline-evil-insert-state ((t (:foreground ,dustveil-color-7 :bold t))))
 `(doom-modeline-evil-visual-state ((t (:foreground ,dustveil-color-3 :bold t))))
 `(doom-modeline-evil-replace-state ((t (:foreground ,dustveil-color-5 :bold t))))
 `(doom-modeline-evil-emacs-state ((t (:foreground ,dustveil-color-6 :bold t))))
 `(doom-modeline-evil-motion-state ((t (:foreground ,dustveil-color-6 :bold t))))
 `(doom-modeline-evil-operator-state ((t (:foreground ,dustveil-color-3 :bold t))))
 `(doom-modeline-evil-user-state ((t (:foreground ,dustveil-color-6 :bold t))))
 `(doom-modeline-battery-critical ((t (:foreground ,dustveil-color-15 :bold t))))
 `(doom-modeline-battery-error ((t (:foreground ,dustveil-color-15))))
 `(doom-modeline-battery-warning ((t (:foreground ,dustveil-color-3))))
 `(doom-modeline-battery-charging ((t (:foreground ,dustveil-accent))))
 `(doom-modeline-battery-full ((t (:foreground ,dustveil-accent))))
 `(doom-modeline-battery-normal ((t (:foreground ,dustveil-color-7))))
 `(doom-modeline-unread-number ((t (:foreground ,dustveil-accent :bold t))))
 `(doom-modeline-compilation ((t (:foreground ,dustveil-color-3))))
 `(doom-modeline-panel ((t (:background ,dustveil-foreground
                                         :foreground ,dustveil-background :bold t))))
 `(doom-modeline-persp-name ((t (:foreground ,dustveil-color-3))))
 `(doom-modeline-workspace-name ((t (:foreground ,dustveil-accent :bold t))))
 `(doom-modeline-persp-buffer-not-in-persp
   ((t (:inherit shadow :italic t))))
 `(doom-modeline-project-dir ((t (:foreground ,dustveil-accent))))
 `(doom-modeline-project-name ((t (:foreground ,dustveil-accent))))
 `(doom-modeline-project-parent-dir ((t (:inherit shadow))))
 `(doom-modeline-project-root-dir ((t (:inherit shadow))))
 `(doom-modeline-repl-success ((t (:foreground ,dustveil-accent))))
 `(doom-modeline-repl-warning ((t (:foreground ,dustveil-color-3))))
 `(doom-modeline-overwrite ((t (:foreground ,dustveil-color-15 :bold t))))
 `(doom-modeline-time ((t (:foreground ,dustveil-color-1))))
 `(doom-modeline-host ((t (:foreground ,dustveil-color-1))))
 `(doom-modeline-input-method ((t (:foreground ,dustveil-color-1))))

 ;; --- solaire (secondary buffers) ---------------------------------------------------
 `(solaire-default-face ((t (:inherit default))))
 `(solaire-fringe-face ((t (:inherit fringe))))
 `(solaire-header-line-face ((t (:inherit header-line
                                :background ,dustveil-surface))))
 `(solaire-hl-line-face ((t (:inherit hl-line :background ,dustveil-surface))))
 `(solaire-line-number-face ((t (:inherit line-number
                                :background ,dustveil-surface))))
 `(solaire-mode-line-face ((t (:inherit mode-line))))
 `(solaire-mode-line-active-face ((t (:inherit mode-line-active))))
 `(solaire-mode-line-inactive-face ((t (:inherit mode-line-inactive))))
 `(solaire-region-face ((t (:inherit region))))
 `(solaire-org-hide-face ((t (:foreground ,dustveil-surface))))

 ;; --- font lock --------------------------------------------------------------------
 `(font-lock-comment-face ((t (:foreground ,dustveil-syntax-comment :italic t))))
 `(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 `(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 `(font-lock-doc-markup-face ((t (:foreground ,dustveil-foreground))))
 `(font-lock-string-face ((t (:foreground ,dustveil-syntax-literal))))
 `(font-lock-keyword-face ((t (:foreground ,dustveil-syntax-keyword :weight bold))))
 `(font-lock-builtin-face ((t (:inherit font-lock-function-call-face))))
 `(font-lock-function-name-face ((t (:foreground ,dustveil-syntax-function :weight bold))))
 `(font-lock-function-call-face ((t (:inherit font-lock-function-name-face))))
 `(font-lock-variable-name-face ((t (:foreground ,dustveil-syntax-variable))))
 `(font-lock-variable-use-face ((t (:inherit font-lock-variable-name-face))))
 `(r-ts-mode-face-variable ((t (:inherit font-lock-variable-name-face))))
 `(font-lock-constant-face ((t (:inherit font-lock-string-face))))
 `(font-lock-type-face ((t (:inherit font-lock-keyword-face))))
 `(font-lock-property-name-face ((t (:inherit font-lock-variable-name-face))))
 `(font-lock-property-use-face ((t (:inherit font-lock-variable-use-face))))
 `(font-lock-regexp-face ((t (:inherit font-lock-string-face))))
 `(font-lock-number-face ((t (:inherit font-lock-string-face))))
 `(font-lock-operator-face ((t (:foreground ,dustveil-syntax-punctuation))))
 `(font-lock-punctuation-face ((t (:inherit font-lock-operator-face))))
 `(font-lock-bracket-face ((t (:inherit font-lock-punctuation-face))))
 `(font-lock-delimiter-face ((t (:inherit font-lock-punctuation-face))))
 `(font-lock-misc-punctuation-face ((t (:inherit font-lock-punctuation-face))))
 `(font-lock-preprocessor-face ((t (:inherit font-lock-keyword-face))))
 `(font-lock-negation-char-face ((t (:inherit font-lock-operator-face))))
 `(font-lock-warning-face ((t (:foreground ,dustveil-color-3))))
 `(font-lock-escape-face ((t (:foreground ,dustveil-foreground))))
 `(font-lock-regexp-grouping-backslash ((t (:inherit bold))))
 `(font-lock-regexp-grouping-construct ((t (:inherit bold))))

 ;; --- ESS -------------------------------------------------------------------------
 `(ess-function-call-face ((t (:inherit font-lock-function-call-face))))
 `(ess-numbers-face ((t (:inherit font-lock-number-face))))
 `(ess-constant-face ((t (:inherit font-lock-constant-face))))
 `(ess-operator-face ((t (:inherit font-lock-operator-face))))
 `(ess-%op%-face ((t (:inherit font-lock-operator-face))))
 `(ess-assignment-face ((t (:inherit font-lock-operator-face))))
 `(ess-paren-face ((t (:inherit font-lock-bracket-face))))
 `(ess-modifiers-face ((t (:inherit font-lock-builtin-face))))
 `(ess-matrix-face ((t (:inherit font-lock-property-name-face))))
 `(ess-keyword-face ((t (:inherit font-lock-keyword-face))))
 `(ess-r-control-flow-keyword-face ((t (:inherit font-lock-keyword-face))))

 ;; --- tree-sitter-hl --------------------------------------------------------------
 `(tree-sitter-hl-face:variable ((t (:inherit font-lock-variable-name-face))))
 `(tree-sitter-hl-face:variable.builtin ((t (:inherit font-lock-variable-name-face))))
 `(tree-sitter-hl-face:variable.parameter ((t (:inherit font-lock-variable-name-face))))
 `(tree-sitter-hl-face:variable.parameter.builtin ((t (:inherit font-lock-variable-name-face))))
 `(tree-sitter-hl-face:variable.member ((t (:inherit font-lock-variable-name-face))))
 `(tree-sitter-hl-face:property ((t (:inherit font-lock-variable-name-face))))
 `(tree-sitter-hl-face:property.definition ((t (:inherit font-lock-variable-name-face))))
 `(tree-sitter-hl-face:comment ((t (:inherit font-lock-comment-face))))
 `(tree-sitter-hl-face:comment.block.documentation ((t (:inherit font-lock-comment-face))))
 `(tree-sitter-hl-face:keyword ((t (:inherit font-lock-keyword-face))))
 `(tree-sitter-hl-face:keyword.conditional ((t (:inherit font-lock-keyword-face))))
 `(tree-sitter-hl-face:keyword.control ((t (:inherit font-lock-keyword-face))))
 `(tree-sitter-hl-face:keyword.control.conditional ((t (:inherit font-lock-keyword-face))))
 `(tree-sitter-hl-face:keyword.control.directive ((t (:inherit font-lock-keyword-face))))
 `(tree-sitter-hl-face:keyword.control.import ((t (:inherit font-lock-keyword-face))))
 `(tree-sitter-hl-face:keyword.directive ((t (:inherit font-lock-keyword-face))))
 `(tree-sitter-hl-face:keyword.function ((t (:inherit font-lock-keyword-face))))
 `(tree-sitter-hl-face:keyword.return ((t (:inherit font-lock-keyword-face))))
 `(tree-sitter-hl-face:keyword.storage ((t (:inherit font-lock-keyword-face))))
 `(tree-sitter-hl-face:keyword.storage.modifier ((t (:inherit font-lock-keyword-face))))
 `(tree-sitter-hl-face:keyword.storage.modifier.mut ((t (:inherit font-lock-keyword-face))))
 `(tree-sitter-hl-face:keyword.storage.modifier.ref ((t (:inherit font-lock-keyword-face))))
 `(tree-sitter-hl-face:label ((t (:inherit font-lock-keyword-face))))
 `(tree-sitter-hl-face:function ((t (:inherit font-lock-function-name-face))))
 `(tree-sitter-hl-face:method ((t (:inherit font-lock-function-name-face))))
 `(tree-sitter-hl-face:function.call ((t (:inherit font-lock-function-call-face))))
 `(tree-sitter-hl-face:function.builtin ((t (:inherit font-lock-function-call-face))))
 `(tree-sitter-hl-face:function.method ((t (:inherit font-lock-function-call-face))))
 `(tree-sitter-hl-face:function.method.call ((t (:inherit font-lock-function-call-face))))
 `(tree-sitter-hl-face:method.call ((t (:inherit font-lock-function-call-face))))
 `(tree-sitter-hl-face:function.macro ((t (:inherit font-lock-preprocessor-face))))
 `(tree-sitter-hl-face:constant.macro ((t (:inherit font-lock-preprocessor-face))))
 `(tree-sitter-hl-face:type ((t (:inherit font-lock-type-face))))
 `(tree-sitter-hl-face:type.builtin ((t (:inherit font-lock-type-face))))
 `(tree-sitter-hl-face:type.definition ((t (:inherit font-lock-type-face))))
 `(tree-sitter-hl-face:type.parameter ((t (:inherit font-lock-type-face))))
 `(tree-sitter-hl-face:namespace ((t (:inherit font-lock-type-face))))
 `(tree-sitter-hl-face:constructor ((t (:inherit font-lock-type-face))))
 `(tree-sitter-hl-face:attribute ((t (:inherit font-lock-type-face))))
 `(tree-sitter-hl-face:string ((t (:inherit font-lock-string-face))))
 `(tree-sitter-hl-face:string.documentation ((t (:inherit font-lock-string-face))))
 `(tree-sitter-hl-face:string.special ((t (:inherit font-lock-string-face))))
 `(tree-sitter-hl-face:string.special.path ((t (:inherit font-lock-string-face))))
 `(tree-sitter-hl-face:string.special.symbol ((t (:inherit font-lock-string-face))))
 `(tree-sitter-hl-face:string.special.url ((t (:inherit font-lock-string-face))))
 `(tree-sitter-hl-face:constant.character ((t (:inherit font-lock-string-face))))
 `(tree-sitter-hl-face:constant ((t (:inherit font-lock-constant-face))))
 `(tree-sitter-hl-face:constant.builtin ((t (:inherit font-lock-constant-face))))
 `(tree-sitter-hl-face:constant.builtin.boolean ((t (:inherit font-lock-constant-face))))
 `(tree-sitter-hl-face:boolean ((t (:inherit font-lock-constant-face))))
 `(tree-sitter-hl-face:number ((t (:inherit font-lock-number-face))))
 `(tree-sitter-hl-face:constant.numeric ((t (:inherit font-lock-number-face))))
 `(tree-sitter-hl-face:operator ((t (:inherit font-lock-operator-face))))
 `(tree-sitter-hl-face:keyword.operator ((t (:inherit font-lock-operator-face))))
 `(tree-sitter-hl-face:punctuation ((t (:inherit font-lock-punctuation-face))))
 `(tree-sitter-hl-face:punctuation.bracket ((t (:inherit font-lock-punctuation-face))))
 `(tree-sitter-hl-face:punctuation.delimiter ((t (:inherit font-lock-punctuation-face))))
 `(tree-sitter-hl-face:punctuation.special ((t (:inherit font-lock-punctuation-face))))
 `(tree-sitter-hl-face:constant.character.escape ((t (:inherit font-lock-punctuation-face))))
 `(tree-sitter-hl-face:error ((t (:inherit font-lock-warning-face))))
 `(tree-sitter-hl-face:comment.unused ((t (:inherit font-lock-comment-face :strike-through t))))

 ;; --- diagnostics (restrained: colored text, no noisy backgrounds) ----------------
 `(error ((t (:foreground ,dustveil-color-15))))
 `(warning ((t (:foreground ,dustveil-color-3))))
 `(success ((t (:foreground ,dustveil-accent))))
 `(flycheck-error ((t (:underline (:style wave :color ,dustveil-color-15)))))
 `(flycheck-warning ((t (:underline (:style wave :color ,dustveil-color-3)))))
 `(flycheck-info ((t (:underline (:style wave :color ,dustveil-color-5)))))
 `(flycheck-fringe-error ((t (:inherit error))))
 `(flycheck-fringe-warning ((t (:inherit warning))))
 `(flycheck-fringe-info ((t (:inherit compilation-info))))
 `(flycheck-error-list-error ((t (:foreground ,dustveil-color-15 :bold t))))
 `(flycheck-error-list-warning ((t (:foreground ,dustveil-color-3 :bold t))))
 `(flycheck-error-list-info ((t (:foreground ,dustveil-color-5 :bold t))))
 `(flycheck-error-list-line-number ((t (:inherit shadow))))
 `(flycheck-error-list-column-number ((t (:inherit shadow))))
 `(flycheck-error-list-id ((t (:foreground ,dustveil-color-1))))
 `(flycheck-error-list-filename ((t (:foreground ,dustveil-color-6))))
 `(flymake-error ((t (:underline (:style wave :color ,dustveil-color-15)))))
 `(flymake-warning ((t (:underline (:style wave :color ,dustveil-color-3)))))
 `(flymake-note ((t (:underline (:style wave :color ,dustveil-color-5)))))

 ;; --- eglot ------------------------------------------------------------------------
 `(eglot-highlight-symbol-face ((t (:background ,dustveil-surface))))
 `(eglot-diagnostic-tag-unnecessary-face ((t (:inherit shadow))))
 `(eglot-diagnostic-tag-deprecated-face ((t (:strike-through t))))
 `(eglot-inlay-hint-face ((t (:inherit shadow :height 0.8 :slant italic))))
 `(eglot-type-hint-face ((t (:inherit eglot-inlay-hint-face
                           :foreground ,dustveil-color-3))))
 `(eglot-parameter-hint-face ((t (:inherit eglot-inlay-hint-face
                                :foreground ,dustveil-accent))))

 ;; --- completions ---------------------------------------------------------------------
 `(completions-common-part ((t (:inherit nil :foreground unspecified :bold t :underline t))))
 `(completions-first-difference ((t (:inherit completions-common-part :foreground unspecified))))
 `(completions-annotations ((t (:inherit shadow :slant italic))))
 `(completions-highlight ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 `(completions-group-title ((t (:foreground ,dustveil-color-3 :weight bold))))
 `(completions-group-separator ((t (:foreground ,dustveil-color-1
                                   :strike-through t))))
 `(corfu-default ((t (:background ,dustveil-background
                                  :foreground ,dustveil-foreground))))
 `(corfu-current ((t (:background ,dustveil-surface :foreground ,dustveil-foreground
                                 :box (:color ,dustveil-accent) :extend t))))
 `(corfu-annotations ((t (:inherit completions-annotations))))
 `(corfu-deprecated ((t (:inherit shadow :strike-through t))))
 `(corfu-bar ((t (:background ,dustveil-color-1))))
 `(corfu-border ((t (:background ,dustveil-foreground :foreground ,dustveil-background))))
 `(corfu-echo ((t (:inherit completions-annotations))))
 `(corfu-popupinfo ((t (:background ,dustveil-background
                                    :foreground ,dustveil-color-7))))
 `(corfu-quick1 ((t (:foreground ,dustveil-accent :bold t))))
 `(corfu-quick2 ((t (:foreground ,dustveil-color-3 :bold t))))
 `(vertico-current ((t (:background ,dustveil-surface :foreground ,dustveil-foreground
                                   :box (:color ,dustveil-accent) :extend t))))
 `(vertico-group-title ((t (:inherit completions-group-title))))
 `(vertico-group-separator ((t (:foreground ,dustveil-color-1))))
 `(orderless-match-face-0 ((t (:inherit completions-common-part :foreground unspecified))))
 `(orderless-match-face-1 ((t (:inherit completions-common-part :foreground unspecified))))
 `(orderless-match-face-2 ((t (:inherit completions-common-part :foreground unspecified))))
 `(orderless-match-face-3 ((t (:inherit completions-common-part :foreground unspecified))))
 `(marginalia-documentation ((t (:inherit completions-annotations))))
 `(marginalia-key ((t (:foreground ,dustveil-accent :bold t))))
 `(marginalia-value ((t (:foreground ,dustveil-color-7))))
 `(marginalia-lighter ((t (:inherit shadow))))
 `(marginalia-modified ((t (:foreground ,dustveil-color-3))))
 `(marginalia-date ((t (:foreground ,dustveil-color-6))))
 `(marginalia-type ((t (:foreground ,dustveil-color-6))))
 `(marginalia-on ((t (:foreground ,dustveil-accent))))
 `(marginalia-off ((t (:inherit shadow))))
 `(marginalia-installed ((t (:foreground ,dustveil-accent))))
 `(marginalia-archive ((t (:inherit shadow))))
 `(marginalia-null ((t (:inherit shadow))))
 `(marginalia-number ((t (:foreground ,dustveil-color-3))))
 `(marginalia-function ((t (:foreground ,dustveil-color-6))))
 `(marginalia-symbol ((t (:foreground ,dustveil-color-3))))
 `(consult-help ((t (:foreground ,dustveil-accent))))
 `(consult-key ((t (:foreground ,dustveil-accent :bold t))))
 `(consult-grep-context ((t (:inherit completions-annotations))))
 `(consult-preview-line ((t (:background ,dustveil-surface))))
 `(consult-preview-insertion ((t (:background ,dustveil-surface))))
 `(consult-preview-match ((t (:foreground ,dustveil-accent :bold t))))
 `(consult-highlight-match ((t (:inherit completions-common-part :foreground unspecified))))
 `(consult-highlight-mark ((t (:background ,dustveil-surface))))
 `(consult-async-split ((t (:foreground ,dustveil-accent :bold t))))
 `(consult-async-running ((t (:foreground ,dustveil-color-3))))
 `(consult-async-failed ((t (:foreground ,dustveil-color-15))))
 `(consult-async-finished ((t (:foreground ,dustveil-accent))))
 `(consult-async-option ((t (:foreground ,dustveil-color-6))))
 `(consult-narrow-indicator ((t (:foreground ,dustveil-color-1))))
 `(consult-imenu-prefix ((t (:inherit shadow))))
 `(consult-line-number ((t (:inherit shadow))))
 `(embark-keybinding ((t (:foreground ,dustveil-accent :bold t))))
 `(embark-keybinding-repeat ((t (:foreground ,dustveil-accent :bold t
                                              :underline t))))
 `(embark-keymap ((t (:foreground ,dustveil-color-3 :bold t))))
 `(embark-target ((t (:foreground ,dustveil-accent))))
 `(embark-selected ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 `(embark-collect-group-title ((t (:foreground ,dustveil-color-3 :bold t))))
 `(embark-collect-group-separator ((t (:foreground ,dustveil-color-1))))
 `(embark-collect-candidate ((t (:foreground ,dustveil-foreground))))
 `(embark-collect-annotation ((t (:inherit completions-annotations))))
 `(embark-verbose-indicator-title ((t (:foreground ,dustveil-accent :bold t))))
 `(embark-verbose-indicator-documentation
   ((t (:inherit completions-annotations))))
 `(embark-verbose-indicator-shadowed ((t (:foreground ,dustveil-color-1))))

 ;; --- dired, diredfl, dirvish -------------------------------------------------------
 `(dired-directory ((t (:foreground ,dustveil-color-3))))
 `(dired-symlink ((t (:foreground ,dustveil-color-6))))
 `(dired-broken-symlink ((t (:foreground ,dustveil-color-15 :bold t))))
 `(dired-flagged ((t (:foreground ,dustveil-color-15
                                  :background ,dustveil-surface))))
 `(dired-marked ((t (:foreground ,dustveil-background
                                 :background ,dustveil-foreground))))
 `(dired-mark ((t (:foreground ,dustveil-accent :bold t))))
 `(dired-header ((t (:foreground ,dustveil-color-3 :bold t))))
 `(dired-special ((t (:foreground ,dustveil-color-7))))
 `(dired-ignored ((t (:foreground ,dustveil-color-1))))
 `(dired-warning ((t (:foreground ,dustveil-color-3))))
 `(diredfl-dir-heading ((t (:foreground ,dustveil-color-3 :bold t))))
 `(diredfl-dir-name ((t (:foreground ,dustveil-color-6 :bold t))))
 `(diredfl-dir-priv ((t (:foreground ,dustveil-color-6))))
 `(diredfl-file-name ((t (:foreground ,dustveil-foreground))))
 `(diredfl-file-suffix ((t (:foreground ,dustveil-color-1))))
 `(diredfl-date-time ((t (:inherit shadow))))
 `(diredfl-number ((t (:inherit shadow))))
 `(diredfl-symlink ((t (:foreground ,dustveil-color-6))))
 `(diredfl-executable-tag ((t (:foreground ,dustveil-color-7))))
 `(diredfl-compressed-file-name ((t (:foreground ,dustveil-foreground))))
 `(diredfl-compressed-file-suffix ((t (:foreground ,dustveil-color-3))))
 `(diredfl-ignored-file-name ((t (:foreground ,dustveil-color-1))))
 `(diredfl-flag-mark ((t (:foreground ,dustveil-background
                                       :background ,dustveil-foreground :bold t))))
 `(diredfl-flag-mark-line ((t (:background ,dustveil-foreground
                                           :foreground ,dustveil-background))))
 `(diredfl-deletion ((t (:foreground ,dustveil-background
                                      :background ,dustveil-color-15 :bold t))))
 `(diredfl-deletion-file-name ((t (:foreground ,dustveil-color-15))))
 `(diredfl-read-priv ((t (:inherit shadow))))
 `(diredfl-write-priv ((t (:inherit shadow))))
 `(diredfl-exec-priv ((t (:foreground ,dustveil-color-7))))
 `(diredfl-no-priv ((t (:foreground ,dustveil-color-1))))
 `(diredfl-link-priv ((t (:foreground ,dustveil-color-6))))
 `(diredfl-other-priv ((t (:foreground ,dustveil-color-1))))
 `(diredfl-rare-priv ((t (:foreground ,dustveil-color-3))))
 `(dirvish-hl-line ((t (:background ,dustveil-surface))))
 `(dirvish-hl-line-inactive ((t (:background ,dustveil-background))))
 `(dirvish-inactive ((t (:inherit shadow))))
 `(dirvish-subtree-guide ((t (:foreground ,dustveil-color-0))))
 `(dirvish-emerge-group-title ((t (:foreground ,dustveil-color-3 :bold t))))
 `(dirvish-narrow-match-face-0 ((t (:foreground ,dustveil-accent :bold t))))
 `(dirvish-narrow-match-face-1 ((t (:foreground ,dustveil-color-3 :bold t))))
 `(dirvish-narrow-match-face-2 ((t (:foreground ,dustveil-color-7 :bold t))))
 `(dirvish-narrow-match-face-3 ((t (:foreground ,dustveil-color-6 :bold t))))
 `(dirvish-narrow-split ((t (:foreground ,dustveil-color-1))))
 `(dirvish-vc-added-state ((t (:foreground ,dustveil-accent))))
 `(dirvish-vc-edited-state ((t (:foreground ,dustveil-color-3))))
 `(dirvish-vc-conflict-state ((t (:foreground ,dustveil-color-15 :bold t))))
 `(dirvish-vc-removed-state ((t (:foreground ,dustveil-color-1))))
 `(dirvish-vc-unregistered-face ((t (:foreground ,dustveil-color-1))))
 `(dirvish-proc-failed ((t (:foreground ,dustveil-color-15))))
 `(dirvish-proc-finished ((t (:foreground ,dustveil-accent))))
 `(dirvish-proc-running ((t (:foreground ,dustveil-color-3))))
 `(dirvish-free-space ((t (:inherit shadow))))
 `(dirvish-file-device-number ((t (:inherit shadow))))
 `(dirvish-file-group-id ((t (:inherit shadow))))
 `(dirvish-file-inode-number ((t (:inherit shadow))))
 `(dirvish-file-link-number ((t (:inherit shadow))))
 `(dirvish-file-modes ((t (:inherit shadow))))
 `(dirvish-file-size ((t (:inherit shadow))))
 `(dirvish-file-time ((t (:inherit shadow))))
 `(dirvish-file-user-id ((t (:inherit shadow))))
 `(dirvish-git-commit-message-face ((t (:foreground ,dustveil-foreground))))
 `(dirvish-collapse-dir-face ((t (:foreground ,dustveil-color-6))))
 `(dirvish-collapse-file-face ((t (:foreground ,dustveil-foreground))))
 `(dirvish-collapse-empty-dir-face ((t (:foreground ,dustveil-color-1))))
 `(dirvish-media-info-heading ((t (:foreground ,dustveil-accent :bold t))))

 ;; --- diff, magit, vc ------------------------------------------------------------------
 `(diff-hl-change ((t (:foreground ,dustveil-color-3))))
 `(diff-hl-delete ((t (:foreground ,dustveil-color-15))))
 `(diff-hl-insert ((t (:foreground ,dustveil-accent))))
 `(diff-added ((t (:foreground ,dustveil-accent
                               :background ,dustveil-background))))
 `(diff-removed ((t (:foreground ,dustveil-color-15
                                 :background ,dustveil-background))))
 `(diff-changed ((t (:foreground ,dustveil-color-3))))
 `(diff-refine-added ((t (:foreground ,dustveil-accent :bold t))))
 `(diff-refine-removed ((t (:foreground ,dustveil-color-15 :bold t))))
 `(diff-refine-changed ((t (:foreground ,dustveil-color-3 :bold t))))
 `(diff-header ((t (:foreground ,dustveil-color-1))))
 `(diff-hunk-header ((t (:foreground ,dustveil-color-1
                                     :background ,dustveil-surface))))
 `(diff-file-header ((t (:foreground ,dustveil-accent :bold t))))
 `(magit-section-highlight ((t (:background ,dustveil-surface))))
 `(magit-section-heading ((t (:foreground ,dustveil-accent :bold t))))
 `(magit-section-heading-selection ((t (:foreground ,dustveil-accent))))
 `(magit-dimmed ((t (:foreground ,dustveil-color-1))))
 `(magit-hash ((t (:inherit shadow))))
 `(magit-header-line ((t (:foreground ,dustveil-accent :bold t))))
 `(magit-branch-local ((t (:foreground ,dustveil-color-6))))
 `(magit-branch-remote ((t (:foreground ,dustveil-color-3))))
 `(magit-branch-current ((t (:foreground ,dustveil-accent :bold t))))
 `(magit-tag ((t (:foreground ,dustveil-color-3))))
 `(magit-refname ((t (:foreground ,dustveil-color-7))))
 `(magit-log-author ((t (:foreground ,dustveil-color-6))))
 `(magit-log-date ((t (:inherit shadow))))
 `(magit-diff-hunk-heading ((t (:foreground ,dustveil-color-1
                                            :background ,dustveil-background))))
 `(magit-diff-hunk-heading-highlight ((t (:foreground ,dustveil-color-1
                                                      :background
                                                      ,dustveil-surface))))
 `(magit-diff-added ((t (:foreground ,dustveil-accent))))
 `(magit-diff-added-highlight ((t (:foreground ,dustveil-accent
                                               :background ,dustveil-surface))))
 `(magit-diff-removed ((t (:foreground ,dustveil-color-15))))
 `(magit-diff-removed-highlight ((t (:foreground ,dustveil-color-15
                                                 :background
                                                 ,dustveil-surface))))
 `(magit-diff-context ((t (:foreground ,dustveil-color-7))))
 `(magit-diff-context-highlight ((t (:foreground ,dustveil-foreground
                                                 :background
                                                 ,dustveil-surface))))
 `(magit-diff-our ((t (:foreground ,dustveil-color-15))))
 `(magit-diff-their ((t (:foreground ,dustveil-accent))))
 `(magit-diff-base ((t (:foreground ,dustveil-color-3))))
 `(magit-diff-base-highlight ((t (:foreground ,dustveil-color-3
                                              :background
                                              ,dustveil-surface))))
 `(magit-diffstat-added ((t (:foreground ,dustveil-accent))))
 `(magit-diffstat-removed ((t (:foreground ,dustveil-color-15))))
 `(git-commit-summary ((t (:foreground ,dustveil-color-15))))
 `(ediff-current-diff-A ((t (:foreground ,dustveil-color-15
                                         :background ,dustveil-surface))))
 `(ediff-current-diff-B ((t (:foreground ,dustveil-accent
                                         :background ,dustveil-surface))))
 `(ediff-current-diff-C ((t (:foreground ,dustveil-color-3
                                         :background ,dustveil-surface))))
 `(ediff-current-diff-Ancestor ((t (:foreground ,dustveil-color-1
                                                :background ,dustveil-surface
                                                :box (:color ,dustveil-border)))))
 `(ediff-fine-diff-A ((t (:foreground ,dustveil-color-15 :bold t
                                      :background ,dustveil-surface))))
 `(ediff-fine-diff-B ((t (:foreground ,dustveil-accent :bold t
                                      :background ,dustveil-surface))))
 `(ediff-fine-diff-C ((t (:foreground ,dustveil-color-3 :bold t
                                      :background ,dustveil-surface))))
 `(ediff-fine-diff-Ancestor ((t (:foreground ,dustveil-color-1
                                             :background
                                             ,dustveil-surface))))
 `(ediff-even-diff-A ((t (:foreground ,dustveil-color-7
                                      :background ,dustveil-background))))
 `(ediff-even-diff-B ((t (:foreground ,dustveil-color-7
                                      :background ,dustveil-background))))
 `(ediff-even-diff-C ((t (:foreground ,dustveil-color-7
                                      :background ,dustveil-background))))
 `(ediff-even-diff-Ancestor ((t (:foreground ,dustveil-color-7
                                             :background
                                             ,dustveil-background))))
 `(ediff-odd-diff-A ((t (:foreground ,dustveil-foreground
                                     :background ,dustveil-surface))))
 `(ediff-odd-diff-B ((t (:foreground ,dustveil-foreground
                                     :background ,dustveil-surface))))
 `(ediff-odd-diff-C ((t (:foreground ,dustveil-foreground
                                     :background ,dustveil-surface))))
 `(ediff-odd-diff-Ancestor ((t (:foreground ,dustveil-foreground
                                            :background
                                            ,dustveil-surface))))
 `(smerge-upper ((t (:foreground ,dustveil-color-15
                                 :background ,dustveil-background))))
 `(smerge-lower ((t (:foreground ,dustveil-accent
                                 :background ,dustveil-background))))
 `(smerge-base ((t (:foreground ,dustveil-color-3
                                :background ,dustveil-background))))
 `(smerge-markers ((t (:foreground ,dustveil-color-1
                                   :background ,dustveil-surface))))
 `(smerge-refined-added ((t (:foreground ,dustveil-accent :bold t))))
 `(smerge-refined-removed ((t (:foreground ,dustveil-color-15 :bold t))))
 `(smerge-refined-changed ((t (:foreground ,dustveil-color-3 :bold t))))
 `(git-timemachine-commit ((t (:foreground ,dustveil-color-15 :bold t))))
 `(git-timemachine-minibuffer-author-face ((t (:foreground ,dustveil-color-6))))
 `(git-timemachine-minibuffer-detail-face ((t (:foreground ,dustveil-foreground))))

 ;; --- org ---------------------------------------------------------------------------
 ;; Includes the +org-todo-* faces Doom's org module declares dynamically.
 ;; A TTY cannot use its unknown default background as an invisible foreground.
 `(org-hide ((t (:foreground ,dustveil-background))))
 `(org-document-title ((t (:foreground ,dustveil-accent :bold t :height 1.2))))
 `(org-document-info ((t (:foreground ,dustveil-color-1))))
 `(org-level-1 ((t (:foreground ,dustveil-accent :bold t))))
 `(org-level-2 ((t (:foreground ,dustveil-color-6 :bold t))))
 `(org-level-3 ((t (:foreground ,dustveil-color-3))))
 `(org-level-4 ((t (:foreground ,dustveil-foreground))))
 `(org-level-5 ((t (:foreground ,dustveil-color-3))))
 `(org-level-6 ((t (:foreground ,dustveil-color-6))))
 `(org-level-7 ((t (:foreground ,dustveil-color-7))))
 `(org-level-8 ((t (:foreground ,dustveil-color-1))))
 `(org-todo ((t (:foreground ,dustveil-accent :bold t))))
 `(org-done ((t (:foreground ,dustveil-accent :bold t))))
 `(+org-todo-active ((t (:foreground ,dustveil-color-3 :bold t))))
 `(+org-todo-onhold ((t (:foreground ,dustveil-color-5 :bold t))))
 `(+org-todo-cancel ((t (:foreground ,dustveil-color-1 :strike-through t))))
 `(+org-todo-project ((t (:foreground ,dustveil-color-3 :bold t))))
 `(org-priority ((t (:foreground ,dustveil-color-3))))
 `(org-tag ((t (:inherit shadow))))
 `(org-date ((t (:foreground ,dustveil-color-7 :underline t))))
 `(org-special-keyword ((t (:inherit shadow))))
 `(org-meta-line ((t (:inherit shadow))))
 `(org-drawer ((t (:inherit shadow))))
 `(org-property-value ((t (:foreground ,dustveil-color-7))))
 `(org-table ((t (:foreground ,dustveil-color-7))))
 `(org-formula ((t (:foreground ,dustveil-color-3))))
 `(org-block ((t (:background ,dustveil-background :extend t))))
 `(org-block-begin-line ((t (:foreground ,dustveil-color-1
                                          :background ,dustveil-background
                                          :extend t))))
 `(org-block-end-line ((t (:inherit org-block-begin-line))))
 `(org-code ((t (:foreground ,dustveil-color-7
                             :background ,dustveil-background :extend nil))))
 `(org-inline-src-block ((t (:inherit org-block :extend nil))))
 `(org-verbatim ((t (:foreground ,dustveil-color-7))))
 `(org-quote ((t (:inherit org-block :slant italic :extend t))))
 `(org-headline-done ((t (:foreground ,dustveil-color-1))))
 `(org-checkbox ((t (:foreground ,dustveil-accent :bold t))))
 `(org-link ((t (:foreground ,dustveil-accent :underline t))))
 `(org-footnote ((t (:foreground ,dustveil-color-1))))
 `(org-ellipsis ((t (:foreground ,dustveil-color-1))))
 `(org-column ((t (:background ,dustveil-surface))))
 `(org-column-title ((t (:foreground ,dustveil-accent :bold t
                                      :background ,dustveil-surface))))
 `(org-clock-overlay ((t (:background ,dustveil-surface))))
 `(org-agenda-clocking ((t (:background ,dustveil-surface))))
 `(org-agenda-structure ((t (:foreground ,dustveil-color-3 :bold t))))
 `(org-agenda-date ((t (:foreground ,dustveil-color-6))))
 `(org-agenda-date-today ((t (:foreground ,dustveil-accent :bold t))))
 `(org-agenda-date-weekend ((t (:foreground ,dustveil-color-7))))
 `(org-agenda-done ((t (:foreground ,dustveil-color-1))))
 `(org-scheduled ((t (:foreground ,dustveil-foreground))))
 `(org-scheduled-today ((t (:foreground ,dustveil-accent))))
 `(org-imminent-deadline ((t (:inherit org-warning))))
 `(org-upcoming-deadline ((t (:foreground ,dustveil-color-3))))
 `(org-time-grid ((t (:inherit shadow))))
 `(org-warning ((t (:foreground ,dustveil-color-15 :bold t))))

 ;; --- markdown -------------------------------------------------------------------------
 `(markdown-header-face-1 ((t (:foreground ,dustveil-accent :bold t))))
 `(markdown-header-face-2 ((t (:foreground ,dustveil-color-7 :bold t))))
 `(markdown-header-face-3 ((t (:foreground ,dustveil-color-3))))
 `(markdown-header-face-4 ((t (:foreground ,dustveil-color-6))))
 `(markdown-header-face-5 ((t (:foreground ,dustveil-color-3))))
 `(markdown-header-face-6 ((t (:foreground ,dustveil-color-6))))
 `(markdown-header-delimiter-face ((t (:foreground ,dustveil-color-1))))
 `(markdown-header-rule-face ((t (:foreground ,dustveil-color-1))))
 `(markdown-hr-face ((t (:foreground ,dustveil-color-1))))
 `(markdown-blockquote-face ((t (:foreground ,dustveil-color-3 :italic t))))
 `(markdown-code-face ((t (:background ,dustveil-background
                                       :foreground ,dustveil-color-15
                                       :inherit fixed-pitch :extend nil))))
 `(markdown-pre-face ((t (:inherit markdown-code-face :extend t))))
 `(markdown-inline-code-face ((t (:inherit markdown-code-face
                                 :foreground ,dustveil-color-7 :extend nil))))
 `(markdown-language-keyword-face ((t (:foreground ,dustveil-color-3))))
 `(markdown-markup-face ((t (:foreground ,dustveil-color-1))))
 `(markdown-list-face ((t (:foreground ,dustveil-color-7))))
 `(markdown-link-face ((t (:foreground ,dustveil-color-6 :underline t))))
 `(markdown-url-face ((t (:foreground ,dustveil-color-6 :underline t))))
 `(markdown-plain-url-face ((t (:foreground ,dustveil-color-6 :underline t))))
 `(markdown-reference-face ((t (:foreground ,dustveil-color-6))))
 `(markdown-footnote-marker-face ((t (:foreground ,dustveil-color-1))))
 `(markdown-metadata-key-face ((t (:foreground ,dustveil-color-3))))
 `(markdown-metadata-value-face ((t (:foreground ,dustveil-color-7))))
 `(markdown-gfm-checkbox-face ((t (:foreground ,dustveil-accent :bold t))))
 `(markdown-math-face ((t (:foreground ,dustveil-color-6))))
 `(markdown-missing-link-face ((t (:foreground ,dustveil-color-15))))
 `(markdown-comment-face ((t (:inherit font-lock-comment-face))))
 `(markdown-strike-through-face ((t (:foreground ,dustveil-color-1
                                                 :strike-through t))))

 ;; --- info, help, custom, compilation --------------------------------------------------
 `(info-title-1 ((t (:foreground ,dustveil-color-3 :bold t))))
 `(info-title-2 ((t (:foreground ,dustveil-color-3))))
 `(info-title-3 ((t (:foreground ,dustveil-accent))))
 `(info-title-4 ((t (:foreground ,dustveil-accent))))
 `(info-menu-header ((t (:foreground ,dustveil-accent :bold t))))
 `(info-menu-star ((t (:foreground ,dustveil-accent))))
 `(info-node ((t (:foreground ,dustveil-accent :bold t))))
 `(info-header-node ((t (:foreground ,dustveil-color-1))))
 `(info-header-xref ((t (:foreground ,dustveil-color-6 :underline t))))
 `(info-xref ((t (:foreground ,dustveil-color-6 :underline t))))
 `(info-xref-visited ((t (:foreground ,dustveil-color-3 :underline t))))
 `(info-index-match ((t (:inherit isearch))))
 `(help-argument-name ((t (:foreground ,dustveil-color-6 :italic t))))
 `(help-key-binding ((t (:background ,dustveil-background
                                      :foreground ,dustveil-color-15 :bold t))))
 `(widget-field ((t (:background ,dustveil-background :box (:color ,dustveil-border)
                                 :foreground ,dustveil-foreground))))
 `(widget-single-line-field ((t (:background ,dustveil-background :box (:color ,dustveil-border)
                                             :foreground ,dustveil-foreground))))
 `(widget-button ((t (:foreground ,dustveil-accent :bold t))))
 `(custom-variable-tag ((t (:foreground ,dustveil-accent :bold t))))
 `(custom-face-tag ((t (:foreground ,dustveil-color-3))))
 `(custom-group-tag ((t (:foreground ,dustveil-color-3 :bold t))))
 `(custom-state ((t (:foreground ,dustveil-accent))))
 `(custom-comment ((t (:inherit font-lock-comment-face))))
 `(custom-comment-tag ((t (:foreground ,dustveil-color-1))))
 `(custom-documentation ((t (:foreground ,dustveil-color-7))))
 `(compilation-error ((t (:inherit error))))
 `(compilation-warning ((t (:inherit warning))))
 `(compilation-info ((t (:foreground ,dustveil-color-5))))
 `(compilation-line-number ((t (:inherit shadow))))
 `(compilation-column-number ((t (:inherit shadow))))
 `(compilation-mode-line-fail ((t (:foreground ,dustveil-color-15 :bold t))))
 `(compilation-mode-line-exit ((t (:foreground ,dustveil-accent :bold t))))
 `(compilation-mode-line-run ((t (:foreground ,dustveil-color-3 :bold t))))
 `(whitespace-trailing ((t (:background ,dustveil-surface))))
 `(whitespace-line ((t (:background ,dustveil-surface
                                    :foreground ,dustveil-color-3))))
 `(whitespace-space ((t (:foreground ,dustveil-color-0))))
 `(whitespace-hspace ((t (:foreground ,dustveil-color-0))))
 `(whitespace-tab ((t (:foreground ,dustveil-color-0))))
 `(whitespace-newline ((t (:foreground ,dustveil-color-0))))
 `(whitespace-indentation ((t (:foreground ,dustveil-color-0))))
 `(whitespace-empty ((t (:foreground ,dustveil-color-0))))

 ;; --- evil, search previews -----------------------------------------------------------
 `(evil-ex-substitute-matches ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 `(evil-ex-substitute-replacement ((t (:foreground ,dustveil-accent))))
 `(evil-search-highlight-persist-highlight-face ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 `(evil-traces-default ((t (:background ,dustveil-surface
                                        :foreground ,dustveil-foreground))))
 `(evil-traces-global-match ((t (:background ,dustveil-surface
                                             :foreground ,dustveil-color-15
                                             :strike-through t))))
 `(evil-traces-global-range ((t (:background ,dustveil-surface
                                             :foreground ,dustveil-color-15))))
 `(evil-traces-substitute-range ((t (:background ,dustveil-surface
                                                 :foreground
                                                 ,dustveil-color-15))))
 `(evil-traces-delete ((t (:background ,dustveil-color-15
                                       :foreground ,dustveil-background :bold t))))
 `(evil-traces-change ((t (:background ,dustveil-foreground
                                       :foreground ,dustveil-background :bold t))))
 `(evil-traces-yank ((t (:background ,dustveil-accent
                                     :foreground ,dustveil-background :bold t))))
 `(evil-traces-copy-preview ((t (:background ,dustveil-surface
                                             :foreground ,dustveil-color-15))))
 `(evil-traces-copy-range ((t (:background ,dustveil-surface
                                           :foreground ,dustveil-color-15))))
 `(evil-traces-move-preview ((t (:background ,dustveil-surface))))
 `(evil-traces-move-range ((t (:background ,dustveil-surface))))
 `(evil-traces-normal ((t (:foreground ,dustveil-foreground))))
 `(evil-goggles-default-face ((t (:background ,dustveil-surface
                                              :foreground ,dustveil-color-15))))
 `(evil-goggles-delete-face ((t (:background ,dustveil-color-15
                                             :foreground ,dustveil-background))))
 `(evil-goggles-change-face ((t (:background ,dustveil-foreground
                                             :foreground ,dustveil-background))))
 `(evil-goggles-yank-face ((t (:background ,dustveil-accent
                                           :foreground ,dustveil-background))))
 `(evil-goggles-paste-face ((t (:background ,dustveil-color-5
                                            :foreground ,dustveil-background))))
 `(evil-goggles-replace-with-register-face ((t (:background ,dustveil-foreground
                                                           :foreground ,dustveil-background))))
 `(evil-goggles-surround-face ((t (:background ,dustveil-foreground
                                               :foreground ,dustveil-background))))
 `(evil-snipe-first-match-face ((t (:background ,dustveil-foreground
                                                :foreground ,dustveil-background
                                                :bold t))))
 `(evil-snipe-matches-face ((t (:background ,dustveil-surface
                                            :foreground ,dustveil-color-15))))
 `(anzu-mode-line ((t (:foreground ,dustveil-accent :bold t))))
 `(anzu-mode-line-no-match ((t (:foreground ,dustveil-color-15 :bold t))))
 `(anzu-replace-highlight ((t (:background ,dustveil-surface
                                           :foreground ,dustveil-color-15))))
 `(anzu-replace-to ((t (:foreground ,dustveil-accent :bold t))))
 `(anzu-match-1 ((t (:foreground ,dustveil-accent))))
 `(anzu-match-2 ((t (:foreground ,dustveil-color-3))))
 `(anzu-match-3 ((t (:foreground ,dustveil-color-6))))
 `(iedit-occurrence ((t (:background ,dustveil-surface
                                     :foreground ,dustveil-color-15 :bold t))))
 `(iedit-read-only-occurrence ((t (:background ,dustveil-surface
                                               :foreground ,dustveil-color-1
                                               :italic t))))

 ;; --- navigation -------------------------------------------------------------------------
 `(avy-lead-face ((t (:background ,dustveil-foreground
                                  :foreground ,dustveil-background :bold t))))
 `(avy-lead-face-0 ((t (:background ,dustveil-foreground
                                    :foreground ,dustveil-background :bold t))))
 `(avy-lead-face-1 ((t (:background ,dustveil-surface
                                    :foreground ,dustveil-color-15 :bold t))))
 `(avy-lead-face-2 ((t (:background ,dustveil-surface
                                    :foreground ,dustveil-color-15 :bold t))))
 `(avy-background-face ((t (:foreground ,dustveil-color-1))))
 `(avy-goto-char-timer-face ((t (:background ,dustveil-surface
                                             :foreground
                                             ,dustveil-color-15 :bold t))))
 `(aw-leading-char-face ((t (:foreground ,dustveil-accent :bold t))))
 `(aw-background-face ((t (:foreground ,dustveil-color-1))))
 `(aw-mode-line-face ((t (:foreground ,dustveil-accent :bold t))))
 `(aw-minibuffer-leading-char-face ((t (:foreground ,dustveil-accent
                                                    :bold t))))

 ;; --- misc ui ------------------------------------------------------------------------------
 `(hl-todo ((t (:foreground ,dustveil-accent :bold t))))
 `(link ((t (:foreground ,dustveil-accent :underline t))))
 `(link-visited ((t (:foreground ,dustveil-color-3 :underline t))))
 `(tooltip ((t (:background ,dustveil-background
                            :foreground ,dustveil-foreground))))
 `(popup-face ((t (:background ,dustveil-background
                               :foreground ,dustveil-foreground))))
 `(popup-tip-face ((t (:background ,dustveil-surface
                                   :foreground ,dustveil-accent))))
 `(popup-menu-selection-face ((t (:background ,dustveil-surface :foreground ,dustveil-foreground
                                             :box (:color ,dustveil-accent) :extend t))))
 `(popup-menu-summary-face ((t (:inherit shadow))))
 `(child-frame-border ((t (:background ,dustveil-color-1))))
 `(nav-flash-face ((t (:background ,dustveil-surface
                                   :foreground ,dustveil-accent))))
 `(which-key-key-face ((t (:foreground ,dustveil-accent :bold t))))
 `(which-key-command-description-face ((t (:foreground ,dustveil-foreground))))
 `(which-key-group-description-face ((t (:foreground ,dustveil-color-1))))
 `(which-key-special-key-face ((t (:foreground ,dustveil-accent :bold t))))
 `(which-key-separator-face ((t (:foreground ,dustveil-color-1))))
 `(which-key-note-face ((t (:inherit shadow :italic t))))
 `(dashboard-banner-logo-title ((t (:foreground ,dustveil-accent :bold t))))
 `(doom-dashboard-default ((t (:background ,dustveil-background :foreground ,dustveil-foreground))))
 `(dashboard-items-face ((t (:foreground ,dustveil-foreground))))
 `(dashboard-heading ((t (:foreground ,dustveil-accent :bold t))))
 `(dashboard-navigator-face ((t (:foreground ,dustveil-color-6))))
 `(transient-key ((t (:foreground ,dustveil-accent :bold t))))
 `(transient-heading ((t (:foreground ,dustveil-color-3 :bold t))))
 `(transient-argument ((t (:foreground ,dustveil-color-6))))
 `(transient-value ((t (:foreground ,dustveil-color-3))))
 `(transient-inactive-argument ((t (:inherit shadow))))
 `(transient-inactive-value ((t (:inherit shadow))))
 `(transient-unreachable ((t (:foreground ,dustveil-color-1 :strike-through t))))
 `(transient-unreachable-key ((t (:foreground ,dustveil-color-1))))
 `(vundo-default ((t (:foreground ,dustveil-foreground))))
 `(vundo-highlight ((t (:foreground ,dustveil-accent :bold t))))
 `(vundo-stem ((t (:foreground ,dustveil-color-0))))
 `(vundo-saved ((t (:foreground ,dustveil-accent))))
 `(vundo-last-saved ((t (:foreground ,dustveil-accent :bold t))))
 `(treesit-fold-fringe-face ((t (:foreground ,dustveil-color-1))))
 `(treesit-fold-replacement-face ((t (:foreground ,dustveil-color-1))))
 `(macrostep-expansion-highlight-face ((t (:background ,dustveil-surface))))
 `(macrostep-macro-face ((t (:foreground ,dustveil-foreground :bold t))))
 `(macrostep-compiler-macro-face ((t (:foreground ,dustveil-foreground :bold t))))
 `(macrostep-gensym-1 ((t (:foreground ,dustveil-foreground))))
 `(macrostep-gensym-2 ((t (:foreground ,dustveil-foreground))))
 `(macrostep-gensym-3 ((t (:foreground ,dustveil-foreground))))
 `(macrostep-gensym-4 ((t (:foreground ,dustveil-foreground))))
 `(macrostep-gensym-5 ((t (:foreground ,dustveil-foreground))))
 `(wgrep-face ((t (:foreground ,dustveil-color-3))))
 `(wgrep-done-face ((t (:foreground ,dustveil-accent))))
 `(wgrep-delete-face ((t (:foreground ,dustveil-color-15 :strike-through t))))
 `(wgrep-file-face ((t (:foreground ,dustveil-foreground))))
 `(wgrep-reject-face ((t (:foreground ,dustveil-color-15 :bold t))))
 `(highlight-quoted-quote ((t (:foreground ,dustveil-foreground))))
 `(highlight-quoted-symbol ((t (:foreground ,dustveil-foreground))))
 `(eros-result-overlay-face ((t (:background ,dustveil-background
                                             :foreground ,dustveil-color-7))))
 `(yas-field-highlight-face ((t (:background ,dustveil-surface))))
 `(dape-breakpoint-face ((t (:background ,dustveil-color-15
                                         :foreground ,dustveil-background))))
 `(dape-breakpoint-until-face ((t (:background ,dustveil-foreground
                                               :foreground ,dustveil-background))))
 `(dape-source-line-face ((t (:background ,dustveil-surface
                                          :foreground ,dustveil-color-15))))
 `(dape-expression-face ((t (:foreground ,dustveil-color-7))))
 `(dape-inlay-hint-face ((t (:foreground ,dustveil-color-1
                                         :background ,dustveil-surface
                                         :italic t))))
 `(dape-repl-error-face ((t (:foreground ,dustveil-color-15))))
 `(dape-log-face ((t (:inherit shadow))))
 `(dape-header-line-active-face ((t (:background ,dustveil-foreground
                                                 :foreground ,dustveil-background))))
 `(dape-header-line-inactive-face ((t (:background ,dustveil-background
                                                   :foreground
                                                   ,dustveil-color-1))))
 `(dape-hits-face ((t (:foreground ,dustveil-accent))))

 ;; --- nerd-icons -------------------------------------------------------------------------------
 `(nerd-icons-blue ((t (:foreground ,dustveil-color-6))))
 `(nerd-icons-blue-alt ((t (:foreground ,dustveil-color-6))))
 `(nerd-icons-cyan ((t (:foreground ,dustveil-color-6))))
 `(nerd-icons-cyan-alt ((t (:foreground ,dustveil-color-6))))
 `(nerd-icons-green ((t (:foreground ,dustveil-color-7))))
 `(nerd-icons-orange ((t (:foreground ,dustveil-accent))))
 `(nerd-icons-purple ((t (:foreground ,dustveil-color-3))))
 `(nerd-icons-purple-alt ((t (:foreground ,dustveil-color-3))))
 `(nerd-icons-red ((t (:foreground ,dustveil-color-5))))
 `(nerd-icons-red-alt ((t (:foreground ,dustveil-color-5))))
 `(nerd-icons-yellow ((t (:foreground ,dustveil-color-3))))
 `(nerd-icons-pink ((t (:foreground ,dustveil-color-3))))
 `(nerd-icons-maroon ((t (:foreground ,dustveil-color-5))))
 `(nerd-icons-silver ((t (:foreground ,dustveil-color-1))))
 `(nerd-icons-dblue ((t (:foreground ,dustveil-color-6))))
 `(nerd-icons-dcyan ((t (:foreground ,dustveil-color-6))))
 `(nerd-icons-dgreen ((t (:foreground ,dustveil-color-7))))
 `(nerd-icons-dorange ((t (:foreground ,dustveil-accent))))
 `(nerd-icons-dpurple ((t (:foreground ,dustveil-color-3))))
 `(nerd-icons-dpink ((t (:foreground ,dustveil-color-3))))
 `(nerd-icons-dred ((t (:foreground ,dustveil-color-5))))
 `(nerd-icons-dyellow ((t (:foreground ,dustveil-color-3))))
 `(nerd-icons-dsilver ((t (:foreground ,dustveil-color-1))))
 `(nerd-icons-lblue ((t (:foreground ,dustveil-color-6))))
 `(nerd-icons-lcyan ((t (:foreground ,dustveil-color-6))))
 `(nerd-icons-lgreen ((t (:foreground ,dustveil-color-7))))
 `(nerd-icons-lorange ((t (:foreground ,dustveil-accent))))
 `(nerd-icons-lpurple ((t (:foreground ,dustveil-color-3))))
 `(nerd-icons-lpink ((t (:foreground ,dustveil-color-3))))
 `(nerd-icons-lred ((t (:foreground ,dustveil-color-5))))
 `(nerd-icons-lyellow ((t (:foreground ,dustveil-color-3))))
 `(nerd-icons-lsilver ((t (:foreground ,dustveil-color-15))))

 ;; --- lsp-mode -----------------------------------------------------------------------------------
 `(lsp-face-highlight-read ((t (:background ,dustveil-surface))))
 `(lsp-face-highlight-textual ((t (:background ,dustveil-surface))))
 `(lsp-face-highlight-write ((t (:background ,dustveil-surface
                                             :box (:color ,dustveil-accent)))))
 `(lsp-face-rename ((t (:background ,dustveil-surface))))
 `(lsp-ui-doc-background ((t (:background ,dustveil-background))))
 `(lsp-inlay-hint-face ((t (:foreground ,dustveil-color-1
                                        :background ,dustveil-surface
                                        :italic t))))
 `(lsp-inlay-hint-parameter-face ((t (:foreground ,dustveil-color-1
                                                 :background
                                                 ,dustveil-surface
                                                 :italic t))))
 `(lsp-inlay-hint-type-face ((t (:foreground ,dustveil-color-1
                                             :background ,dustveil-surface
                                             :italic t))))
 `(lsp-lens-face ((t (:inherit shadow))))
 `(lsp-details-face ((t (:inherit shadow :italic t))))
 `(lsp-modeline-code-actions-face ((t (:foreground ,dustveil-color-3))))
 `(lsp-signature-face ((t (:foreground ,dustveil-color-7 :italic t))))
 `(lsp-signature-highlight-function-argument ((t (:foreground
                                                  ,dustveil-accent :bold t))))
 `(lsp-signature-posframe ((t (:background ,dustveil-background
                                           :foreground ,dustveil-foreground))))
 `(lsp-headerline-breadcrumb-path-face ((t (:foreground ,dustveil-color-1))))
 `(lsp-headerline-breadcrumb-symbols-face ((t (:foreground ,dustveil-accent))))
 `(lsp-headerline-breadcrumb-separator-face ((t (:foreground ,dustveil-color-1))))
 `(lsp-headerline-breadcrumb-project-prefix-face ((t (:foreground
                                                     ,dustveil-color-3))))
 `(lsp-headerline-breadcrumb-path-error-face ((t (:foreground ,dustveil-color-15))))
 `(lsp-headerline-breadcrumb-path-warning-face ((t (:foreground
                                                   ,dustveil-color-3))))
 `(lsp-headerline-breadcrumb-path-info-face ((t (:foreground ,dustveil-color-5))))
 `(lsp-headerline-breadcrumb-path-hint-face ((t (:foreground ,dustveil-color-6))))
 `(lsp-headerline-breadcrumb-symbols-error-face ((t (:foreground
                                                     ,dustveil-color-15))))
 `(lsp-headerline-breadcrumb-symbols-warning-face ((t (:foreground
                                                      ,dustveil-color-3))))
 `(lsp-headerline-breadcrumb-symbols-info-face ((t (:foreground
                                                   ,dustveil-color-5))))
 `(lsp-headerline-breadcrumb-symbols-hint-face ((t (:foreground
                                                   ,dustveil-color-6))))
 `(lsp-headerline-breadcrumb-deprecated-face ((t (:foreground ,dustveil-color-1
                                                              :strike-through t))))
 `(lsp-face-semhl-keyword ((t (:inherit font-lock-keyword-face))))
 `(lsp-face-semhl-string ((t (:inherit font-lock-string-face))))
 `(lsp-face-semhl-number ((t (:inherit font-lock-number-face))))
 `(lsp-face-semhl-constant ((t (:inherit font-lock-constant-face))))
 `(lsp-face-semhl-enum-member ((t (:inherit font-lock-constant-face))))
 `(lsp-face-semhl-function ((t (:inherit font-lock-function-call-face))))
 `(lsp-face-semhl-method ((t (:inherit font-lock-function-call-face))))
 `(lsp-face-semhl-macro ((t (:inherit font-lock-preprocessor-face))))
 `(lsp-face-semhl-variable ((t (:inherit font-lock-variable-use-face))))
 `(lsp-face-semhl-parameter ((t (:inherit font-lock-variable-use-face))))
 `(lsp-face-semhl-property ((t (:inherit font-lock-property-use-face))))
 `(lsp-face-semhl-member ((t (:inherit font-lock-property-use-face))))
 `(lsp-face-semhl-class ((t (:inherit font-lock-type-face))))
 `(lsp-face-semhl-struct ((t (:inherit font-lock-type-face))))
 `(lsp-face-semhl-interface ((t (:inherit font-lock-type-face))))
 `(lsp-face-semhl-enum ((t (:inherit font-lock-type-face))))
 `(lsp-face-semhl-event ((t (:foreground ,dustveil-foreground))))
 `(lsp-face-semhl-type-parameter ((t (:inherit font-lock-type-face))))
 `(lsp-face-semhl-decorator ((t (:foreground ,dustveil-foreground))))
 `(lsp-face-semhl-namespace ((t (:inherit font-lock-type-face))))
 `(lsp-face-semhl-label ((t (:foreground ,dustveil-foreground))))
 `(lsp-face-semhl-operator ((t (:inherit font-lock-operator-face))))
 `(lsp-face-semhl-regexp ((t (:inherit font-lock-regexp-face))))
 `(lsp-face-semhl-type ((t (:inherit font-lock-type-face))))
 `(lsp-face-semhl-comment ((t (:inherit font-lock-comment-face))))
 `(lsp-face-semhl-modifier ((t (:inherit font-lock-keyword-face))))
 ;; Modifiers preserve the token color from its base face.
 `(lsp-face-semhl-declaration ((t (:inherit nil :foreground unspecified :weight unspecified))))
 `(lsp-face-semhl-definition ((t (:inherit nil :foreground unspecified :weight unspecified))))
 `(lsp-face-semhl-implementation ((t (:inherit nil :foreground unspecified :weight unspecified))))
 `(lsp-face-semhl-static ((t (:inherit nil :foreground unspecified))))
 `(lsp-face-semhl-default-library ((t (:inherit nil :foreground unspecified))))
 `(lsp-face-semhl-deprecated ((t (:strike-through t))))

)

(let ((colors `((black . ,dustveil-color-0)
                (red . ,dustveil-color-1)
                (green . ,dustveil-color-2)
                (yellow . ,dustveil-color-3)
                (blue . ,dustveil-color-4)
                (magenta . ,dustveil-color-5)
                (cyan . ,dustveil-color-6)
                (white . ,dustveil-color-7)
                (bright-black . ,dustveil-color-8)
                (bright-red . ,dustveil-color-9)
                (bright-green . ,dustveil-color-10)
                (bright-yellow . ,dustveil-color-11)
                (bright-blue . ,dustveil-color-12)
                (bright-magenta . ,dustveil-color-13)
                (bright-cyan . ,dustveil-color-14)
                (bright-white . ,dustveil-color-15))))
  (dolist (prefix '("ansi-color-" "term-color-" "vterm-color-"))
    (dolist (entry colors)
      (custom-theme-set-faces
       'dustveil
       `(,(intern (concat prefix (symbol-name (car entry))))
         ((t (:foreground ,(cdr entry) :background ,(cdr entry)))))))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide 'dustveil-theme)
(provide-theme 'dustveil)
