;;; config.el -*- lexical-binding: t; -*-

(setq org-directory "~/org")

(setq doom-theme 'dustveil
      doom-font (font-spec :family "Iosevka Nerd Font" :size 20))

(setq-default fill-column 100)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

(after! solaire-mode
  (solaire-global-mode -1))

(after! vterm
  (setq vterm-set-bold-highbright t))

(after! ansi-color
  (setq ansi-color-bold-is-bright t))

(setq display-line-numbers-type 'relative
      scroll-margin 8
      make-backup-files t
      confirm-kill-emacs #'y-or-n-p)

(setq-default truncate-lines nil)

(defconst +todo-comment-keywords
  '("TODO" "NEXT" "WAIT" "FIXME" "BUG" "HACK" "WARN" "PERF" "NOTE" "TEST")
  "Keywords searched by `+todo/search'.")

(when (modulep! :completion vertico)
  (defun +todo/search ()
    "Search TODO-style keywords in the current project."
    (interactive)
    (+vertico/project-search
     nil
     (regexp-opt +todo-comment-keywords 'words)
     (or (projectile-project-root) default-directory))))

(after! evil
  (setq evil-kill-on-visual-paste nil)
  (evil-define-command +evil-scroll-down-centered (count)
    (interactive "<c>")
    (evil-scroll-down count)
    (recenter))
  (evil-define-command +evil-scroll-up-centered (count)
    (interactive "<c>")
    (evil-scroll-up count)
    (recenter))

  (evil-define-motion +evil-search-next-centered (count)
    :jump t
    (evil-ex-search-next count)
    (recenter))
  (evil-define-motion +evil-search-previous-centered (count)
    :jump t
    (evil-ex-search-previous count)
    (recenter)))

(after! corfu
  (setq corfu-count 10)
  (defun +corfu--current-face-a (args)
    (let ((current (nth 4 args)))
      (when (and (memq 'dustveil custom-enabled-themes)
                 (integerp current) (>= current 0))
        (when-let* ((line (nth current (nth 3 args))))
          (setq args (copy-sequence args))
          (let ((lines (copy-sequence (nth 3 args)))
                (line (copy-sequence line)))
            (add-face-text-property 0 (length line) 'corfu-current nil line)
            (setf (nth current lines) line
                  (nth 3 args) lines)))))
    args)
  (advice-add 'corfu--popup-show :filter-args #'+corfu--current-face-a))

(after! vertico
  (defun +vertico--current-face-a (fn cand prefix suffix index start)
    (let ((line (funcall fn cand prefix suffix index start)))
      (when (and (memq 'dustveil custom-enabled-themes)
                 (= index vertico--index))
        (add-face-text-property 0 (length line) 'vertico-current nil line))
      line))
  (advice-add 'vertico--format-candidate :around #'+vertico--current-face-a))

(after! evil-escape
  (setq evil-escape-key-sequence "jk"
        evil-escape-delay 0.15))

(after! lsp-ui
  (setq
   lsp-ui-doc-enable t
   lsp-ui-doc-use-childframe t
   lsp-ui-doc-show-with-cursor t
   lsp-ui-doc-position 'at-point
   lsp-ui-doc-delay 0.4
   lsp-ui-doc-include-signature t))

(after! lsp-mode
  (setq lsp-semantic-tokens-enable t)
  (add-hook 'lsp-mode-hook #'lsp-ui-mode))

(after! lsp-semantic-tokens
  (setf (alist-get "declaration"
                   (default-value 'lsp-semantic-token-modifier-faces)
                   nil nil #'equal)
        nil))

(after! lsp-julia
  (setq lsp-julia-lint-missingrefs "none"))

(after! writeroom-mode
  (setq writeroom-width 100
        +zen-text-scale 1.05
        +zen-mixed-pitch-modes (remq 'markdown-mode +zen-mixed-pitch-modes)))

(after! org
  (setq org-src-fontify-natively t
        org-src-tab-acts-natively t))

(load! "+bindings")
(load! "+org")
(load! "+lang-extras")
(load! "+tasks")
