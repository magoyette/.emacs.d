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

;; Fix dead keys on Linux
(require 'iso-transl)

;;;;; Customizations

;; Store customizations like package-selected-packages in a distinct file
;; customizations.el is included in .gitignore
(setq custom-file "~/.emacs.d/customizations.el")
(load custom-file 'noerror)


;;;;; Packages management

;; Configure Melpa
(global-set-key (kbd "C-x p") 'list-packages)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/") t)
(setq package-archive-priorities
      '(("melpa" . 10)
        ("gnu" . 0)))
(package-initialize)

;; Necessary for the installation of use-package
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)


;;;;; Benchmark-init

(use-package benchmark-init
  :ensure t
  :config
  (benchmark-init/activate))


;;;;; Diminish

(use-package diminish
  :ensure t
  :config
  (diminish 'visual-line-mode))

;;;;; Keybindings

(use-package general
  :ensure t)

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode))

;;;;; Packages used by Ivy and Counsel

;; Used by ivy to show recent commands in M-x
(use-package smex
  :ensure t)

;; Used by ivy-avy
(use-package avy
  :ensure t
  :bind (("C-," . avy-goto-char)
         ("C-'" . avy-goto-char-2)
         ("M-g f" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)))

;; Ivy has an hydra
(use-package hydra
  :ensure t)

; Used by ivy while doing fuzzy matching
(use-package flx
  :ensure t)

;;;;; Ivy, Counsel and Swiper

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :init
  (ivy-mode 1)
  :config
  (setq ivy-height 20)
  (setq ivy-count-format "(%d/%d) ")

  ;; Search also in recent files and bookmarks
  (setq ivy-use-virtual-buffers t)

  (setq ivy-use-selectable-prompt t)

  (setq enable-recursive-minibuffers t))

(use-package ivy-hydra
  :ensure t)

(use-package swiper
  :ensure t
  :bind (("C-s" . counsel-grep-or-swiper)
         ([remap isearch-backward] . counsel-grep-or-swiper)
         ("C-M-s" . swiper-all)
         ("C-x C-b" . ivy-switch-buffer))
  :config
  ;; Use rg instead of grep in counsel-grep-or-swiper
  ;; -M 120 allows to hide lines that are too long to avoid slowdowns
  ;;        (ex: log files)
  (setq counsel-grep-base-command
        "rg -i -M 120 --no-heading --line-number --color never '%s' %s"))

(which-key-add-key-based-replacements "C-c s" "Search & Replace")

(use-package counsel
  :ensure t
  :general
  ("M-x" 'counsel-M-x
   "C-c e" 'counsel-M-x
   "C-x C-f" 'counsel-find-file
   "C-x C-r" 'counsel-recentf
   "<f1> f" 'counsel-describe-function
   "<f1> v" 'counsel-describe-variable
   "<f1> l" 'counsel-find-library
   "<f2> i" 'counsel-info-lookup-symbol
   "<f2> u" 'counsel-unicode-char
   "C-h a" 'counsel-apropos
   "C-h b" 'counsel-descbinds
   "M-i" 'counsel-imenu
   "C-x M-b" 'counsel-bookmark
   "M-y" 'counsel-yank-pop
   "C-c <tab>" 'counsel-company
   "C-c h" 'counsel-switch-to-shell-buffer
   "C-c s r" '(counsel-rg :which-key "rg")
   "C-c s f" '(counsel-fzf :which-key "fzf"))
  :init
  ;; apropos also search for noninteractive functions
  (defvar apropos-do-all t)
  :config
  ;; Use a vertical bar as separator in counsel-yank-pop
  (setq counsel-yank-pop-separator
         (format "\n%s\n" (make-string 60 ?┅))))

;; imenu in all buffers with same major mode or same projectile project
(use-package imenu-anywhere
  :ensure t
  :general
  ("C-c s i" '(ivy-imenu-anywhere :which-key "imenu-anywhere")))

;;;;; Eldoc

;; Activate Eldoc in mini-buffer
(add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode)


;;;;; Cask-mode

(use-package cask-mode
  :ensure t)


;;;;; All-the-icons

;; Used with dired and neotree
(use-package all-the-icons
  :ensure t)


;;;;; Crux

(use-package crux
  :ensure t
  :bind (("<S-return>" . crux-smart-open-line)
         ("<C-S-return>" . crux-smart-open-line-above)
         ("C-c d" . crux-duplicate-current-line-or-region)
         ("M-j" . crux-top-join-line)
         ("C-c k" . crux-kill-other-buffers)
         ("C-c t" . crux-visit-term-buffer)
         ("C-c r" . crux-rename-file-and-buffer)
         ("C-x 4 t" . crux-transpose-windows)))


;;;;; Load settings and features

(add-to-list 'load-path "~/.emacs.d/settings/")

;; Add Git submodules for packages not on Elpa or Melpa
(add-to-list 'load-path "~/.emacs.d/submodules/doctoc.el/")
(add-to-list 'load-path "~/.emacs.d/submodules/flycheck-swagger-tools/")
(add-to-list 'load-path "~/.emacs.d/submodules/flycheck-swagger-cli/")
(add-to-list 'load-path "~/.emacs.d/submodules/openapi-yaml-mode/")

;; local-settings is used to set local configurations not stored in Git
(if (file-exists-p "~/.emacs.d/local-settings.el")
    (load "~/.emacs.d/local-settings.el"))

(require 'edition-settings)
(require 'mark-settings)
(require 'narrowing-settings)
(require 'windows-settings)
(require 'dired-settings)
(require 'shell-settings)
(require 'company-settings)
(require 'yasnippet-settings)
(require 'navigation-settings)

;; projectile-settings is after navigation-settings to allow
;;  the projectile hydra to refer to Neotree
(require 'projectile-settings)

(require 'flycheck-settings)
(require 'search-settings)
(require 'highlight-settings)
(require 'git-settings)
(require 'org-settings)
(require 'doctoc)
(require 'markdown-settings)
(require 'spelling-settings)
(require 'web-settings)
(require 'yaml-settings)
(require 'rest-settings)
(require 'cucumber-settings)
(require 'clojure-settings)
(require 'smartparens-settings)
(require 'docker-settings)
(require 'openapi-settings)
(require 'epub-settings)
(require 'pdf-settings)
(require 'theme-settings)
