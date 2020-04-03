;; Font settings
(set-face-attribute 'default nil :font "DejaVu Sans Mono 12")

;; Set the garbage collector to only run for each 100 MB
(setq gc-cons-threshold 100000000)

;; Increase amount of data read from process for emacs-lsp
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; Prefer newest Emacs Lisp byte code
(setq load-prefer-newer t)

;;;;; UI settings

;; Disable tool bar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Disable menu bar
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

;; Disable scroll bar
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Disable welcome screen and welcome message
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Disable initial scratch message
(setq initial-scratch-message nil)

;; Use y or n confirmations instead of yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; Fix dead keys on Linux
(require 'iso-transl)

;; Enable links in comments and strings
(add-hook 'prog-mode-hook 'goto-address-prog-mode)

;;;;; Eldoc

;; Activate Eldoc in mini-buffer
(add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)

(provide 'emacs-settings)
