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

;; Disable initial scratch message
(setq initial-scratch-message nil)


;;;;; Packages management

;; Configure Melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Necessary for the installation of use-package
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)


;;;;; Load settings files

(add-to-list 'load-path "~/.emacs.d/settings/")

(require 'git-settings)
