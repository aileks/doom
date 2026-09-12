;;; config.el -*- lexical-binding: t; -*-
;;
;; Runtime settings. Loaded after Doom's modules, so plain `setq' here wins
;; over core defaults. Feature-specific config lives in the +*.el files
;; loaded at the bottom; the theme lives in ./themes/.

;; --- Org ---------------------------------------------------------------
;; Must be set before org loads; config.el is early enough because org is
;; lazy-loaded. See +org.el for the rest of the Org setup.
(setq org-directory "~/org")

;; --- Appearance ---------------------------------------------------------
;; Ported from cinder-grove.nvim@44bc0b3 (see themes/cinder-grove-theme.el).
(setq doom-theme 'cinder-grove
      ;; IosevkaTerm Nerd Font is installed on this host.
      doom-font (font-spec :family "IosevkaTerm Nerd Font" :size 14))

;; Background transparency like the Neovim setup. Harmless no-op without an
;; X compositor; with one (picom etc.) frames go see-through.
(add-to-list 'initial-frame-alist '(alpha-background . 90))
(add-to-list 'default-frame-alist '(alpha-background . 90))

;; solaire dims "special" buffers; the Neovim look was a uniform background.
(after! solaire-mode (solaire-global-mode -1))

;; --- Editor behavior (parity with nvim config/options.lua) ---------------
(setq display-line-numbers-type 'relative ; relativenumber + absolute
      scroll-margin 8                     ; scrolloff = 8
      truncate-lines nil                  ; nvim wraps by default
      word-wrap t                         ; wrap at word boundaries
      make-backup-files t                 ; core disables backups; nvim kept them
      confirm-kill-emacs #'y-or-n-p       ; nvim `confirm = true`
      corfu-count 10)                     ; pumheight = 10

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
