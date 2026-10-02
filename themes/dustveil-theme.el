;;; dustveil-theme.el -*- lexical-binding: t; -*-

(deftheme dustveil
  "Dustveil: dark monochrome surfaces and warm gray tones."
  :background-mode 'dark
  :kind 'color-scheme)

(defgroup dustveil nil
  "Dustveil theme."
  :group 'faces
  :prefix "dustveil-")

(defconst dustveil-foreground "#f1e6dc")
(defconst dustveil-background "#090909")
(defconst dustveil-surface "#1b1917")
(defconst dustveil-accent "#aaa19a")
(defconst dustveil-border "#898078")
(defconst dustveil-secondary "#898078")
(defconst dustveil-separator "#504b47")
(defconst dustveil-syntax-comment "#665F5A")
(defconst dustveil-syntax-punctuation "#aaa19a")
(defconst dustveil-syntax-literal "#aaa19a")
(defconst dustveil-syntax-variable "#b6ada5")
(defconst dustveil-syntax-keyword "#d8cec4")
(defconst dustveil-syntax-function "#f1e6dc")
(defconst dustveil-color-0 "#898078")
(defconst dustveil-color-1 "#948b83")
(defconst dustveil-color-2 "#a0978f")
(defconst dustveil-color-3 "#aba29a")
(defconst dustveil-color-4 "#b6ada5")
(defconst dustveil-color-5 "#c2b9b1")
(defconst dustveil-color-6 "#cdc4bc")
(defconst dustveil-color-7 "#e0d7ce")
(defconst dustveil-color-8 "#a9a098")
(defconst dustveil-color-9 "#b4aba3")
(defconst dustveil-color-10 "#c0b7af")
(defconst dustveil-color-11 "#cbc2ba")
(defconst dustveil-color-12 "#d6cdc5")
(defconst dustveil-color-13 "#e2d9d1")
(defconst dustveil-color-14 "#ede4dc")
(defconst dustveil-color-15 "#fff6ed")

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
                            :foreground ,dustveil-secondary))
             (t (:background ,dustveil-background :foreground ,dustveil-secondary))))))

(custom-theme-set-faces
 'dustveil

 ;; --- base -------------------------------------------------------------------
 `(cursor ((t (:background ,dustveil-foreground))))
 `(region ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 `(highlight ((t (:background ,dustveil-surface))))
 `(hl-line ((t (:background ,dustveil-background))))
 `(secondary-selection ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 `(vertical-border ((t (:foreground ,dustveil-secondary))))
 `(window-divider ((t (:foreground ,dustveil-border))))
 `(shadow ((t (:foreground ,dustveil-secondary))))
 `(escape-glyph ((t (:foreground ,dustveil-secondary))))
 `(nobreak-space ((t (:foreground ,dustveil-syntax-literal :underline t))))
 `(file-name-shadow ((t (:inherit shadow))))
 `(fill-column-indicator ((t (:foreground ,dustveil-separator))))
 `(line-number ((t (:foreground ,dustveil-secondary :background unspecified))))
 `(line-number-current-line ((t (:foreground ,dustveil-accent
                                 :background ,dustveil-surface
                                 :bold t))))
 `(minibuffer-prompt ((t (:foreground ,dustveil-accent :bold t))))
 `(trailing-whitespace ((t (:background ,dustveil-surface))))
 `(show-paren-match ((t (:background ,dustveil-surface :bold t :underline t))))
 `(show-paren-mismatch ((t (:foreground ,dustveil-background
                            :background ,dustveil-foreground))))
 `(match ((t (:background ,dustveil-surface
              :foreground ,dustveil-accent))))

 ;; --- search -------------------------------------------------------------------
 `(isearch ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 `(isearch-fail ((t (:foreground ,dustveil-foreground :underline t))))
 `(lazy-highlight ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 `(query-replace ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 ;; --- mode-line, header-line, tab-bar ---------------------------------------------
 `(mode-line ((t (:background ,dustveil-background
                  :foreground ,dustveil-foreground
                  :box (:color ,dustveil-secondary)))))
 `(mode-line-inactive ((t (:background ,dustveil-surface
                           :foreground ,dustveil-secondary
                           :box (:color ,dustveil-border)))))
 `(mode-line-active ((t (:inherit mode-line))))
 `(mode-line-buffer-id ((t (:foreground ,dustveil-accent :bold t))))
 `(mode-line-highlight ((t (:foreground ,dustveil-accent))))
 `(mode-line-emphasis ((t (:foreground ,dustveil-foreground :bold t))))
 `(header-line ((t (:inherit mode-line))))
 `(header-line-highlight ((t (:inherit mode-line-highlight))))
 `(tab-bar ((t (:background ,dustveil-background
                :foreground ,dustveil-secondary))))
 `(tab-bar-tab ((t (:background ,dustveil-surface
                    :foreground ,dustveil-foreground :weight bold))))
 `(tab-bar-tab-inactive ((t (:background ,dustveil-background
                             :foreground ,dustveil-secondary))))
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
 `(doom-modeline-bar-inactive ((t (:background ,dustveil-secondary))))
 `(doom-modeline-buffer-file ((t (:foreground ,dustveil-foreground))))
 `(doom-modeline-buffer-path ((t (:foreground ,dustveil-foreground))))
 `(doom-modeline-buffer-major-mode ((t (:foreground ,dustveil-syntax-variable))))
 `(doom-modeline-buffer-minor-mode ((t (:inherit shadow))))
 `(doom-modeline-buffer-modified ((t (:foreground ,dustveil-accent :bold t))))
 `(doom-modeline-emphasis ((t (:foreground ,dustveil-foreground :bold t))))
 `(doom-modeline-highlight ((t (:foreground ,dustveil-accent))))
 `(doom-modeline-info ((t (:foreground ,dustveil-syntax-variable))))
 `(doom-modeline-warning ((t (:foreground ,dustveil-syntax-literal))))
 `(doom-modeline-urgent ((t (:foreground ,dustveil-foreground :bold t))))
 `(doom-modeline-debug ((t (:foreground ,dustveil-syntax-literal))))
 `(doom-modeline-debug-visual ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(doom-modeline-vcs-default ((t (:foreground ,dustveil-syntax-keyword))))
 `(doom-modeline-lsp-error ((t (:foreground ,dustveil-foreground))))
 `(doom-modeline-lsp-warning ((t (:foreground ,dustveil-syntax-literal))))
 `(doom-modeline-lsp-success ((t (:foreground ,dustveil-accent))))
 `(doom-modeline-lsp-running ((t (:foreground ,dustveil-syntax-literal))))
 `(doom-modeline-evil-normal-state ((t (:foreground ,dustveil-accent :bold t))))
 `(doom-modeline-evil-insert-state ((t (:foreground ,dustveil-syntax-keyword :bold t))))
 `(doom-modeline-evil-visual-state ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(doom-modeline-evil-replace-state ((t (:foreground ,dustveil-syntax-variable :bold t))))
 `(doom-modeline-evil-emacs-state ((t (:foreground ,dustveil-syntax-variable :bold t))))
 `(doom-modeline-evil-motion-state ((t (:foreground ,dustveil-syntax-variable :bold t))))
 `(doom-modeline-evil-operator-state ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(doom-modeline-evil-user-state ((t (:foreground ,dustveil-syntax-variable :bold t))))
 `(doom-modeline-battery-critical ((t (:foreground ,dustveil-foreground :bold t))))
 `(doom-modeline-battery-error ((t (:foreground ,dustveil-foreground))))
 `(doom-modeline-battery-warning ((t (:foreground ,dustveil-syntax-literal))))
 `(doom-modeline-battery-charging ((t (:foreground ,dustveil-accent))))
 `(doom-modeline-battery-full ((t (:foreground ,dustveil-accent))))
 `(doom-modeline-battery-normal ((t (:foreground ,dustveil-syntax-keyword))))
 `(doom-modeline-unread-number ((t (:foreground ,dustveil-accent :bold t))))
 `(doom-modeline-compilation ((t (:foreground ,dustveil-syntax-literal))))
 `(doom-modeline-panel ((t (:background ,dustveil-foreground
                            :foreground ,dustveil-background :bold t))))
 `(doom-modeline-persp-name ((t (:foreground ,dustveil-syntax-literal))))
 `(doom-modeline-workspace-name ((t (:foreground ,dustveil-accent :bold t))))
 `(doom-modeline-persp-buffer-not-in-persp
   ((t (:inherit shadow :italic t))))
 `(doom-modeline-project-dir ((t (:foreground ,dustveil-accent))))
 `(doom-modeline-project-name ((t (:foreground ,dustveil-accent))))
 `(doom-modeline-project-parent-dir ((t (:inherit shadow))))
 `(doom-modeline-project-root-dir ((t (:inherit shadow))))
 `(doom-modeline-repl-success ((t (:foreground ,dustveil-accent))))
 `(doom-modeline-repl-warning ((t (:foreground ,dustveil-syntax-literal))))
 `(doom-modeline-overwrite ((t (:foreground ,dustveil-foreground :bold t))))
 `(doom-modeline-time ((t (:foreground ,dustveil-secondary))))
 `(doom-modeline-host ((t (:foreground ,dustveil-secondary))))
 `(doom-modeline-input-method ((t (:foreground ,dustveil-secondary))))

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
 `(font-lock-warning-face ((t (:foreground ,dustveil-syntax-literal))))
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
 `(error ((t (:foreground ,dustveil-foreground))))
 `(warning ((t (:foreground ,dustveil-syntax-literal))))
 `(success ((t (:foreground ,dustveil-accent))))
 `(flycheck-error ((t (:underline (:style wave :color ,dustveil-foreground)))))
 `(flycheck-warning ((t (:underline (:style wave :color ,dustveil-syntax-literal)))))
 `(flycheck-info ((t (:underline (:style wave :color ,dustveil-syntax-variable)))))
 `(flycheck-fringe-error ((t (:inherit error))))
 `(flycheck-fringe-warning ((t (:inherit warning))))
 `(flycheck-fringe-info ((t (:inherit compilation-info))))
 `(flycheck-error-list-error ((t (:foreground ,dustveil-foreground :bold t))))
 `(flycheck-error-list-warning ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(flycheck-error-list-info ((t (:foreground ,dustveil-syntax-variable :bold t))))
 `(flycheck-error-list-line-number ((t (:inherit shadow))))
 `(flycheck-error-list-column-number ((t (:inherit shadow))))
 `(flycheck-error-list-id ((t (:foreground ,dustveil-secondary))))
 `(flycheck-error-list-filename ((t (:foreground ,dustveil-syntax-variable))))
 `(flymake-error ((t (:underline (:style wave :color ,dustveil-foreground)))))
 `(flymake-warning ((t (:underline (:style wave :color ,dustveil-syntax-literal)))))
 `(flymake-note ((t (:underline (:style wave :color ,dustveil-syntax-variable)))))

 ;; --- eglot ------------------------------------------------------------------------
 `(eglot-highlight-symbol-face ((t (:background ,dustveil-surface))))
 `(eglot-diagnostic-tag-unnecessary-face ((t (:inherit shadow))))
 `(eglot-diagnostic-tag-deprecated-face ((t (:strike-through t))))
 `(eglot-inlay-hint-face ((t (:inherit shadow :height 0.8 :slant italic))))
 `(eglot-type-hint-face ((t (:inherit eglot-inlay-hint-face
                             :foreground ,dustveil-syntax-literal))))
 `(eglot-parameter-hint-face ((t (:inherit eglot-inlay-hint-face
                                  :foreground ,dustveil-accent))))

 ;; --- completions ---------------------------------------------------------------------
 `(completions-common-part ((t (:inherit nil :foreground unspecified :bold t :underline t))))
 `(completions-first-difference ((t (:inherit completions-common-part :foreground unspecified))))
 `(completions-annotations ((t (:inherit shadow :slant italic))))
 `(completions-highlight ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 `(completions-group-title ((t (:foreground ,dustveil-syntax-literal :weight bold))))
 `(completions-group-separator ((t (:foreground ,dustveil-secondary
                                    :strike-through t))))
 `(corfu-default ((t (:background ,dustveil-background
                      :foreground ,dustveil-foreground))))
 `(corfu-current ((t (:background ,dustveil-surface :foreground ,dustveil-foreground
                      :box (:color ,dustveil-accent) :extend t))))
 `(corfu-annotations ((t (:inherit completions-annotations))))
 `(corfu-deprecated ((t (:inherit shadow :strike-through t))))
 `(corfu-bar ((t (:background ,dustveil-secondary))))
 `(corfu-border ((t (:background ,dustveil-foreground :foreground ,dustveil-background))))
 `(corfu-echo ((t (:inherit completions-annotations))))
 `(corfu-popupinfo ((t (:background ,dustveil-background
                        :foreground ,dustveil-syntax-keyword))))
 `(corfu-quick1 ((t (:foreground ,dustveil-accent :bold t))))
 `(corfu-quick2 ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(vertico-current ((t (:background ,dustveil-surface :foreground ,dustveil-foreground
                        :box (:color ,dustveil-accent) :extend t))))
 `(vertico-group-title ((t (:inherit completions-group-title))))
 `(vertico-group-separator ((t (:foreground ,dustveil-secondary))))
 `(orderless-match-face-0 ((t (:inherit completions-common-part :foreground unspecified))))
 `(orderless-match-face-1 ((t (:inherit completions-common-part :foreground unspecified))))
 `(orderless-match-face-2 ((t (:inherit completions-common-part :foreground unspecified))))
 `(orderless-match-face-3 ((t (:inherit completions-common-part :foreground unspecified))))
 `(marginalia-documentation ((t (:inherit completions-annotations))))
 `(marginalia-key ((t (:foreground ,dustveil-accent :bold t))))
 `(marginalia-value ((t (:foreground ,dustveil-syntax-keyword))))
 `(marginalia-lighter ((t (:inherit shadow))))
 `(marginalia-modified ((t (:foreground ,dustveil-syntax-literal))))
 `(marginalia-date ((t (:foreground ,dustveil-syntax-variable))))
 `(marginalia-type ((t (:foreground ,dustveil-syntax-variable))))
 `(marginalia-on ((t (:foreground ,dustveil-accent))))
 `(marginalia-off ((t (:inherit shadow))))
 `(marginalia-installed ((t (:foreground ,dustveil-accent))))
 `(marginalia-archive ((t (:inherit shadow))))
 `(marginalia-null ((t (:inherit shadow))))
 `(marginalia-number ((t (:foreground ,dustveil-syntax-literal))))
 `(marginalia-function ((t (:foreground ,dustveil-syntax-variable))))
 `(marginalia-symbol ((t (:foreground ,dustveil-syntax-literal))))
 `(consult-help ((t (:foreground ,dustveil-accent))))
 `(consult-key ((t (:foreground ,dustveil-accent :bold t))))
 `(consult-grep-context ((t (:inherit completions-annotations))))
 `(consult-preview-line ((t (:background ,dustveil-surface))))
 `(consult-preview-insertion ((t (:background ,dustveil-surface))))
 `(consult-preview-match ((t (:foreground ,dustveil-accent :bold t))))
 `(consult-highlight-match ((t (:inherit completions-common-part :foreground unspecified))))
 `(consult-highlight-mark ((t (:background ,dustveil-surface))))
 `(consult-async-split ((t (:foreground ,dustveil-accent :bold t))))
 `(consult-async-running ((t (:foreground ,dustveil-syntax-literal))))
 `(consult-async-failed ((t (:foreground ,dustveil-foreground))))
 `(consult-async-finished ((t (:foreground ,dustveil-accent))))
 `(consult-async-option ((t (:foreground ,dustveil-syntax-variable))))
 `(consult-narrow-indicator ((t (:foreground ,dustveil-secondary))))
 `(consult-imenu-prefix ((t (:inherit shadow))))
 `(consult-line-number ((t (:inherit shadow))))
 `(embark-keybinding ((t (:foreground ,dustveil-accent :bold t))))
 `(embark-keybinding-repeat ((t (:foreground ,dustveil-accent :bold t
                                 :underline t))))
 `(embark-keymap ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(embark-target ((t (:foreground ,dustveil-accent))))
 `(embark-selected ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 `(embark-collect-group-title ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(embark-collect-group-separator ((t (:foreground ,dustveil-secondary))))
 `(embark-collect-candidate ((t (:foreground ,dustveil-foreground))))
 `(embark-collect-annotation ((t (:inherit completions-annotations))))
 `(embark-verbose-indicator-title ((t (:foreground ,dustveil-accent :bold t))))
 `(embark-verbose-indicator-documentation
   ((t (:inherit completions-annotations))))
 `(embark-verbose-indicator-shadowed ((t (:foreground ,dustveil-secondary))))

 ;; --- dired, diredfl, dirvish -------------------------------------------------------
 `(dired-directory ((t (:foreground ,dustveil-syntax-literal))))
 `(dired-symlink ((t (:foreground ,dustveil-syntax-variable))))
 `(dired-broken-symlink ((t (:foreground ,dustveil-foreground :bold t))))
 `(dired-flagged ((t (:foreground ,dustveil-foreground
                      :background ,dustveil-surface))))
 `(dired-marked ((t (:foreground ,dustveil-background
                     :background ,dustveil-foreground))))
 `(dired-mark ((t (:foreground ,dustveil-accent :bold t))))
 `(dired-header ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(dired-special ((t (:foreground ,dustveil-syntax-keyword))))
 `(dired-ignored ((t (:foreground ,dustveil-secondary))))
 `(dired-warning ((t (:foreground ,dustveil-syntax-literal))))
 `(diredfl-dir-heading ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(diredfl-dir-name ((t (:foreground ,dustveil-syntax-variable :bold t))))
 `(diredfl-dir-priv ((t (:foreground ,dustveil-syntax-variable))))
 `(diredfl-file-name ((t (:foreground ,dustveil-foreground))))
 `(diredfl-file-suffix ((t (:foreground ,dustveil-secondary))))
 `(diredfl-date-time ((t (:inherit shadow))))
 `(diredfl-number ((t (:inherit shadow))))
 `(diredfl-symlink ((t (:foreground ,dustveil-syntax-variable))))
 `(diredfl-executable-tag ((t (:foreground ,dustveil-syntax-keyword))))
 `(diredfl-compressed-file-name ((t (:foreground ,dustveil-foreground))))
 `(diredfl-compressed-file-suffix ((t (:foreground ,dustveil-syntax-literal))))
 `(diredfl-ignored-file-name ((t (:foreground ,dustveil-secondary))))
 `(diredfl-flag-mark ((t (:foreground ,dustveil-background
                          :background ,dustveil-foreground :bold t))))
 `(diredfl-flag-mark-line ((t (:background ,dustveil-foreground
                               :foreground ,dustveil-background))))
 `(diredfl-deletion ((t (:foreground ,dustveil-background
                         :background ,dustveil-foreground :bold t))))
 `(diredfl-deletion-file-name ((t (:foreground ,dustveil-foreground))))
 `(diredfl-read-priv ((t (:inherit shadow))))
 `(diredfl-write-priv ((t (:inherit shadow))))
 `(diredfl-exec-priv ((t (:foreground ,dustveil-syntax-keyword))))
 `(diredfl-no-priv ((t (:foreground ,dustveil-secondary))))
 `(diredfl-link-priv ((t (:foreground ,dustveil-syntax-variable))))
 `(diredfl-other-priv ((t (:foreground ,dustveil-secondary))))
 `(diredfl-rare-priv ((t (:foreground ,dustveil-syntax-literal))))
 `(dirvish-hl-line ((t (:background ,dustveil-surface))))
 `(dirvish-hl-line-inactive ((t (:background ,dustveil-background))))
 `(dirvish-inactive ((t (:inherit shadow))))
 `(dirvish-subtree-guide ((t (:foreground ,dustveil-secondary))))
 `(dirvish-emerge-group-title ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(dirvish-narrow-match-face-0 ((t (:foreground ,dustveil-accent :bold t))))
 `(dirvish-narrow-match-face-1 ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(dirvish-narrow-match-face-2 ((t (:foreground ,dustveil-syntax-keyword :bold t))))
 `(dirvish-narrow-match-face-3 ((t (:foreground ,dustveil-syntax-variable :bold t))))
 `(dirvish-narrow-split ((t (:foreground ,dustveil-secondary))))
 `(dirvish-vc-added-state ((t (:foreground ,dustveil-accent))))
 `(dirvish-vc-edited-state ((t (:foreground ,dustveil-syntax-literal))))
 `(dirvish-vc-conflict-state ((t (:foreground ,dustveil-foreground :bold t))))
 `(dirvish-vc-removed-state ((t (:foreground ,dustveil-secondary))))
 `(dirvish-vc-unregistered-face ((t (:foreground ,dustveil-secondary))))
 `(dirvish-proc-failed ((t (:foreground ,dustveil-foreground))))
 `(dirvish-proc-finished ((t (:foreground ,dustveil-accent))))
 `(dirvish-proc-running ((t (:foreground ,dustveil-syntax-literal))))
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
 `(dirvish-collapse-dir-face ((t (:foreground ,dustveil-syntax-variable))))
 `(dirvish-collapse-file-face ((t (:foreground ,dustveil-foreground))))
 `(dirvish-collapse-empty-dir-face ((t (:foreground ,dustveil-secondary))))
 `(dirvish-media-info-heading ((t (:foreground ,dustveil-accent :bold t))))

 ;; --- diff, magit, vc ------------------------------------------------------------------
 `(diff-hl-change ((t (:foreground ,dustveil-syntax-literal))))
 `(diff-hl-delete ((t (:foreground ,dustveil-foreground))))
 `(diff-hl-insert ((t (:foreground ,dustveil-accent))))
 `(diff-added ((t (:foreground ,dustveil-accent
                   :background ,dustveil-background))))
 `(diff-removed ((t (:foreground ,dustveil-foreground
                     :background ,dustveil-background))))
 `(diff-changed ((t (:foreground ,dustveil-syntax-literal))))
 `(diff-refine-added ((t (:foreground ,dustveil-accent :bold t))))
 `(diff-refine-removed ((t (:foreground ,dustveil-foreground :bold t))))
 `(diff-refine-changed ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(diff-header ((t (:foreground ,dustveil-secondary))))
 `(diff-hunk-header ((t (:foreground ,dustveil-secondary
                         :background ,dustveil-surface))))
 `(diff-file-header ((t (:foreground ,dustveil-accent :bold t))))
 `(magit-section-highlight ((t (:background ,dustveil-surface))))
 `(magit-section-heading ((t (:foreground ,dustveil-accent :bold t))))
 `(magit-section-heading-selection ((t (:foreground ,dustveil-accent))))
 `(magit-dimmed ((t (:foreground ,dustveil-secondary))))
 `(magit-hash ((t (:inherit shadow))))
 `(magit-header-line ((t (:foreground ,dustveil-accent :bold t))))
 `(magit-branch-local ((t (:foreground ,dustveil-syntax-variable))))
 `(magit-branch-remote ((t (:foreground ,dustveil-syntax-literal))))
 `(magit-branch-current ((t (:foreground ,dustveil-accent :bold t))))
 `(magit-tag ((t (:foreground ,dustveil-syntax-literal))))
 `(magit-refname ((t (:foreground ,dustveil-syntax-keyword))))
 `(magit-log-author ((t (:foreground ,dustveil-syntax-variable))))
 `(magit-log-date ((t (:inherit shadow))))
 `(magit-diff-hunk-heading ((t (:foreground ,dustveil-secondary
                                :background ,dustveil-background))))
 `(magit-diff-hunk-heading-highlight ((t (:foreground ,dustveil-secondary
                                          :background
                                          ,dustveil-surface))))
 `(magit-diff-added ((t (:foreground ,dustveil-accent))))
 `(magit-diff-added-highlight ((t (:foreground ,dustveil-accent
                                   :background ,dustveil-surface))))
 `(magit-diff-removed ((t (:foreground ,dustveil-foreground))))
 `(magit-diff-removed-highlight ((t (:foreground ,dustveil-foreground
                                     :background
                                     ,dustveil-surface))))
 `(magit-diff-context ((t (:foreground ,dustveil-syntax-keyword))))
 `(magit-diff-context-highlight ((t (:foreground ,dustveil-foreground
                                     :background
                                     ,dustveil-surface))))
 `(magit-diff-our ((t (:foreground ,dustveil-foreground))))
 `(magit-diff-their ((t (:foreground ,dustveil-accent))))
 `(magit-diff-base ((t (:foreground ,dustveil-syntax-literal))))
 `(magit-diff-base-highlight ((t (:foreground ,dustveil-syntax-literal
                                  :background
                                  ,dustveil-surface))))
 `(magit-diffstat-added ((t (:foreground ,dustveil-accent))))
 `(magit-diffstat-removed ((t (:foreground ,dustveil-foreground))))
 `(git-commit-summary ((t (:foreground ,dustveil-foreground))))
 `(ediff-current-diff-A ((t (:foreground ,dustveil-foreground
                             :background ,dustveil-surface))))
 `(ediff-current-diff-B ((t (:foreground ,dustveil-accent
                             :background ,dustveil-surface))))
 `(ediff-current-diff-C ((t (:foreground ,dustveil-syntax-literal
                             :background ,dustveil-surface))))
 `(ediff-current-diff-Ancestor ((t (:foreground ,dustveil-secondary
                                    :background ,dustveil-surface
                                    :box (:color ,dustveil-border)))))
 `(ediff-fine-diff-A ((t (:foreground ,dustveil-foreground :bold t
                          :background ,dustveil-surface))))
 `(ediff-fine-diff-B ((t (:foreground ,dustveil-accent :bold t
                          :background ,dustveil-surface))))
 `(ediff-fine-diff-C ((t (:foreground ,dustveil-syntax-literal :bold t
                          :background ,dustveil-surface))))
 `(ediff-fine-diff-Ancestor ((t (:foreground ,dustveil-secondary
                                 :background
                                 ,dustveil-surface))))
 `(ediff-even-diff-A ((t (:foreground ,dustveil-syntax-keyword
                          :background ,dustveil-background))))
 `(ediff-even-diff-B ((t (:foreground ,dustveil-syntax-keyword
                          :background ,dustveil-background))))
 `(ediff-even-diff-C ((t (:foreground ,dustveil-syntax-keyword
                          :background ,dustveil-background))))
 `(ediff-even-diff-Ancestor ((t (:foreground ,dustveil-syntax-keyword
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
 `(smerge-upper ((t (:foreground ,dustveil-foreground
                     :background ,dustveil-background))))
 `(smerge-lower ((t (:foreground ,dustveil-accent
                     :background ,dustveil-background))))
 `(smerge-base ((t (:foreground ,dustveil-syntax-literal
                    :background ,dustveil-background))))
 `(smerge-markers ((t (:foreground ,dustveil-secondary
                       :background ,dustveil-surface))))
 `(smerge-refined-added ((t (:foreground ,dustveil-accent :bold t))))
 `(smerge-refined-removed ((t (:foreground ,dustveil-foreground :bold t))))
 `(smerge-refined-changed ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(git-timemachine-commit ((t (:foreground ,dustveil-foreground :bold t))))
 `(git-timemachine-minibuffer-author-face ((t (:foreground ,dustveil-syntax-variable))))
 `(git-timemachine-minibuffer-detail-face ((t (:foreground ,dustveil-foreground))))

 ;; --- org ---------------------------------------------------------------------------
 ;; Includes the +org-todo-* faces Doom's org module declares dynamically.
 ;; A TTY cannot use its unknown default background as an invisible foreground.
 `(org-hide ((t (:foreground ,dustveil-background))))
 `(org-document-title ((t (:foreground ,dustveil-accent :bold t :height 1.2))))
 `(org-document-info ((t (:foreground ,dustveil-secondary))))
 `(org-level-1 ((t (:foreground ,dustveil-accent :bold t))))
 `(org-level-2 ((t (:foreground ,dustveil-syntax-variable :bold t))))
 `(org-level-3 ((t (:foreground ,dustveil-syntax-literal))))
 `(org-level-4 ((t (:foreground ,dustveil-foreground))))
 `(org-level-5 ((t (:foreground ,dustveil-syntax-literal))))
 `(org-level-6 ((t (:foreground ,dustveil-syntax-variable))))
 `(org-level-7 ((t (:foreground ,dustveil-syntax-keyword))))
 `(org-level-8 ((t (:foreground ,dustveil-secondary))))
 `(org-todo ((t (:foreground ,dustveil-accent :bold t))))
 `(org-done ((t (:foreground ,dustveil-accent :bold t))))
 `(+org-todo-active ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(+org-todo-onhold ((t (:foreground ,dustveil-syntax-variable :bold t))))
 `(+org-todo-cancel ((t (:foreground ,dustveil-secondary :strike-through t))))
 `(+org-todo-project ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(org-priority ((t (:foreground ,dustveil-syntax-literal))))
 `(org-tag ((t (:inherit shadow))))
 `(org-date ((t (:foreground ,dustveil-syntax-keyword :underline t))))
 `(org-special-keyword ((t (:inherit shadow))))
 `(org-meta-line ((t (:inherit shadow))))
 `(org-drawer ((t (:inherit shadow))))
 `(org-property-value ((t (:foreground ,dustveil-syntax-keyword))))
 `(org-table ((t (:foreground ,dustveil-syntax-keyword))))
 `(org-formula ((t (:foreground ,dustveil-syntax-literal))))
 `(org-block ((t (:background ,dustveil-background :extend t))))
 `(org-block-begin-line ((t (:foreground ,dustveil-secondary
                             :background ,dustveil-background
                             :extend t))))
 `(org-block-end-line ((t (:inherit org-block-begin-line))))
 `(org-code ((t (:foreground ,dustveil-syntax-keyword
                 :background ,dustveil-background :extend nil))))
 `(org-inline-src-block ((t (:inherit org-block :extend nil))))
 `(org-verbatim ((t (:foreground ,dustveil-syntax-keyword))))
 `(org-quote ((t (:inherit org-block :slant italic :extend t))))
 `(org-headline-done ((t (:foreground ,dustveil-secondary))))
 `(org-checkbox ((t (:foreground ,dustveil-accent :bold t))))
 `(org-link ((t (:foreground ,dustveil-accent :underline t))))
 `(org-footnote ((t (:foreground ,dustveil-secondary))))
 `(org-ellipsis ((t (:foreground ,dustveil-secondary))))
 `(org-column ((t (:background ,dustveil-surface))))
 `(org-column-title ((t (:foreground ,dustveil-accent :bold t
                         :background ,dustveil-surface))))
 `(org-clock-overlay ((t (:background ,dustveil-surface))))
 `(org-agenda-clocking ((t (:background ,dustveil-surface))))
 `(org-agenda-structure ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(org-agenda-date ((t (:foreground ,dustveil-syntax-variable))))
 `(org-agenda-date-today ((t (:foreground ,dustveil-accent :bold t))))
 `(org-agenda-date-weekend ((t (:foreground ,dustveil-syntax-keyword))))
 `(org-agenda-done ((t (:foreground ,dustveil-secondary))))
 `(org-scheduled ((t (:foreground ,dustveil-foreground))))
 `(org-scheduled-today ((t (:foreground ,dustveil-accent))))
 `(org-imminent-deadline ((t (:inherit org-warning))))
 `(org-upcoming-deadline ((t (:foreground ,dustveil-syntax-literal))))
 `(org-time-grid ((t (:inherit shadow))))
 `(org-warning ((t (:foreground ,dustveil-foreground :bold t))))

 ;; --- markdown -------------------------------------------------------------------------
 `(markdown-header-face-1 ((t (:foreground ,dustveil-accent :bold t))))
 `(markdown-header-face-2 ((t (:foreground ,dustveil-syntax-keyword :bold t))))
 `(markdown-header-face-3 ((t (:foreground ,dustveil-syntax-literal))))
 `(markdown-header-face-4 ((t (:foreground ,dustveil-syntax-variable))))
 `(markdown-header-face-5 ((t (:foreground ,dustveil-syntax-literal))))
 `(markdown-header-face-6 ((t (:foreground ,dustveil-syntax-variable))))
 `(markdown-header-delimiter-face ((t (:foreground ,dustveil-secondary))))
 `(markdown-header-rule-face ((t (:foreground ,dustveil-secondary))))
 `(markdown-hr-face ((t (:foreground ,dustveil-secondary))))
 `(markdown-blockquote-face ((t (:foreground ,dustveil-syntax-literal :italic t))))
 `(markdown-code-face ((t (:background ,dustveil-background
                           :foreground ,dustveil-foreground
                           :inherit fixed-pitch :extend nil))))
 `(markdown-pre-face ((t (:inherit markdown-code-face :extend t))))
 `(markdown-inline-code-face ((t (:inherit markdown-code-face
                                  :foreground ,dustveil-syntax-keyword :extend nil))))
 `(markdown-language-keyword-face ((t (:foreground ,dustveil-syntax-literal))))
 `(markdown-markup-face ((t (:foreground ,dustveil-secondary))))
 `(markdown-list-face ((t (:foreground ,dustveil-syntax-keyword))))
 `(markdown-link-face ((t (:foreground ,dustveil-syntax-variable :underline t))))
 `(markdown-url-face ((t (:foreground ,dustveil-syntax-variable :underline t))))
 `(markdown-plain-url-face ((t (:foreground ,dustveil-syntax-variable :underline t))))
 `(markdown-reference-face ((t (:foreground ,dustveil-syntax-variable))))
 `(markdown-footnote-marker-face ((t (:foreground ,dustveil-secondary))))
 `(markdown-metadata-key-face ((t (:foreground ,dustveil-syntax-literal))))
 `(markdown-metadata-value-face ((t (:foreground ,dustveil-syntax-keyword))))
 `(markdown-gfm-checkbox-face ((t (:foreground ,dustveil-accent :bold t))))
 `(markdown-math-face ((t (:foreground ,dustveil-syntax-variable))))
 `(markdown-missing-link-face ((t (:foreground ,dustveil-foreground))))
 `(markdown-comment-face ((t (:inherit font-lock-comment-face))))
 `(markdown-strike-through-face ((t (:foreground ,dustveil-secondary
                                     :strike-through t))))

 ;; --- info, help, custom, compilation --------------------------------------------------
 `(info-title-1 ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(info-title-2 ((t (:foreground ,dustveil-syntax-literal))))
 `(info-title-3 ((t (:foreground ,dustveil-accent))))
 `(info-title-4 ((t (:foreground ,dustveil-accent))))
 `(info-menu-header ((t (:foreground ,dustveil-accent :bold t))))
 `(info-menu-star ((t (:foreground ,dustveil-accent))))
 `(info-node ((t (:foreground ,dustveil-accent :bold t))))
 `(info-header-node ((t (:foreground ,dustveil-secondary))))
 `(info-header-xref ((t (:foreground ,dustveil-syntax-variable :underline t))))
 `(info-xref ((t (:foreground ,dustveil-syntax-variable :underline t))))
 `(info-xref-visited ((t (:foreground ,dustveil-syntax-literal :underline t))))
 `(info-index-match ((t (:inherit isearch))))
 `(help-argument-name ((t (:foreground ,dustveil-syntax-variable :italic t))))
 `(help-key-binding ((t (:background ,dustveil-background
                         :foreground ,dustveil-foreground :bold t))))
 `(widget-field ((t (:background ,dustveil-background :box (:color ,dustveil-border)
                     :foreground ,dustveil-foreground))))
 `(widget-single-line-field ((t (:background ,dustveil-background :box (:color ,dustveil-border)
                                 :foreground ,dustveil-foreground))))
 `(widget-button ((t (:foreground ,dustveil-accent :bold t))))
 `(custom-variable-tag ((t (:foreground ,dustveil-accent :bold t))))
 `(custom-face-tag ((t (:foreground ,dustveil-syntax-literal))))
 `(custom-group-tag ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(custom-state ((t (:foreground ,dustveil-accent))))
 `(custom-comment ((t (:inherit font-lock-comment-face))))
 `(custom-comment-tag ((t (:foreground ,dustveil-secondary))))
 `(custom-documentation ((t (:foreground ,dustveil-syntax-keyword))))
 `(compilation-error ((t (:inherit error))))
 `(compilation-warning ((t (:inherit warning))))
 `(compilation-info ((t (:foreground ,dustveil-syntax-variable))))
 `(compilation-line-number ((t (:inherit shadow))))
 `(compilation-column-number ((t (:inherit shadow))))
 `(compilation-mode-line-fail ((t (:foreground ,dustveil-foreground :bold t))))
 `(compilation-mode-line-exit ((t (:foreground ,dustveil-accent :bold t))))
 `(compilation-mode-line-run ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(whitespace-trailing ((t (:background ,dustveil-surface))))
 `(whitespace-line ((t (:background ,dustveil-surface
                        :foreground ,dustveil-syntax-literal))))
 `(whitespace-space ((t (:foreground ,dustveil-secondary))))
 `(whitespace-hspace ((t (:foreground ,dustveil-secondary))))
 `(whitespace-tab ((t (:foreground ,dustveil-secondary))))
 `(whitespace-newline ((t (:foreground ,dustveil-secondary))))
 `(whitespace-indentation ((t (:foreground ,dustveil-secondary))))
 `(whitespace-empty ((t (:foreground ,dustveil-secondary))))

 ;; --- evil, search previews -----------------------------------------------------------
 `(evil-ex-substitute-matches ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 `(evil-ex-substitute-replacement ((t (:foreground ,dustveil-accent))))
 `(evil-search-highlight-persist-highlight-face ((t (:background ,dustveil-foreground :foreground ,dustveil-background :extend t))))
 `(evil-traces-default ((t (:background ,dustveil-surface
                            :foreground ,dustveil-foreground))))
 `(evil-traces-global-match ((t (:background ,dustveil-surface
                                 :foreground ,dustveil-foreground
                                 :strike-through t))))
 `(evil-traces-global-range ((t (:background ,dustveil-surface
                                 :foreground ,dustveil-foreground))))
 `(evil-traces-substitute-range ((t (:background ,dustveil-surface
                                     :foreground
                                     ,dustveil-foreground))))
 `(evil-traces-delete ((t (:background ,dustveil-foreground
                           :foreground ,dustveil-background :bold t))))
 `(evil-traces-change ((t (:background ,dustveil-foreground
                           :foreground ,dustveil-background :bold t))))
 `(evil-traces-yank ((t (:background ,dustveil-accent
                         :foreground ,dustveil-background :bold t))))
 `(evil-traces-copy-preview ((t (:background ,dustveil-surface
                                 :foreground ,dustveil-foreground))))
 `(evil-traces-copy-range ((t (:background ,dustveil-surface
                               :foreground ,dustveil-foreground))))
 `(evil-traces-move-preview ((t (:background ,dustveil-surface))))
 `(evil-traces-move-range ((t (:background ,dustveil-surface))))
 `(evil-traces-normal ((t (:foreground ,dustveil-foreground))))
 `(evil-goggles-default-face ((t (:background ,dustveil-surface
                                  :foreground ,dustveil-foreground))))
 `(evil-goggles-delete-face ((t (:background ,dustveil-foreground
                                 :foreground ,dustveil-background))))
 `(evil-goggles-change-face ((t (:background ,dustveil-foreground
                                 :foreground ,dustveil-background))))
 `(evil-goggles-yank-face ((t (:background ,dustveil-accent
                               :foreground ,dustveil-background))))
 `(evil-goggles-paste-face ((t (:background ,dustveil-syntax-variable
                                :foreground ,dustveil-background))))
 `(evil-goggles-replace-with-register-face ((t (:background ,dustveil-foreground
                                                :foreground ,dustveil-background))))
 `(evil-goggles-surround-face ((t (:background ,dustveil-foreground
                                   :foreground ,dustveil-background))))
 `(evil-snipe-first-match-face ((t (:background ,dustveil-foreground
                                    :foreground ,dustveil-background
                                    :bold t))))
 `(evil-snipe-matches-face ((t (:background ,dustveil-surface
                                :foreground ,dustveil-foreground))))
 `(anzu-mode-line ((t (:foreground ,dustveil-accent :bold t))))
 `(anzu-mode-line-no-match ((t (:foreground ,dustveil-foreground :bold t))))
 `(anzu-replace-highlight ((t (:background ,dustveil-surface
                               :foreground ,dustveil-foreground))))
 `(anzu-replace-to ((t (:foreground ,dustveil-accent :bold t))))
 `(anzu-match-1 ((t (:foreground ,dustveil-accent))))
 `(anzu-match-2 ((t (:foreground ,dustveil-syntax-literal))))
 `(anzu-match-3 ((t (:foreground ,dustveil-syntax-variable))))
 `(iedit-occurrence ((t (:background ,dustveil-surface
                         :foreground ,dustveil-foreground :bold t))))
 `(iedit-read-only-occurrence ((t (:background ,dustveil-surface
                                   :foreground ,dustveil-secondary
                                   :italic t))))

 ;; --- navigation -------------------------------------------------------------------------
 `(avy-lead-face ((t (:background ,dustveil-foreground
                      :foreground ,dustveil-background :bold t))))
 `(avy-lead-face-0 ((t (:background ,dustveil-foreground
                        :foreground ,dustveil-background :bold t))))
 `(avy-lead-face-1 ((t (:background ,dustveil-surface
                        :foreground ,dustveil-foreground :bold t))))
 `(avy-lead-face-2 ((t (:background ,dustveil-surface
                        :foreground ,dustveil-foreground :bold t))))
 `(avy-background-face ((t (:foreground ,dustveil-secondary))))
 `(avy-goto-char-timer-face ((t (:background ,dustveil-surface
                                 :foreground
                                 ,dustveil-foreground :bold t))))
 `(aw-leading-char-face ((t (:foreground ,dustveil-accent :bold t))))
 `(aw-background-face ((t (:foreground ,dustveil-secondary))))
 `(aw-mode-line-face ((t (:foreground ,dustveil-accent :bold t))))
 `(aw-minibuffer-leading-char-face ((t (:foreground ,dustveil-accent
                                        :bold t))))

 ;; --- misc ui ------------------------------------------------------------------------------
 `(hl-todo ((t (:foreground ,dustveil-accent :bold t))))
 `(link ((t (:foreground ,dustveil-accent :underline t))))
 `(link-visited ((t (:foreground ,dustveil-syntax-literal :underline t))))
 `(tooltip ((t (:background ,dustveil-background
                :foreground ,dustveil-foreground))))
 `(popup-face ((t (:background ,dustveil-background
                   :foreground ,dustveil-foreground))))
 `(popup-tip-face ((t (:background ,dustveil-surface
                       :foreground ,dustveil-accent))))
 `(popup-menu-selection-face ((t (:background ,dustveil-surface :foreground ,dustveil-foreground
                                  :box (:color ,dustveil-accent) :extend t))))
 `(popup-menu-summary-face ((t (:inherit shadow))))
 `(child-frame-border ((t (:background ,dustveil-secondary))))
 `(nav-flash-face ((t (:background ,dustveil-surface
                       :foreground ,dustveil-accent))))
 `(which-key-key-face ((t (:foreground ,dustveil-accent :bold t))))
 `(which-key-command-description-face ((t (:foreground ,dustveil-foreground))))
 `(which-key-group-description-face ((t (:foreground ,dustveil-secondary))))
 `(which-key-special-key-face ((t (:foreground ,dustveil-accent :bold t))))
 `(which-key-separator-face ((t (:foreground ,dustveil-secondary))))
 `(which-key-note-face ((t (:inherit shadow :italic t))))
 `(dashboard-banner-logo-title ((t (:foreground ,dustveil-accent :bold t))))
 `(doom-dashboard-default ((t (:background ,dustveil-background :foreground ,dustveil-foreground))))
 `(dashboard-items-face ((t (:foreground ,dustveil-foreground))))
 `(dashboard-heading ((t (:foreground ,dustveil-accent :bold t))))
 `(dashboard-navigator-face ((t (:foreground ,dustveil-syntax-variable))))
 `(transient-key ((t (:foreground ,dustveil-accent :bold t))))
 `(transient-heading ((t (:foreground ,dustveil-syntax-literal :bold t))))
 `(transient-argument ((t (:foreground ,dustveil-syntax-variable))))
 `(transient-value ((t (:foreground ,dustveil-syntax-literal))))
 `(transient-inactive-argument ((t (:inherit shadow))))
 `(transient-inactive-value ((t (:inherit shadow))))
 `(transient-unreachable ((t (:foreground ,dustveil-secondary :strike-through t))))
 `(transient-unreachable-key ((t (:foreground ,dustveil-secondary))))
 `(vundo-default ((t (:foreground ,dustveil-foreground))))
 `(vundo-highlight ((t (:foreground ,dustveil-accent :bold t))))
 `(vundo-stem ((t (:foreground ,dustveil-secondary))))
 `(vundo-saved ((t (:foreground ,dustveil-accent))))
 `(vundo-last-saved ((t (:foreground ,dustveil-accent :bold t))))
 `(treesit-fold-fringe-face ((t (:foreground ,dustveil-secondary))))
 `(treesit-fold-replacement-face ((t (:foreground ,dustveil-secondary))))
 `(macrostep-expansion-highlight-face ((t (:background ,dustveil-surface))))
 `(macrostep-macro-face ((t (:foreground ,dustveil-foreground :bold t))))
 `(macrostep-compiler-macro-face ((t (:foreground ,dustveil-foreground :bold t))))
 `(macrostep-gensym-1 ((t (:foreground ,dustveil-foreground))))
 `(macrostep-gensym-2 ((t (:foreground ,dustveil-foreground))))
 `(macrostep-gensym-3 ((t (:foreground ,dustveil-foreground))))
 `(macrostep-gensym-4 ((t (:foreground ,dustveil-foreground))))
 `(macrostep-gensym-5 ((t (:foreground ,dustveil-foreground))))
 `(wgrep-face ((t (:foreground ,dustveil-syntax-literal))))
 `(wgrep-done-face ((t (:foreground ,dustveil-accent))))
 `(wgrep-delete-face ((t (:foreground ,dustveil-foreground :strike-through t))))
 `(wgrep-file-face ((t (:foreground ,dustveil-foreground))))
 `(wgrep-reject-face ((t (:foreground ,dustveil-foreground :bold t))))
 `(highlight-quoted-quote ((t (:foreground ,dustveil-foreground))))
 `(highlight-quoted-symbol ((t (:foreground ,dustveil-foreground))))
 `(eros-result-overlay-face ((t (:background ,dustveil-background
                                 :foreground ,dustveil-syntax-keyword))))
 `(yas-field-highlight-face ((t (:background ,dustveil-surface))))
 `(dape-breakpoint-face ((t (:background ,dustveil-foreground
                             :foreground ,dustveil-background))))
 `(dape-breakpoint-until-face ((t (:background ,dustveil-foreground
                                   :foreground ,dustveil-background))))
 `(dape-source-line-face ((t (:background ,dustveil-surface
                              :foreground ,dustveil-foreground))))
 `(dape-expression-face ((t (:foreground ,dustveil-syntax-keyword))))
 `(dape-inlay-hint-face ((t (:foreground ,dustveil-secondary
                             :background ,dustveil-surface
                             :italic t))))
 `(dape-repl-error-face ((t (:foreground ,dustveil-foreground))))
 `(dape-log-face ((t (:inherit shadow))))
 `(dape-header-line-active-face ((t (:background ,dustveil-foreground
                                     :foreground ,dustveil-background))))
 `(dape-header-line-inactive-face ((t (:background ,dustveil-background
                                       :foreground
                                       ,dustveil-secondary))))
 `(dape-hits-face ((t (:foreground ,dustveil-accent))))

 ;; --- nerd-icons -------------------------------------------------------------------------------
 `(nerd-icons-blue ((t (:foreground ,dustveil-syntax-variable))))
 `(nerd-icons-blue-alt ((t (:foreground ,dustveil-syntax-variable))))
 `(nerd-icons-cyan ((t (:foreground ,dustveil-syntax-variable))))
 `(nerd-icons-cyan-alt ((t (:foreground ,dustveil-syntax-variable))))
 `(nerd-icons-green ((t (:foreground ,dustveil-syntax-keyword))))
 `(nerd-icons-orange ((t (:foreground ,dustveil-accent))))
 `(nerd-icons-purple ((t (:foreground ,dustveil-syntax-literal))))
 `(nerd-icons-purple-alt ((t (:foreground ,dustveil-syntax-literal))))
 `(nerd-icons-red ((t (:foreground ,dustveil-syntax-variable))))
 `(nerd-icons-red-alt ((t (:foreground ,dustveil-syntax-variable))))
 `(nerd-icons-yellow ((t (:foreground ,dustveil-syntax-literal))))
 `(nerd-icons-pink ((t (:foreground ,dustveil-syntax-literal))))
 `(nerd-icons-maroon ((t (:foreground ,dustveil-syntax-variable))))
 `(nerd-icons-silver ((t (:foreground ,dustveil-secondary))))
 `(nerd-icons-dblue ((t (:foreground ,dustveil-syntax-variable))))
 `(nerd-icons-dcyan ((t (:foreground ,dustveil-syntax-variable))))
 `(nerd-icons-dgreen ((t (:foreground ,dustveil-syntax-keyword))))
 `(nerd-icons-dorange ((t (:foreground ,dustveil-accent))))
 `(nerd-icons-dpurple ((t (:foreground ,dustveil-syntax-literal))))
 `(nerd-icons-dpink ((t (:foreground ,dustveil-syntax-literal))))
 `(nerd-icons-dred ((t (:foreground ,dustveil-syntax-variable))))
 `(nerd-icons-dyellow ((t (:foreground ,dustveil-syntax-literal))))
 `(nerd-icons-dsilver ((t (:foreground ,dustveil-secondary))))
 `(nerd-icons-lblue ((t (:foreground ,dustveil-syntax-variable))))
 `(nerd-icons-lcyan ((t (:foreground ,dustveil-syntax-variable))))
 `(nerd-icons-lgreen ((t (:foreground ,dustveil-syntax-keyword))))
 `(nerd-icons-lorange ((t (:foreground ,dustveil-accent))))
 `(nerd-icons-lpurple ((t (:foreground ,dustveil-syntax-literal))))
 `(nerd-icons-lpink ((t (:foreground ,dustveil-syntax-literal))))
 `(nerd-icons-lred ((t (:foreground ,dustveil-syntax-variable))))
 `(nerd-icons-lyellow ((t (:foreground ,dustveil-syntax-literal))))
 `(nerd-icons-lsilver ((t (:foreground ,dustveil-foreground))))

 ;; --- lsp-mode -----------------------------------------------------------------------------------
 `(lsp-face-highlight-read ((t (:background ,dustveil-surface))))
 `(lsp-face-highlight-textual ((t (:background ,dustveil-surface))))
 `(lsp-face-highlight-write ((t (:background ,dustveil-surface
                                 :box (:color ,dustveil-accent)))))
 `(lsp-face-rename ((t (:background ,dustveil-surface))))
 `(lsp-ui-doc-background ((t (:background ,dustveil-background))))
 `(lsp-inlay-hint-face ((t (:foreground ,dustveil-secondary
                            :background ,dustveil-surface
                            :italic t))))
 `(lsp-inlay-hint-parameter-face ((t (:foreground ,dustveil-secondary
                                      :background
                                      ,dustveil-surface
                                      :italic t))))
 `(lsp-inlay-hint-type-face ((t (:foreground ,dustveil-secondary
                                 :background ,dustveil-surface
                                 :italic t))))
 `(lsp-lens-face ((t (:inherit shadow))))
 `(lsp-details-face ((t (:inherit shadow :italic t))))
 `(lsp-modeline-code-actions-face ((t (:foreground ,dustveil-syntax-literal))))
 `(lsp-signature-face ((t (:foreground ,dustveil-syntax-keyword :italic t))))
 `(lsp-signature-highlight-function-argument ((t (:foreground
                                                  ,dustveil-accent :bold t))))
 `(lsp-signature-posframe ((t (:background ,dustveil-background
                               :foreground ,dustveil-foreground))))
 `(lsp-headerline-breadcrumb-path-face ((t (:foreground ,dustveil-secondary))))
 `(lsp-headerline-breadcrumb-symbols-face ((t (:foreground ,dustveil-accent))))
 `(lsp-headerline-breadcrumb-separator-face ((t (:foreground ,dustveil-secondary))))
 `(lsp-headerline-breadcrumb-project-prefix-face ((t (:foreground
                                                      ,dustveil-syntax-literal))))
 `(lsp-headerline-breadcrumb-path-error-face ((t (:foreground ,dustveil-foreground))))
 `(lsp-headerline-breadcrumb-path-warning-face ((t (:foreground
                                                    ,dustveil-syntax-literal))))
 `(lsp-headerline-breadcrumb-path-info-face ((t (:foreground ,dustveil-syntax-variable))))
 `(lsp-headerline-breadcrumb-path-hint-face ((t (:foreground ,dustveil-syntax-variable))))
 `(lsp-headerline-breadcrumb-symbols-error-face ((t (:foreground
                                                     ,dustveil-foreground))))
 `(lsp-headerline-breadcrumb-symbols-warning-face ((t (:foreground
                                                       ,dustveil-syntax-literal))))
 `(lsp-headerline-breadcrumb-symbols-info-face ((t (:foreground
                                                    ,dustveil-syntax-variable))))
 `(lsp-headerline-breadcrumb-symbols-hint-face ((t (:foreground
                                                    ,dustveil-syntax-variable))))
 `(lsp-headerline-breadcrumb-deprecated-face ((t (:foreground ,dustveil-secondary
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
