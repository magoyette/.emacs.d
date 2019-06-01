(add-to-list 'load-path "~/.emacs.d/settings/")

(require 'emacs-settings)

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

(use-package no-littering
  :ensure t
  :config
  (require 'recentf)
  (add-to-list 'recentf-exclude no-littering-var-directory)
  (add-to-list 'recentf-exclude no-littering-etc-directory)

  (setq custom-file (no-littering-expand-etc-file-name "custom.el"))

  (setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))

(use-package benchmark-init
  :ensure t
  :config
  (benchmark-init/activate))

(use-package diminish
  :ensure t
  :config
  (diminish 'visual-line-mode))

(use-package general
  :ensure t)

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode))

;; Used by ivy to show recent commands in M-x
(use-package smex
  :ensure t)

;; Used by ivy-avy
(use-package avy
  :ensure t
  :bind (("C-," . avy-goto-char)
         ("C-'" . avy-goto-char-2)))

;; Ivy has an hydra
(use-package hydra
  :ensure t)

; Used by ivy while doing fuzzy matching
(use-package flx
  :ensure t)

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x C-b" . ivy-switch-buffer))
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
         ("C-M-s" . swiper-all))
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
   "C-c s s" '(counsel-rg :which-key "rg")
   "C-c s f" '(counsel-fzf :which-key "fzf"))
  :init
  ;; apropos also search for noninteractive functions
  (defvar apropos-do-all t)
  :config
  (setq ivy-use-selectable-prompt t)

  ;; Use a vertical bar as separator in counsel-yank-pop
  (setq counsel-yank-pop-separator
         (format "\n%s\n" (make-string 60 ?┅))))

;; imenu in all buffers with same major mode or same projectile project
(use-package imenu-anywhere
  :ensure t
  :general
  ("C-c s i" '(ivy-imenu-anywhere :which-key "imenu-anywhere")))

(use-package crux
  :ensure t
  :bind (("<S-return>" . crux-smart-open-line)
         ("<C-S-return>" . crux-smart-open-line-above)
         ("C-c d" . crux-duplicate-current-line-or-region)
         ("M-j" . crux-top-join-line)
         ("C-c k" . crux-kill-other-buffers)
         ("C-c T" . crux-visit-term-buffer)
         ("C-c r" . crux-rename-file-and-buffer)
         ("C-x 4 t" . crux-transpose-windows)))

;;;;; Load settings and features

;; Add Git submodules for packages not on Elpa or Melpa
(add-to-list 'load-path "~/.emacs.d/submodules/doctoc.el/")
(add-to-list 'load-path "~/.emacs.d/submodules/flycheck-swagger-tools/")
(add-to-list 'load-path "~/.emacs.d/submodules/flycheck-swagger-cli/")
(add-to-list 'load-path "~/.emacs.d/submodules/openapi-yaml-mode/")

;; local-settings is used to set local configurations not stored in Git
(if (file-exists-p "~/.emacs.d/local-settings.el")
    (load "~/.emacs.d/local-settings.el"))

;; Core settings
(require 'edition-settings)
(require 'navigation-search-settings)
(require 'dired-neotree-settings)
(require 'windows-settings)
(require 'company-settings)
(require 'yasnippet-settings)
(require 'flycheck-settings)
(require 'spelling-settings)

;; Tools
(require 'shell-settings)
(require 'git-settings)
(require 'org-settings)
(require 'doctoc)

;; Web & markup
(require 'markdown-settings)
(require 'web-settings)
(require 'yaml-settings)
(require 'rest-settings)

;; Programming
(require 'cucumber-settings)
(require 'clojure-settings)
(require 'java-settings)
(require 'smartparens-settings)
(require 'docker-settings)
(require 'openapi-settings)
(require 'sql-settings)
(require 'lsp-settings)

;; Emacs Theme
(require 'theme-settings)
