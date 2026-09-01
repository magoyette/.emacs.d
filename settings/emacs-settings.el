;;; -*- lexical-binding: t; -*-

;; Font settings
(set-face-attribute 'default nil :font "DejaVu Sans Mono 12")
(set-face-attribute 'fixed-pitch nil :font "DejaVu Sans Mono 12")

;; Increase amount of data read from process for lsp
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; Avoid pathological slowdowns on files with very long lines
(global-so-long-mode 1)

;; Prefer newest Emacs Lisp byte code
(setq load-prefer-newer t)

;;;;; UI settings

;; Disable welcome screen and welcome message
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message (user-login-name))

;; Disable initial scratch message
(setq initial-scratch-message nil)

;; Use y or n confirmations instead of yes or no
(setq use-short-answers t)

;; Repeat built-in key sequences without the prefix (e.g. C-x o o o)
(repeat-mode 1)

;; Fix dead keys on Linux
(require 'iso-transl)

;; Enable links in comments and strings
(add-hook 'prog-mode-hook 'goto-address-prog-mode)

;;;;; Eldoc

;; Activate Eldoc in mini-buffer
(add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)

(provide 'emacs-settings)
