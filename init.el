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

;; Use y or n confirmations instead of yes or no
(fset 'yes-or-no-p 'y-or-n-p)


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


;;;;; Diminish

(use-package diminish
  :ensure t)


;;;;; Paradox

(use-package paradox
  :ensure t
  :bind (("C-x p" . paradox-list-packages))
  :config
  ;; Disable paradox support for (un)starring repos
  (setq paradox-github-token t))


;;;;; Configure Emacs Lisp

(use-package eldoc
  :commands eldoc-mode
  :diminish eldoc-mode
  :init
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode))


;;;;; Configure Hydra

(use-package hydra
  :ensure t)


;;;;; Load settings files

(add-to-list 'load-path "~/.emacs.d/settings/")

(load "~/.emacs.d/local-settings.el")

(require 'edition-settings)
(require 'narrowing-settings)
(require 'windows-settings)
(require 'helm-settings)
(require 'company-settings)
(require 'yasnippet-settings)
(require 'projectile-settings)
(require 'flycheck-settings)
(require 'navigation-settings)
(require 'search-settings)
(require 'search-engines-settings)
(require 'git-settings)
(require 'org-settings)
(require 'markdown-settings)
(require 'spelling-settings)
(require 'web-settings)
(require 'yaml-settings)
(require 'rest-settings)
(require 'cucumber-settings)
(require 'clojure-settings)
(require 'haskell-settings)
(require 'elixir-settings)
(require 'help-settings)
(require 'theme-settings)
