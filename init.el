;;;;; Emacs Lisp settings

;; Set the garbage collector to only run for each 50 MB
(setq gc-cons-threshold 50000000)

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
