;;; config.el -*- lexical-binding: t; -*-
;;
;; Runtime settings, loaded after Doom's modules have been configured.
;; Module defaults that live in deferred :config blocks (corfu, lsp, ...)
;; need `after!' here to reliably win.
;; Feature-specific config lives in the +*.el files loaded at the bottom;
;; the theme lives in ./themes/.

;; --- Org ---------------------------------------------------------------
;; Must be set before org loads; config.el is early enough because org is
;; lazy-loaded. See +org.el for the rest of the Org setup.
(setq org-directory "~/org")

;; --- Appearance ---------------------------------------------------------
;; Ported from cinder-grove.nvim@44bc0b3 (see themes/cinder-grove-theme.el).
(setq doom-theme 'cinder-grove
      ;; IosevkaTerm Nerd Font is installed on this host.
      doom-font (font-spec :family "IosevkaTerm Nerd Font" :size 14))

;; Frame-level transparency (like the Neovim setup). The theme sets solid
;; colors; alpha-background makes whole frames translucent when an X
;; compositor is running, and is a no-op without one.
(add-to-list 'initial-frame-alist '(alpha-background . 90))
(add-to-list 'default-frame-alist '(alpha-background . 90))

;; solaire dims "special" buffers; the Neovim look was a uniform background.
(after! solaire-mode (solaire-global-mode -1))

;; --- Editor behavior (parity with nvim config/options.lua) ---------------
(setq display-line-numbers-type 'relative ; relativenumber + absolute
      scroll-margin 8                     ; scrolloff = 8
      make-backup-files t                 ; core disables backups; nvim kept them
      confirm-kill-emacs #'y-or-n-p)      ; nvim `confirm = true`

;; Soft-wrap long lines everywhere (nvim linebreak); the word-wrap module
;; owns language-aware wrap fine-tuning.
(setq-default truncate-lines nil)

(after! corfu
  (setq corfu-count 10))                  ; pumheight = 10 (module default is 16)

(after! evil-escape
  (setq evil-escape-key-sequence "jk"     ; jk -> Esc (opt-in in current Doom)
        evil-escape-delay 0.15))

;; --- load feature files --------------------------------------------------
(load! "+bindings")
(load! "+org")
(load! "+sql")
(load! "+dbt")
(load! "+lang-extras")
(load! "+tasks")
(load! "+debug-print")
