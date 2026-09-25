;;; config.el -*- lexical-binding: t; -*-

(setq org-directory "~/org")

(setq doom-theme 'muted-umber
      doom-font (font-spec :family "Iosevka Nerd Font" :size 18))

(after! solaire-mode (solaire-global-mode -1))

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
    "Scroll half a page down, then center the cursor line."
    (interactive "<c>")
    (evil-scroll-down count)
    (recenter))
  (evil-define-command +evil-scroll-up-centered (count)
    "Scroll half a page up, then center the cursor line."
    (interactive "<c>")
    (evil-scroll-up count)
    (recenter))

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


(after! dap-mode
  (require 'dap-java)
  (setq dap-java-test-runner
        (expand-file-name "test-runner/junit-platform-console-standalone.jar"
                          lsp-java-server-install-dir)))

(after! corfu
  (setq corfu-count 10))

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
  (add-hook 'lsp-mode-hook #'lsp-ui-mode))

(after! writeroom-mode
  (setq writeroom-width 100
        +zen-text-scale 1.05))

(after! org
  (setq org-src-fontify-natively t
        org-src-tab-acts-natively t))

(load! "+bindings")
(load! "+org")
(load! "+sql")
(load! "+dbt")
(load! "+lang-extras")
(load! "+tasks")
