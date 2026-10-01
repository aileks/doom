;;; dustveil-theme.el -*- lexical-binding: t; -*-

(deftheme dustveil
  "Dustveil: dark monochrome surfaces and warm gray tones."
  :background-mode 'dark
  :kind 'color-scheme)

(defgroup dustveil nil
  "Dustveil theme."
  :group 'faces
  :prefix "dustveil-")

(defconst dustveil-background     "#090909")
(defconst dustveil-container      "#090909")
(defconst dustveil-surface        "#090909")
(defconst dustveil-visual         "#514942")
(defconst dustveil-overlay        "#090909")
(defconst dustveil-text-muted     "#877e76")
(defconst dustveil-text-subtle    "#877e76")
(defconst dustveil-text-secondary "#e0d7ce")
(defconst dustveil-text           "#f3f3f3")
(defconst dustveil-text-bright    "#fcf2e9")
(defconst dustveil-primary        "#978e86")
(defconst dustveil-secondary      "#8e857d")
(defconst dustveil-ui-accent      "#978e86")
(defconst dustveil-error          "#aaa198")
(defconst dustveil-warning        "#978e86")
(defconst dustveil-success        "#9e958d")
(defconst dustveil-info           "#9e958d")
(defconst dustveil-tertiary       "#aaa198")
(defconst dustveil-quaternary     "#9e958d")

(defconst dustveil-selection "#f3f3f3")

(defconst dustveil-variable "#fcf2e9")
(defconst dustveil-keyword "#e0d7ce")
(defconst dustveil-punctuation "#8e857d")

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
                            :foreground ,dustveil-text))
              (t (:background ,dustveil-background :foreground ,dustveil-text))))
   `(fringe ((((type tty)) (:background ,tty-background
                           :foreground ,dustveil-text-muted))
             (t (:background ,dustveil-background :foreground ,dustveil-text-muted))))))

(custom-theme-set-faces
 'dustveil

 ;; --- base -------------------------------------------------------------------
 `(cursor ((t (:background ,dustveil-text))))
 `(region ((t (:background ,dustveil-selection :foreground ,dustveil-background :extend t))))
 `(highlight ((t (:background ,dustveil-surface))))
 `(hl-line ((t (:background ,dustveil-container))))
 `(secondary-selection ((t (:background ,dustveil-selection :foreground ,dustveil-background :extend t))))
 `(vertical-border ((t (:foreground ,dustveil-text-muted))))
 `(window-divider ((t (:foreground ,dustveil-visual))))
 `(shadow ((t (:foreground ,dustveil-text-subtle))))
 `(escape-glyph ((t (:foreground ,dustveil-text-muted))))
 `(nobreak-space ((t (:foreground ,dustveil-warning :underline t))))
 `(file-name-shadow ((t (:inherit shadow))))
 `(fill-column-indicator ((t (:foreground ,dustveil-visual))))
 `(line-number ((t (:foreground ,dustveil-text-muted :background unspecified))))
 `(line-number-current-line ((t (:foreground ,dustveil-ui-accent
                                             :background ,dustveil-surface
                                             :bold t))))
 `(minibuffer-prompt ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(trailing-whitespace ((t (:background ,dustveil-surface))))
 `(show-paren-match ((t (:background ,dustveil-surface :bold t))))
 `(show-paren-mismatch ((t (:foreground ,dustveil-background
                                         :background ,dustveil-error))))
 `(match ((t (:background ,dustveil-surface
                          :foreground ,dustveil-ui-accent))))

 ;; --- search -------------------------------------------------------------------
 `(isearch ((t (:background ,dustveil-selection :foreground ,dustveil-background :extend t))))
 `(isearch-fail ((t (:foreground ,dustveil-error :underline t))))
 `(lazy-highlight ((t (:background ,dustveil-selection :foreground ,dustveil-background :extend t))))
 `(query-replace ((t (:background ,dustveil-selection :foreground ,dustveil-background :extend t))))
 ;; --- mode-line, header-line, tab-bar ---------------------------------------------
 `(mode-line ((t (:background ,dustveil-container
                              :foreground ,dustveil-text-bright
                              :box (:color ,dustveil-text-muted)))))
 `(mode-line-inactive ((t (:background ,dustveil-surface
                                       :foreground ,dustveil-text-subtle
                                       :box (:color ,dustveil-container)))))
 `(mode-line-active ((t (:inherit mode-line))))
 `(mode-line-buffer-id ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(mode-line-highlight ((t (:foreground ,dustveil-ui-accent))))
 `(mode-line-emphasis ((t (:foreground ,dustveil-text-bright :bold t))))
 `(header-line ((t (:inherit mode-line))))
 `(header-line-highlight ((t (:inherit mode-line-highlight))))
 `(tab-bar ((t (:background ,dustveil-container
                            :foreground ,dustveil-text-subtle))))
 `(tab-bar-tab ((t (:background ,dustveil-surface
                                :foreground ,dustveil-text-bright :weight bold))))
 `(tab-bar-tab-inactive ((t (:background ,dustveil-container
                                         :foreground ,dustveil-text-subtle))))
 `(tab-bar-tab-group-current ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(tab-bar-tab-group-inactive ((t (:inherit tab-bar-tab-inactive))))
 `(tab-line ((t (:inherit tab-bar))))
 `(tab-line-tab ((t (:inherit tab-bar-tab-inactive))))
 `(tab-line-tab-current ((t (:inherit tab-bar-tab))))
 `(tab-line-tab-inactive ((t (:inherit tab-bar-tab-inactive))))
 `(tab-line-tab-inactive-alternate ((t (:inherit tab-line-tab-inactive))))
 `(tab-line-highlight ((t (:background ,dustveil-selection :foreground ,dustveil-background :extend t))))
 `(tab-line-close-highlight ((t (:foreground ,dustveil-ui-accent))))

 ;; --- doom-modeline ---------------------------------------------------------------
 `(doom-modeline-bar ((t (:background ,dustveil-selection :foreground ,dustveil-background))))
 `(doom-modeline-bar-inactive ((t (:background ,dustveil-text-muted))))
 `(doom-modeline-buffer-file ((t (:foreground ,dustveil-text-bright))))
 `(doom-modeline-buffer-path ((t (:foreground ,dustveil-text-bright))))
 `(doom-modeline-buffer-major-mode ((t (:foreground ,dustveil-quaternary))))
 `(doom-modeline-buffer-minor-mode ((t (:inherit shadow))))
 `(doom-modeline-buffer-modified ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(doom-modeline-emphasis ((t (:foreground ,dustveil-text-bright :bold t))))
 `(doom-modeline-highlight ((t (:foreground ,dustveil-ui-accent))))
 `(doom-modeline-info ((t (:foreground ,dustveil-info))))
 `(doom-modeline-warning ((t (:foreground ,dustveil-warning))))
 `(doom-modeline-urgent ((t (:foreground ,dustveil-error :bold t))))
 `(doom-modeline-debug ((t (:foreground ,dustveil-tertiary))))
 `(doom-modeline-debug-visual ((t (:foreground ,dustveil-tertiary :bold t))))
 `(doom-modeline-vcs-default ((t (:foreground ,dustveil-text-secondary))))
 `(doom-modeline-lsp-error ((t (:foreground ,dustveil-error))))
 `(doom-modeline-lsp-warning ((t (:foreground ,dustveil-warning))))
 `(doom-modeline-lsp-success ((t (:foreground ,dustveil-success))))
 `(doom-modeline-lsp-running ((t (:foreground ,dustveil-warning))))
 `(doom-modeline-evil-normal-state ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(doom-modeline-evil-insert-state ((t (:foreground ,dustveil-text-secondary :bold t))))
 `(doom-modeline-evil-visual-state ((t (:foreground ,dustveil-tertiary :bold t))))
 `(doom-modeline-evil-replace-state ((t (:foreground ,dustveil-secondary :bold t))))
 `(doom-modeline-evil-emacs-state ((t (:foreground ,dustveil-quaternary :bold t))))
 `(doom-modeline-evil-motion-state ((t (:foreground ,dustveil-quaternary :bold t))))
 `(doom-modeline-evil-operator-state ((t (:foreground ,dustveil-tertiary :bold t))))
 `(doom-modeline-evil-user-state ((t (:foreground ,dustveil-quaternary :bold t))))
 `(doom-modeline-battery-critical ((t (:foreground ,dustveil-error :bold t))))
 `(doom-modeline-battery-error ((t (:foreground ,dustveil-error))))
 `(doom-modeline-battery-warning ((t (:foreground ,dustveil-warning))))
 `(doom-modeline-battery-charging ((t (:foreground ,dustveil-success))))
 `(doom-modeline-battery-full ((t (:foreground ,dustveil-success))))
 `(doom-modeline-battery-normal ((t (:foreground ,dustveil-text-secondary))))
 `(doom-modeline-unread-number ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(doom-modeline-compilation ((t (:foreground ,dustveil-warning))))
 `(doom-modeline-panel ((t (:background ,dustveil-selection
                                         :foreground ,dustveil-background :bold t))))
 `(doom-modeline-persp-name ((t (:foreground ,dustveil-tertiary))))
 `(doom-modeline-workspace-name ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(doom-modeline-persp-buffer-not-in-persp
   ((t (:inherit shadow :italic t))))
 `(doom-modeline-project-dir ((t (:foreground ,dustveil-ui-accent))))
 `(doom-modeline-project-name ((t (:foreground ,dustveil-ui-accent))))
 `(doom-modeline-project-parent-dir ((t (:inherit shadow))))
 `(doom-modeline-project-root-dir ((t (:inherit shadow))))
 `(doom-modeline-repl-success ((t (:foreground ,dustveil-success))))
 `(doom-modeline-repl-warning ((t (:foreground ,dustveil-warning))))
 `(doom-modeline-overwrite ((t (:foreground ,dustveil-error :bold t))))
 `(doom-modeline-time ((t (:foreground ,dustveil-text-subtle))))
 `(doom-modeline-host ((t (:foreground ,dustveil-text-subtle))))
 `(doom-modeline-input-method ((t (:foreground ,dustveil-text-subtle))))

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
 `(font-lock-comment-face ((t (:foreground ,dustveil-text-muted :italic t))))
 `(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 `(font-lock-doc-face ((t (:foreground ,dustveil-text-muted :italic t))))
 `(font-lock-doc-markup-face ((t (:foreground ,dustveil-text))))
 `(font-lock-string-face ((t (:foreground ,dustveil-quaternary))))
 `(font-lock-keyword-face ((t (:foreground ,dustveil-keyword))))
 `(font-lock-builtin-face ((t (:inherit font-lock-function-call-face))))
 `(font-lock-function-name-face ((t (:foreground ,dustveil-tertiary :weight bold))))
 `(font-lock-function-call-face ((t (:inherit font-lock-function-name-face :weight normal))))
 `(font-lock-variable-name-face ((t (:foreground ,dustveil-variable))))
 `(font-lock-variable-use-face ((t (:inherit font-lock-variable-name-face))))
 `(r-ts-mode-face-variable ((t (:inherit font-lock-variable-name-face))))
 `(font-lock-constant-face ((t (:foreground ,dustveil-info))))
 `(font-lock-type-face ((t (:foreground ,dustveil-quaternary))))
 `(font-lock-property-name-face ((t (:inherit font-lock-variable-name-face))))
 `(font-lock-property-use-face ((t (:inherit font-lock-variable-use-face))))
 `(font-lock-regexp-face ((t (:inherit font-lock-string-face))))
 `(font-lock-number-face ((t (:inherit font-lock-constant-face))))
 `(font-lock-operator-face ((t (:foreground ,dustveil-punctuation))))
 `(font-lock-punctuation-face ((t (:foreground ,dustveil-punctuation))))
 `(font-lock-bracket-face ((t (:inherit font-lock-punctuation-face))))
 `(font-lock-delimiter-face ((t (:inherit font-lock-punctuation-face))))
 `(font-lock-misc-punctuation-face ((t (:inherit font-lock-punctuation-face))))
 `(font-lock-preprocessor-face ((t (:foreground ,dustveil-keyword))))
 `(font-lock-negation-char-face ((t (:foreground ,dustveil-punctuation))))
 `(font-lock-warning-face ((t (:foreground ,dustveil-warning))))
 `(font-lock-escape-face ((t (:foreground ,dustveil-text))))
 `(font-lock-regexp-grouping-backslash ((t (:inherit bold))))
 `(font-lock-regexp-grouping-construct ((t (:inherit bold))))

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
 `(error ((t (:foreground ,dustveil-error))))
 `(warning ((t (:foreground ,dustveil-warning))))
 `(success ((t (:foreground ,dustveil-success))))
 `(flycheck-error ((t (:underline (:style wave :color ,dustveil-error)))))
 `(flycheck-warning ((t (:underline (:style wave :color ,dustveil-warning)))))
 `(flycheck-info ((t (:underline (:style wave :color ,dustveil-info)))))
 `(flycheck-fringe-error ((t (:inherit error))))
 `(flycheck-fringe-warning ((t (:inherit warning))))
 `(flycheck-fringe-info ((t (:inherit compilation-info))))
 `(flycheck-error-list-error ((t (:foreground ,dustveil-error :bold t))))
 `(flycheck-error-list-warning ((t (:foreground ,dustveil-warning :bold t))))
 `(flycheck-error-list-info ((t (:foreground ,dustveil-info :bold t))))
 `(flycheck-error-list-line-number ((t (:inherit shadow))))
 `(flycheck-error-list-column-number ((t (:inherit shadow))))
 `(flycheck-error-list-id ((t (:foreground ,dustveil-text-subtle))))
 `(flycheck-error-list-filename ((t (:foreground ,dustveil-quaternary))))
 `(flymake-error ((t (:underline (:style wave :color ,dustveil-error)))))
 `(flymake-warning ((t (:underline (:style wave :color ,dustveil-warning)))))
 `(flymake-note ((t (:underline (:style wave :color ,dustveil-info)))))

 ;; --- eglot ------------------------------------------------------------------------
 `(eglot-highlight-symbol-face ((t (:background ,dustveil-surface))))
 `(eglot-diagnostic-tag-unnecessary-face ((t (:inherit shadow))))
 `(eglot-diagnostic-tag-deprecated-face ((t (:strike-through t))))
 `(eglot-inlay-hint-face ((t (:inherit shadow :height 0.8 :slant italic))))
 `(eglot-type-hint-face ((t (:inherit eglot-inlay-hint-face
                           :foreground ,dustveil-tertiary))))
 `(eglot-parameter-hint-face ((t (:inherit eglot-inlay-hint-face
                                :foreground ,dustveil-ui-accent))))

 ;; --- completions ---------------------------------------------------------------------
 `(completions-common-part ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(completions-first-difference ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(completions-annotations ((t (:inherit shadow :slant italic))))
 `(completions-highlight ((t (:background ,dustveil-selection :foreground ,dustveil-background :extend t))))
 `(completions-group-title ((t (:foreground ,dustveil-tertiary :weight bold))))
 `(completions-group-separator ((t (:foreground ,dustveil-text-muted
                                   :strike-through t))))
 `(corfu-default ((t (:background ,dustveil-container
                                  :foreground ,dustveil-text))))
 `(corfu-current ((t (:background ,dustveil-selection :foreground ,dustveil-background :extend t))))
 `(corfu-annotations ((t (:inherit completions-annotations))))
 `(corfu-deprecated ((t (:inherit shadow :strike-through t))))
 `(corfu-bar ((t (:background ,dustveil-text-muted))))
 `(corfu-border ((t (:background ,dustveil-selection :foreground ,dustveil-background))))
 `(corfu-echo ((t (:inherit completions-annotations))))
 `(corfu-popupinfo ((t (:background ,dustveil-container
                                    :foreground ,dustveil-text-secondary))))
 `(corfu-quick1 ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(corfu-quick2 ((t (:foreground ,dustveil-tertiary :bold t))))
 `(vertico-current ((t (:background ,dustveil-selection :foreground ,dustveil-background :extend t))))
 `(vertico-group-title ((t (:inherit completions-group-title))))
 `(vertico-group-separator ((t (:foreground ,dustveil-text-muted))))
 `(orderless-match-face-0 ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(orderless-match-face-1 ((t (:foreground ,dustveil-tertiary :bold t))))
 `(orderless-match-face-2 ((t (:foreground ,dustveil-text-secondary :bold t))))
 `(orderless-match-face-3 ((t (:foreground ,dustveil-quaternary :bold t))))
 `(marginalia-documentation ((t (:inherit completions-annotations))))
 `(marginalia-key ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(marginalia-value ((t (:foreground ,dustveil-text-secondary))))
 `(marginalia-lighter ((t (:inherit shadow))))
 `(marginalia-modified ((t (:foreground ,dustveil-warning))))
 `(marginalia-date ((t (:foreground ,dustveil-quaternary))))
 `(marginalia-type ((t (:foreground ,dustveil-quaternary))))
 `(marginalia-on ((t (:foreground ,dustveil-success))))
 `(marginalia-off ((t (:inherit shadow))))
 `(marginalia-installed ((t (:foreground ,dustveil-success))))
 `(marginalia-archive ((t (:inherit shadow))))
 `(marginalia-null ((t (:inherit shadow))))
 `(marginalia-number ((t (:foreground ,dustveil-tertiary))))
 `(marginalia-function ((t (:foreground ,dustveil-quaternary))))
 `(marginalia-symbol ((t (:foreground ,dustveil-tertiary))))
 `(consult-help ((t (:foreground ,dustveil-ui-accent))))
 `(consult-key ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(consult-grep-context ((t (:inherit completions-annotations))))
 `(consult-preview-line ((t (:background ,dustveil-surface))))
 `(consult-preview-insertion ((t (:background ,dustveil-surface))))
 `(consult-preview-match ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(consult-highlight-match ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(consult-highlight-mark ((t (:background ,dustveil-surface))))
 `(consult-async-split ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(consult-async-running ((t (:foreground ,dustveil-warning))))
 `(consult-async-failed ((t (:foreground ,dustveil-error))))
 `(consult-async-finished ((t (:foreground ,dustveil-success))))
 `(consult-async-option ((t (:foreground ,dustveil-quaternary))))
 `(consult-narrow-indicator ((t (:foreground ,dustveil-text-muted))))
 `(consult-imenu-prefix ((t (:inherit shadow))))
 `(consult-line-number ((t (:inherit shadow))))
 `(embark-keybinding ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(embark-keybinding-repeat ((t (:foreground ,dustveil-ui-accent :bold t
                                              :underline t))))
 `(embark-keymap ((t (:foreground ,dustveil-tertiary :bold t))))
 `(embark-target ((t (:foreground ,dustveil-ui-accent))))
 `(embark-selected ((t (:background ,dustveil-selection :foreground ,dustveil-background :extend t))))
 `(embark-collect-group-title ((t (:foreground ,dustveil-tertiary :bold t))))
 `(embark-collect-group-separator ((t (:foreground ,dustveil-text-muted))))
 `(embark-collect-candidate ((t (:foreground ,dustveil-text))))
 `(embark-collect-annotation ((t (:inherit completions-annotations))))
 `(embark-verbose-indicator-title ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(embark-verbose-indicator-documentation
   ((t (:inherit completions-annotations))))
 `(embark-verbose-indicator-shadowed ((t (:foreground ,dustveil-text-muted))))

 ;; --- dired, diredfl, dirvish -------------------------------------------------------
 `(dired-directory ((t (:foreground ,dustveil-tertiary))))
 `(dired-symlink ((t (:foreground ,dustveil-quaternary))))
 `(dired-broken-symlink ((t (:foreground ,dustveil-error :bold t))))
 `(dired-flagged ((t (:foreground ,dustveil-error
                                  :background ,dustveil-surface))))
 `(dired-marked ((t (:foreground ,dustveil-background
                                 :background ,dustveil-selection))))
 `(dired-mark ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(dired-header ((t (:foreground ,dustveil-tertiary :bold t))))
 `(dired-special ((t (:foreground ,dustveil-text-secondary))))
 `(dired-ignored ((t (:foreground ,dustveil-text-muted))))
 `(dired-warning ((t (:foreground ,dustveil-warning))))
 `(diredfl-dir-heading ((t (:foreground ,dustveil-tertiary :bold t))))
 `(diredfl-dir-name ((t (:foreground ,dustveil-quaternary :bold t))))
 `(diredfl-dir-priv ((t (:foreground ,dustveil-quaternary))))
 `(diredfl-file-name ((t (:foreground ,dustveil-text))))
 `(diredfl-file-suffix ((t (:foreground ,dustveil-text-subtle))))
 `(diredfl-date-time ((t (:inherit shadow))))
 `(diredfl-number ((t (:inherit shadow))))
 `(diredfl-symlink ((t (:foreground ,dustveil-quaternary))))
 `(diredfl-executable-tag ((t (:foreground ,dustveil-text-secondary))))
 `(diredfl-compressed-file-name ((t (:foreground ,dustveil-text))))
 `(diredfl-compressed-file-suffix ((t (:foreground ,dustveil-tertiary))))
 `(diredfl-ignored-file-name ((t (:foreground ,dustveil-text-muted))))
 `(diredfl-flag-mark ((t (:foreground ,dustveil-background
                                       :background ,dustveil-selection :bold t))))
 `(diredfl-flag-mark-line ((t (:background ,dustveil-selection
                                           :foreground ,dustveil-background))))
 `(diredfl-deletion ((t (:foreground ,dustveil-background
                                      :background ,dustveil-error :bold t))))
 `(diredfl-deletion-file-name ((t (:foreground ,dustveil-error))))
 `(diredfl-read-priv ((t (:inherit shadow))))
 `(diredfl-write-priv ((t (:inherit shadow))))
 `(diredfl-exec-priv ((t (:foreground ,dustveil-text-secondary))))
 `(diredfl-no-priv ((t (:foreground ,dustveil-text-muted))))
 `(diredfl-link-priv ((t (:foreground ,dustveil-quaternary))))
 `(diredfl-other-priv ((t (:foreground ,dustveil-text-muted))))
 `(diredfl-rare-priv ((t (:foreground ,dustveil-tertiary))))
 `(dirvish-hl-line ((t (:background ,dustveil-surface))))
 `(dirvish-hl-line-inactive ((t (:background ,dustveil-container))))
 `(dirvish-inactive ((t (:inherit shadow))))
 `(dirvish-subtree-guide ((t (:foreground ,dustveil-visual))))
 `(dirvish-emerge-group-title ((t (:foreground ,dustveil-tertiary :bold t))))
 `(dirvish-narrow-match-face-0 ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(dirvish-narrow-match-face-1 ((t (:foreground ,dustveil-tertiary :bold t))))
 `(dirvish-narrow-match-face-2 ((t (:foreground ,dustveil-text-secondary :bold t))))
 `(dirvish-narrow-match-face-3 ((t (:foreground ,dustveil-quaternary :bold t))))
 `(dirvish-narrow-split ((t (:foreground ,dustveil-text-muted))))
 `(dirvish-vc-added-state ((t (:foreground ,dustveil-success))))
 `(dirvish-vc-edited-state ((t (:foreground ,dustveil-warning))))
 `(dirvish-vc-conflict-state ((t (:foreground ,dustveil-error :bold t))))
 `(dirvish-vc-removed-state ((t (:foreground ,dustveil-text-muted))))
 `(dirvish-vc-unregistered-face ((t (:foreground ,dustveil-text-muted))))
 `(dirvish-proc-failed ((t (:foreground ,dustveil-error))))
 `(dirvish-proc-finished ((t (:foreground ,dustveil-success))))
 `(dirvish-proc-running ((t (:foreground ,dustveil-warning))))
 `(dirvish-free-space ((t (:inherit shadow))))
 `(dirvish-file-device-number ((t (:inherit shadow))))
 `(dirvish-file-group-id ((t (:inherit shadow))))
 `(dirvish-file-inode-number ((t (:inherit shadow))))
 `(dirvish-file-link-number ((t (:inherit shadow))))
 `(dirvish-file-modes ((t (:inherit shadow))))
 `(dirvish-file-size ((t (:inherit shadow))))
 `(dirvish-file-time ((t (:inherit shadow))))
 `(dirvish-file-user-id ((t (:inherit shadow))))
 `(dirvish-git-commit-message-face ((t (:foreground ,dustveil-text))))
 `(dirvish-collapse-dir-face ((t (:foreground ,dustveil-quaternary))))
 `(dirvish-collapse-file-face ((t (:foreground ,dustveil-text))))
 `(dirvish-collapse-empty-dir-face ((t (:foreground ,dustveil-text-muted))))
 `(dirvish-media-info-heading ((t (:foreground ,dustveil-ui-accent :bold t))))

 ;; --- diff, magit, vc ------------------------------------------------------------------
 `(diff-hl-change ((t (:foreground ,dustveil-warning))))
 `(diff-hl-delete ((t (:foreground ,dustveil-error))))
 `(diff-hl-insert ((t (:foreground ,dustveil-success))))
 `(diff-added ((t (:foreground ,dustveil-success
                               :background ,dustveil-container))))
 `(diff-removed ((t (:foreground ,dustveil-error
                                 :background ,dustveil-container))))
 `(diff-changed ((t (:foreground ,dustveil-warning))))
 `(diff-refine-added ((t (:foreground ,dustveil-success :bold t))))
 `(diff-refine-removed ((t (:foreground ,dustveil-error :bold t))))
 `(diff-refine-changed ((t (:foreground ,dustveil-warning :bold t))))
 `(diff-header ((t (:foreground ,dustveil-text-subtle))))
 `(diff-hunk-header ((t (:foreground ,dustveil-text-subtle
                                     :background ,dustveil-surface))))
 `(diff-file-header ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(magit-section-highlight ((t (:background ,dustveil-surface))))
 `(magit-section-heading ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(magit-section-heading-selection ((t (:foreground ,dustveil-ui-accent))))
 `(magit-dimmed ((t (:foreground ,dustveil-text-muted))))
 `(magit-hash ((t (:inherit shadow))))
 `(magit-header-line ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(magit-branch-local ((t (:foreground ,dustveil-quaternary))))
 `(magit-branch-remote ((t (:foreground ,dustveil-tertiary))))
 `(magit-branch-current ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(magit-tag ((t (:foreground ,dustveil-tertiary))))
 `(magit-refname ((t (:foreground ,dustveil-text-secondary))))
 `(magit-log-author ((t (:foreground ,dustveil-quaternary))))
 `(magit-log-date ((t (:inherit shadow))))
 `(magit-diff-hunk-heading ((t (:foreground ,dustveil-text-subtle
                                            :background ,dustveil-container))))
 `(magit-diff-hunk-heading-highlight ((t (:foreground ,dustveil-text-subtle
                                                      :background
                                                      ,dustveil-surface))))
 `(magit-diff-added ((t (:foreground ,dustveil-success))))
 `(magit-diff-added-highlight ((t (:foreground ,dustveil-success
                                               :background ,dustveil-surface))))
 `(magit-diff-removed ((t (:foreground ,dustveil-error))))
 `(magit-diff-removed-highlight ((t (:foreground ,dustveil-error
                                                 :background
                                                 ,dustveil-surface))))
 `(magit-diff-context ((t (:foreground ,dustveil-text-secondary))))
 `(magit-diff-context-highlight ((t (:foreground ,dustveil-text
                                                 :background
                                                 ,dustveil-surface))))
 `(magit-diff-our ((t (:foreground ,dustveil-error))))
 `(magit-diff-their ((t (:foreground ,dustveil-success))))
 `(magit-diff-base ((t (:foreground ,dustveil-tertiary))))
 `(magit-diff-base-highlight ((t (:foreground ,dustveil-tertiary
                                              :background
                                              ,dustveil-surface))))
 `(magit-diffstat-added ((t (:foreground ,dustveil-success))))
 `(magit-diffstat-removed ((t (:foreground ,dustveil-error))))
 `(git-commit-summary ((t (:foreground ,dustveil-text-bright))))
 `(ediff-current-diff-A ((t (:foreground ,dustveil-error
                                         :background ,dustveil-surface))))
 `(ediff-current-diff-B ((t (:foreground ,dustveil-success
                                         :background ,dustveil-surface))))
 `(ediff-current-diff-C ((t (:foreground ,dustveil-warning
                                         :background ,dustveil-surface))))
 `(ediff-current-diff-Ancestor ((t (:foreground ,dustveil-text-subtle
                                                :background
                                                ,dustveil-visual))))
 `(ediff-fine-diff-A ((t (:foreground ,dustveil-error :bold t
                                      :background ,dustveil-surface))))
 `(ediff-fine-diff-B ((t (:foreground ,dustveil-success :bold t
                                      :background ,dustveil-surface))))
 `(ediff-fine-diff-C ((t (:foreground ,dustveil-warning :bold t
                                      :background ,dustveil-surface))))
 `(ediff-fine-diff-Ancestor ((t (:foreground ,dustveil-text-subtle
                                             :background
                                             ,dustveil-surface))))
 `(ediff-even-diff-A ((t (:foreground ,dustveil-text-secondary
                                      :background ,dustveil-container))))
 `(ediff-even-diff-B ((t (:foreground ,dustveil-text-secondary
                                      :background ,dustveil-container))))
 `(ediff-even-diff-C ((t (:foreground ,dustveil-text-secondary
                                      :background ,dustveil-container))))
 `(ediff-even-diff-Ancestor ((t (:foreground ,dustveil-text-secondary
                                             :background
                                             ,dustveil-container))))
 `(ediff-odd-diff-A ((t (:foreground ,dustveil-text
                                     :background ,dustveil-surface))))
 `(ediff-odd-diff-B ((t (:foreground ,dustveil-text
                                     :background ,dustveil-surface))))
 `(ediff-odd-diff-C ((t (:foreground ,dustveil-text
                                     :background ,dustveil-surface))))
 `(ediff-odd-diff-Ancestor ((t (:foreground ,dustveil-text
                                            :background
                                            ,dustveil-surface))))
 `(smerge-upper ((t (:foreground ,dustveil-error
                                 :background ,dustveil-container))))
 `(smerge-lower ((t (:foreground ,dustveil-success
                                 :background ,dustveil-container))))
 `(smerge-base ((t (:foreground ,dustveil-tertiary
                                :background ,dustveil-container))))
 `(smerge-markers ((t (:foreground ,dustveil-text-subtle
                                   :background ,dustveil-surface))))
 `(smerge-refined-added ((t (:foreground ,dustveil-success :bold t))))
 `(smerge-refined-removed ((t (:foreground ,dustveil-error :bold t))))
 `(smerge-refined-changed ((t (:foreground ,dustveil-warning :bold t))))
 `(git-timemachine-commit ((t (:foreground ,dustveil-text-bright :bold t))))
 `(git-timemachine-minibuffer-author-face ((t (:foreground ,dustveil-quaternary))))
 `(git-timemachine-minibuffer-detail-face ((t (:foreground ,dustveil-text))))

 ;; --- org ---------------------------------------------------------------------------
 ;; Includes the +org-todo-* faces Doom's org module declares dynamically.
 ;; A TTY cannot use its unknown default background as an invisible foreground.
 `(org-hide ((t (:foreground ,dustveil-background))))
 `(org-document-title ((t (:foreground ,dustveil-ui-accent :bold t :height 1.2))))
 `(org-document-info ((t (:foreground ,dustveil-text-subtle))))
 `(org-level-1 ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(org-level-2 ((t (:foreground ,dustveil-quaternary :bold t))))
 `(org-level-3 ((t (:foreground ,dustveil-tertiary))))
 `(org-level-4 ((t (:foreground ,dustveil-text))))
 `(org-level-5 ((t (:foreground ,dustveil-tertiary))))
 `(org-level-6 ((t (:foreground ,dustveil-quaternary))))
 `(org-level-7 ((t (:foreground ,dustveil-text-secondary))))
 `(org-level-8 ((t (:foreground ,dustveil-text-subtle))))
 `(org-todo ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(org-done ((t (:foreground ,dustveil-success :bold t))))
 `(+org-todo-active ((t (:foreground ,dustveil-warning :bold t))))
 `(+org-todo-onhold ((t (:foreground ,dustveil-info :bold t))))
 `(+org-todo-cancel ((t (:foreground ,dustveil-text-muted :strike-through t))))
 `(+org-todo-project ((t (:foreground ,dustveil-tertiary :bold t))))
 `(org-priority ((t (:foreground ,dustveil-warning))))
 `(org-tag ((t (:inherit shadow))))
 `(org-date ((t (:foreground ,dustveil-text-secondary :underline t))))
 `(org-special-keyword ((t (:inherit shadow))))
 `(org-meta-line ((t (:inherit shadow))))
 `(org-drawer ((t (:inherit shadow))))
 `(org-property-value ((t (:foreground ,dustveil-text-secondary))))
 `(org-table ((t (:foreground ,dustveil-text-secondary))))
 `(org-formula ((t (:foreground ,dustveil-tertiary))))
 `(org-block ((t (:background ,dustveil-container :extend t))))
 `(org-block-begin-line ((t (:foreground ,dustveil-text-subtle
                                          :background ,dustveil-container
                                          :extend t))))
 `(org-block-end-line ((t (:inherit org-block-begin-line))))
 `(org-code ((t (:foreground ,dustveil-text-secondary
                             :background ,dustveil-container :extend nil))))
 `(org-inline-src-block ((t (:inherit org-block :extend nil))))
 `(org-verbatim ((t (:foreground ,dustveil-text-secondary))))
 `(org-quote ((t (:inherit org-block :slant italic :extend t))))
 `(org-headline-done ((t (:foreground ,dustveil-text-muted))))
 `(org-checkbox ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(org-link ((t (:foreground ,dustveil-ui-accent :underline t))))
 `(org-footnote ((t (:foreground ,dustveil-text-subtle))))
 `(org-ellipsis ((t (:foreground ,dustveil-text-muted))))
 `(org-column ((t (:background ,dustveil-surface))))
 `(org-column-title ((t (:foreground ,dustveil-ui-accent :bold t
                                      :background ,dustveil-surface))))
 `(org-clock-overlay ((t (:background ,dustveil-surface))))
 `(org-agenda-clocking ((t (:background ,dustveil-surface))))
 `(org-agenda-structure ((t (:foreground ,dustveil-tertiary :bold t))))
 `(org-agenda-date ((t (:foreground ,dustveil-quaternary))))
 `(org-agenda-date-today ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(org-agenda-date-weekend ((t (:foreground ,dustveil-text-secondary))))
 `(org-agenda-done ((t (:foreground ,dustveil-text-muted))))
 `(org-scheduled ((t (:foreground ,dustveil-text))))
 `(org-scheduled-today ((t (:foreground ,dustveil-success))))
 `(org-imminent-deadline ((t (:inherit org-warning))))
 `(org-upcoming-deadline ((t (:foreground ,dustveil-warning))))
 `(org-time-grid ((t (:inherit shadow))))
 `(org-warning ((t (:foreground ,dustveil-error :bold t))))

 ;; --- markdown -------------------------------------------------------------------------
 `(markdown-header-face-1 ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(markdown-header-face-2 ((t (:foreground ,dustveil-text-secondary :bold t))))
 `(markdown-header-face-3 ((t (:foreground ,dustveil-tertiary))))
 `(markdown-header-face-4 ((t (:foreground ,dustveil-quaternary))))
 `(markdown-header-face-5 ((t (:foreground ,dustveil-tertiary))))
 `(markdown-header-face-6 ((t (:foreground ,dustveil-quaternary))))
 `(markdown-header-delimiter-face ((t (:foreground ,dustveil-text-muted))))
 `(markdown-header-rule-face ((t (:foreground ,dustveil-text-muted))))
 `(markdown-hr-face ((t (:foreground ,dustveil-text-muted))))
 `(markdown-blockquote-face ((t (:foreground ,dustveil-tertiary :italic t))))
 `(markdown-code-face ((t (:background ,dustveil-container
                                       :foreground ,dustveil-text-bright
                                       :inherit fixed-pitch :extend nil))))
 `(markdown-pre-face ((t (:inherit markdown-code-face :extend t))))
 `(markdown-inline-code-face ((t (:inherit markdown-code-face
                                 :foreground ,dustveil-text-secondary :extend nil))))
 `(markdown-language-keyword-face ((t (:foreground ,dustveil-tertiary))))
 `(markdown-markup-face ((t (:foreground ,dustveil-text-muted))))
 `(markdown-list-face ((t (:foreground ,dustveil-text-secondary))))
 `(markdown-link-face ((t (:foreground ,dustveil-quaternary))))
 `(markdown-url-face ((t (:foreground ,dustveil-quaternary :underline t))))
 `(markdown-plain-url-face ((t (:foreground ,dustveil-quaternary :underline t))))
 `(markdown-reference-face ((t (:foreground ,dustveil-quaternary))))
 `(markdown-footnote-marker-face ((t (:foreground ,dustveil-text-subtle))))
 `(markdown-metadata-key-face ((t (:foreground ,dustveil-tertiary))))
 `(markdown-metadata-value-face ((t (:foreground ,dustveil-text-secondary))))
 `(markdown-gfm-checkbox-face ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(markdown-math-face ((t (:foreground ,dustveil-quaternary))))
 `(markdown-missing-link-face ((t (:foreground ,dustveil-error))))
 `(markdown-comment-face ((t (:inherit font-lock-comment-face))))
 `(markdown-strike-through-face ((t (:foreground ,dustveil-text-muted
                                                 :strike-through t))))

 ;; --- info, help, custom, compilation --------------------------------------------------
 `(info-title-1 ((t (:foreground ,dustveil-tertiary :bold t))))
 `(info-title-2 ((t (:foreground ,dustveil-tertiary))))
 `(info-title-3 ((t (:foreground ,dustveil-ui-accent))))
 `(info-title-4 ((t (:foreground ,dustveil-ui-accent))))
 `(info-menu-header ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(info-menu-star ((t (:foreground ,dustveil-ui-accent))))
 `(info-node ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(info-header-node ((t (:foreground ,dustveil-text-subtle))))
 `(info-header-xref ((t (:foreground ,dustveil-quaternary))))
 `(info-xref ((t (:foreground ,dustveil-quaternary :underline t))))
 `(info-xref-visited ((t (:foreground ,dustveil-tertiary :underline t))))
 `(info-index-match ((t (:inherit isearch))))
 `(help-argument-name ((t (:foreground ,dustveil-quaternary :italic t))))
 `(help-key-binding ((t (:background ,dustveil-container
                                      :foreground ,dustveil-text-bright :bold t))))
 `(widget-field ((t (:background ,dustveil-container
                                 :foreground ,dustveil-text))))
 `(widget-single-line-field ((t (:background ,dustveil-container
                                             :foreground ,dustveil-text))))
 `(widget-button ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(custom-variable-tag ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(custom-face-tag ((t (:foreground ,dustveil-tertiary))))
 `(custom-group-tag ((t (:foreground ,dustveil-tertiary :bold t))))
 `(custom-state ((t (:foreground ,dustveil-success))))
 `(custom-comment ((t (:inherit font-lock-comment-face))))
 `(custom-comment-tag ((t (:foreground ,dustveil-text-subtle))))
 `(custom-documentation ((t (:foreground ,dustveil-text-secondary))))
 `(compilation-error ((t (:inherit error))))
 `(compilation-warning ((t (:inherit warning))))
 `(compilation-info ((t (:foreground ,dustveil-info))))
 `(compilation-line-number ((t (:inherit shadow))))
 `(compilation-column-number ((t (:inherit shadow))))
 `(compilation-mode-line-fail ((t (:foreground ,dustveil-error :bold t))))
 `(compilation-mode-line-exit ((t (:foreground ,dustveil-success :bold t))))
 `(compilation-mode-line-run ((t (:foreground ,dustveil-warning :bold t))))
 `(whitespace-trailing ((t (:background ,dustveil-surface))))
 `(whitespace-line ((t (:background ,dustveil-surface
                                    :foreground ,dustveil-warning))))
 `(whitespace-space ((t (:foreground ,dustveil-visual))))
 `(whitespace-hspace ((t (:foreground ,dustveil-visual))))
 `(whitespace-tab ((t (:foreground ,dustveil-visual))))
 `(whitespace-newline ((t (:foreground ,dustveil-visual))))
 `(whitespace-indentation ((t (:foreground ,dustveil-visual))))
 `(whitespace-empty ((t (:foreground ,dustveil-visual))))

 ;; --- evil, search previews -----------------------------------------------------------
 `(evil-ex-substitute-matches ((t (:background ,dustveil-selection :foreground ,dustveil-background :extend t))))
 `(evil-ex-substitute-replacement ((t (:foreground ,dustveil-success))))
 `(evil-search-highlight-persist-highlight-face ((t (:background ,dustveil-selection :foreground ,dustveil-background :extend t))))
 `(evil-traces-default ((t (:background ,dustveil-surface
                                        :foreground ,dustveil-text))))
 `(evil-traces-global-match ((t (:background ,dustveil-surface
                                             :foreground ,dustveil-text-bright
                                             :strike-through t))))
 `(evil-traces-global-range ((t (:background ,dustveil-surface
                                             :foreground ,dustveil-text-bright))))
 `(evil-traces-substitute-range ((t (:background ,dustveil-surface
                                                 :foreground
                                                 ,dustveil-text-bright))))
 `(evil-traces-delete ((t (:background ,dustveil-error
                                       :foreground ,dustveil-background :bold t))))
 `(evil-traces-change ((t (:background ,dustveil-selection
                                       :foreground ,dustveil-background :bold t))))
 `(evil-traces-yank ((t (:background ,dustveil-success
                                     :foreground ,dustveil-background :bold t))))
 `(evil-traces-copy-preview ((t (:background ,dustveil-surface
                                             :foreground ,dustveil-text-bright))))
 `(evil-traces-copy-range ((t (:background ,dustveil-surface
                                           :foreground ,dustveil-text-bright))))
 `(evil-traces-move-preview ((t (:background ,dustveil-surface))))
 `(evil-traces-move-range ((t (:background ,dustveil-surface))))
 `(evil-traces-normal ((t (:foreground ,dustveil-text))))
 `(evil-goggles-default-face ((t (:background ,dustveil-surface
                                              :foreground ,dustveil-text-bright))))
 `(evil-goggles-delete-face ((t (:background ,dustveil-error
                                             :foreground ,dustveil-background))))
 `(evil-goggles-change-face ((t (:background ,dustveil-selection
                                             :foreground ,dustveil-background))))
 `(evil-goggles-yank-face ((t (:background ,dustveil-success
                                           :foreground ,dustveil-background))))
 `(evil-goggles-paste-face ((t (:background ,dustveil-info
                                            :foreground ,dustveil-background))))
 `(evil-goggles-replace-with-register-face ((t (:background ,dustveil-selection
                                                           :foreground ,dustveil-background))))
 `(evil-goggles-surround-face ((t (:background ,dustveil-selection
                                               :foreground ,dustveil-background))))
 `(evil-snipe-first-match-face ((t (:background ,dustveil-selection
                                                :foreground ,dustveil-background
                                                :bold t))))
 `(evil-snipe-matches-face ((t (:background ,dustveil-surface
                                            :foreground ,dustveil-text-bright))))
 `(anzu-mode-line ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(anzu-mode-line-no-match ((t (:foreground ,dustveil-error :bold t))))
 `(anzu-replace-highlight ((t (:background ,dustveil-surface
                                           :foreground ,dustveil-text-bright))))
 `(anzu-replace-to ((t (:foreground ,dustveil-success :bold t))))
 `(anzu-match-1 ((t (:foreground ,dustveil-ui-accent))))
 `(anzu-match-2 ((t (:foreground ,dustveil-tertiary))))
 `(anzu-match-3 ((t (:foreground ,dustveil-quaternary))))
 `(iedit-occurrence ((t (:background ,dustveil-surface
                                     :foreground ,dustveil-text-bright :bold t))))
 `(iedit-read-only-occurrence ((t (:background ,dustveil-surface
                                               :foreground ,dustveil-text-muted
                                               :italic t))))

 ;; --- navigation -------------------------------------------------------------------------
 `(avy-lead-face ((t (:background ,dustveil-selection
                                  :foreground ,dustveil-background :bold t))))
 `(avy-lead-face-0 ((t (:background ,dustveil-selection
                                    :foreground ,dustveil-background :bold t))))
 `(avy-lead-face-1 ((t (:background ,dustveil-surface
                                    :foreground ,dustveil-text-bright :bold t))))
 `(avy-lead-face-2 ((t (:background ,dustveil-overlay
                                    :foreground ,dustveil-text-bright :bold t))))
 `(avy-background-face ((t (:foreground ,dustveil-text-muted))))
 `(avy-goto-char-timer-face ((t (:background ,dustveil-surface
                                             :foreground
                                             ,dustveil-text-bright :bold t))))
 `(aw-leading-char-face ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(aw-background-face ((t (:foreground ,dustveil-text-muted))))
 `(aw-mode-line-face ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(aw-minibuffer-leading-char-face ((t (:foreground ,dustveil-ui-accent
                                                    :bold t))))

 ;; --- misc ui ------------------------------------------------------------------------------
 `(hl-todo ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(link ((t (:foreground ,dustveil-ui-accent :underline t))))
 `(link-visited ((t (:foreground ,dustveil-tertiary :underline t))))
 `(tooltip ((t (:background ,dustveil-container
                            :foreground ,dustveil-text))))
 `(popup-face ((t (:background ,dustveil-container
                               :foreground ,dustveil-text))))
 `(popup-tip-face ((t (:background ,dustveil-surface
                                   :foreground ,dustveil-ui-accent))))
 `(popup-menu-selection-face ((t (:background ,dustveil-selection :foreground ,dustveil-background :extend t))))
 `(popup-menu-summary-face ((t (:inherit shadow))))
 `(child-frame-border ((t (:background ,dustveil-text-muted))))
 `(nav-flash-face ((t (:background ,dustveil-surface
                                   :foreground ,dustveil-ui-accent))))
 `(which-key-key-face ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(which-key-command-description-face ((t (:foreground ,dustveil-text))))
 `(which-key-group-description-face ((t (:foreground ,dustveil-text-subtle))))
 `(which-key-special-key-face ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(which-key-separator-face ((t (:foreground ,dustveil-text-muted))))
 `(which-key-note-face ((t (:inherit shadow :italic t))))
 `(dashboard-banner-logo-title ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(doom-dashboard-default ((t (:background ,dustveil-background :foreground ,dustveil-text))))
 `(dashboard-items-face ((t (:foreground ,dustveil-text))))
 `(dashboard-heading ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(dashboard-navigator-face ((t (:foreground ,dustveil-quaternary))))
 `(transient-key ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(transient-heading ((t (:foreground ,dustveil-tertiary :bold t))))
 `(transient-argument ((t (:foreground ,dustveil-quaternary))))
 `(transient-value ((t (:foreground ,dustveil-tertiary))))
 `(transient-inactive-argument ((t (:inherit shadow))))
 `(transient-inactive-value ((t (:inherit shadow))))
 `(transient-unreachable ((t (:foreground ,dustveil-text-muted :strike-through t))))
 `(transient-unreachable-key ((t (:foreground ,dustveil-text-muted))))
 `(vundo-default ((t (:foreground ,dustveil-text))))
 `(vundo-highlight ((t (:foreground ,dustveil-ui-accent :bold t))))
 `(vundo-stem ((t (:foreground ,dustveil-visual))))
 `(vundo-saved ((t (:foreground ,dustveil-success))))
 `(vundo-last-saved ((t (:foreground ,dustveil-success :bold t))))
 `(treesit-fold-fringe-face ((t (:foreground ,dustveil-text-muted))))
 `(treesit-fold-replacement-face ((t (:foreground ,dustveil-text-muted))))
 `(macrostep-expansion-highlight-face ((t (:background ,dustveil-surface))))
 `(macrostep-macro-face ((t (:foreground ,dustveil-text :bold t))))
 `(macrostep-compiler-macro-face ((t (:foreground ,dustveil-text :bold t))))
 `(macrostep-gensym-1 ((t (:foreground ,dustveil-text))))
 `(macrostep-gensym-2 ((t (:foreground ,dustveil-text))))
 `(macrostep-gensym-3 ((t (:foreground ,dustveil-text))))
 `(macrostep-gensym-4 ((t (:foreground ,dustveil-text))))
 `(macrostep-gensym-5 ((t (:foreground ,dustveil-text))))
 `(wgrep-face ((t (:foreground ,dustveil-warning))))
 `(wgrep-done-face ((t (:foreground ,dustveil-success))))
 `(wgrep-delete-face ((t (:foreground ,dustveil-error :strike-through t))))
 `(wgrep-file-face ((t (:foreground ,dustveil-text))))
 `(wgrep-reject-face ((t (:foreground ,dustveil-error :bold t))))
 `(highlight-quoted-quote ((t (:foreground ,dustveil-text))))
 `(highlight-quoted-symbol ((t (:foreground ,dustveil-text))))
 `(eros-result-overlay-face ((t (:background ,dustveil-container
                                             :foreground ,dustveil-text-secondary))))
 `(yas-field-highlight-face ((t (:background ,dustveil-surface))))
 `(dape-breakpoint-face ((t (:background ,dustveil-error
                                         :foreground ,dustveil-background))))
 `(dape-breakpoint-until-face ((t (:background ,dustveil-selection
                                               :foreground ,dustveil-background))))
 `(dape-source-line-face ((t (:background ,dustveil-surface
                                          :foreground ,dustveil-text-bright))))
 `(dape-expression-face ((t (:foreground ,dustveil-text-secondary))))
 `(dape-inlay-hint-face ((t (:foreground ,dustveil-text-subtle
                                         :background ,dustveil-surface
                                         :italic t))))
 `(dape-repl-error-face ((t (:foreground ,dustveil-error))))
 `(dape-log-face ((t (:inherit shadow))))
 `(dape-header-line-active-face ((t (:background ,dustveil-selection
                                                 :foreground ,dustveil-background))))
 `(dape-header-line-inactive-face ((t (:background ,dustveil-container
                                                   :foreground
                                                   ,dustveil-text-muted))))
 `(dape-hits-face ((t (:foreground ,dustveil-success))))

 ;; --- nerd-icons -------------------------------------------------------------------------------
 `(nerd-icons-blue ((t (:foreground ,dustveil-quaternary))))
 `(nerd-icons-blue-alt ((t (:foreground ,dustveil-quaternary))))
 `(nerd-icons-cyan ((t (:foreground ,dustveil-quaternary))))
 `(nerd-icons-cyan-alt ((t (:foreground ,dustveil-quaternary))))
 `(nerd-icons-green ((t (:foreground ,dustveil-text-secondary))))
 `(nerd-icons-orange ((t (:foreground ,dustveil-ui-accent))))
 `(nerd-icons-purple ((t (:foreground ,dustveil-tertiary))))
 `(nerd-icons-purple-alt ((t (:foreground ,dustveil-tertiary))))
 `(nerd-icons-red ((t (:foreground ,dustveil-secondary))))
 `(nerd-icons-red-alt ((t (:foreground ,dustveil-secondary))))
 `(nerd-icons-yellow ((t (:foreground ,dustveil-tertiary))))
 `(nerd-icons-pink ((t (:foreground ,dustveil-tertiary))))
 `(nerd-icons-maroon ((t (:foreground ,dustveil-secondary))))
 `(nerd-icons-silver ((t (:foreground ,dustveil-text-subtle))))
 `(nerd-icons-dblue ((t (:foreground ,dustveil-quaternary))))
 `(nerd-icons-dcyan ((t (:foreground ,dustveil-quaternary))))
 `(nerd-icons-dgreen ((t (:foreground ,dustveil-text-secondary))))
 `(nerd-icons-dorange ((t (:foreground ,dustveil-ui-accent))))
 `(nerd-icons-dpurple ((t (:foreground ,dustveil-tertiary))))
 `(nerd-icons-dpink ((t (:foreground ,dustveil-tertiary))))
 `(nerd-icons-dred ((t (:foreground ,dustveil-secondary))))
 `(nerd-icons-dyellow ((t (:foreground ,dustveil-tertiary))))
 `(nerd-icons-dsilver ((t (:foreground ,dustveil-text-subtle))))
 `(nerd-icons-lblue ((t (:foreground ,dustveil-quaternary))))
 `(nerd-icons-lcyan ((t (:foreground ,dustveil-quaternary))))
 `(nerd-icons-lgreen ((t (:foreground ,dustveil-text-secondary))))
 `(nerd-icons-lorange ((t (:foreground ,dustveil-ui-accent))))
 `(nerd-icons-lpurple ((t (:foreground ,dustveil-tertiary))))
 `(nerd-icons-lpink ((t (:foreground ,dustveil-tertiary))))
 `(nerd-icons-lred ((t (:foreground ,dustveil-secondary))))
 `(nerd-icons-lyellow ((t (:foreground ,dustveil-tertiary))))
 `(nerd-icons-lsilver ((t (:foreground ,dustveil-text-bright))))

 ;; --- lsp-mode -----------------------------------------------------------------------------------
 `(lsp-face-highlight-read ((t (:background ,dustveil-surface))))
 `(lsp-face-highlight-textual ((t (:background ,dustveil-surface))))
 `(lsp-face-highlight-write ((t (:background ,dustveil-surface
                                             :box (:color ,dustveil-primary)))))
 `(lsp-face-rename ((t (:background ,dustveil-surface))))
 `(lsp-ui-doc-background ((t (:background ,dustveil-container))))
 `(lsp-inlay-hint-face ((t (:foreground ,dustveil-text-subtle
                                        :background ,dustveil-surface
                                        :italic t))))
 `(lsp-inlay-hint-parameter-face ((t (:foreground ,dustveil-text-muted
                                                 :background
                                                 ,dustveil-surface
                                                 :italic t))))
 `(lsp-inlay-hint-type-face ((t (:foreground ,dustveil-text-muted
                                             :background ,dustveil-surface
                                             :italic t))))
 `(lsp-lens-face ((t (:inherit shadow))))
 `(lsp-details-face ((t (:inherit shadow :italic t))))
 `(lsp-modeline-code-actions-face ((t (:foreground ,dustveil-warning))))
 `(lsp-signature-face ((t (:foreground ,dustveil-text-secondary :italic t))))
 `(lsp-signature-highlight-function-argument ((t (:foreground
                                                  ,dustveil-primary :bold t))))
 `(lsp-signature-posframe ((t (:background ,dustveil-container
                                           :foreground ,dustveil-text))))
 `(lsp-headerline-breadcrumb-path-face ((t (:foreground ,dustveil-text-subtle))))
 `(lsp-headerline-breadcrumb-symbols-face ((t (:foreground ,dustveil-ui-accent))))
 `(lsp-headerline-breadcrumb-separator-face ((t (:foreground ,dustveil-text-muted))))
 `(lsp-headerline-breadcrumb-project-prefix-face ((t (:foreground
                                                     ,dustveil-tertiary))))
 `(lsp-headerline-breadcrumb-path-error-face ((t (:foreground ,dustveil-error))))
 `(lsp-headerline-breadcrumb-path-warning-face ((t (:foreground
                                                   ,dustveil-warning))))
 `(lsp-headerline-breadcrumb-path-info-face ((t (:foreground ,dustveil-info))))
 `(lsp-headerline-breadcrumb-path-hint-face ((t (:foreground ,dustveil-quaternary))))
 `(lsp-headerline-breadcrumb-symbols-error-face ((t (:foreground
                                                     ,dustveil-error))))
 `(lsp-headerline-breadcrumb-symbols-warning-face ((t (:foreground
                                                      ,dustveil-warning))))
 `(lsp-headerline-breadcrumb-symbols-info-face ((t (:foreground
                                                   ,dustveil-info))))
 `(lsp-headerline-breadcrumb-symbols-hint-face ((t (:foreground
                                                   ,dustveil-quaternary))))
 `(lsp-headerline-breadcrumb-deprecated-face ((t (:foreground ,dustveil-text-muted
                                                              :strike-through t))))
 `(lsp-face-semhl-keyword ((t (:foreground ,dustveil-keyword))))
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
 `(lsp-face-semhl-event ((t (:foreground ,dustveil-text))))
 `(lsp-face-semhl-type-parameter ((t (:inherit font-lock-type-face))))
 `(lsp-face-semhl-decorator ((t (:foreground ,dustveil-text))))
 `(lsp-face-semhl-namespace ((t (:inherit font-lock-type-face))))
 `(lsp-face-semhl-label ((t (:foreground ,dustveil-text))))
 `(lsp-face-semhl-operator ((t (:foreground ,dustveil-punctuation))))
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

(let ((colors '((black . "#514942")
                (red . "#877e76")
                (green . "#978e86")
                (yellow . "#aaa198")
                (blue . "#7b726b")
                (magenta . "#8e857d")
                (cyan . "#9e958d")
                (white . "#e0d7ce")
                (bright-black . "#635b53")
                (bright-red . "#877e76")
                (bright-green . "#978e86")
                (bright-yellow . "#aaa198")
                (bright-blue . "#7b726b")
                (bright-magenta . "#8e857d")
                (bright-cyan . "#9e958d")
                (bright-white . "#fcf2e9"))))
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
