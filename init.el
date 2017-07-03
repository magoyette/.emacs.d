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
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
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

;;;;; Use a dark window on GNOME

;; Required by set-selected-frame-dark for get-frame-name
(use-package frame-fns
  :ensure t)

;; Source: https://nicolas.petton.fr/blog/emacs-dark-window-decoration.html
(defun set-selected-frame-dark ()
  (interactive)
  (let ((frame-name (get-frame-name (selected-frame))))
    (call-process-shell-command
     (concat "xprop -f _GTK_THEME_VARIANT 8u -set "
             "_GTK_THEME_VARIANT \"dark\" -name \""
             frame-name
             "\""))))

(if (and (eq system-type 'gnu/linux) (window-system))
    (set-selected-frame-dark))


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


;;;;; Configure Hydra

(use-package hydra
  :ensure t)


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
(add-to-list 'load-path "~/.emacs.d/submodules/prometheus-rules-mode/")
(add-to-list 'load-path "~/.emacs.d/submodules/flycheck-swagger-tools/")

;; local-settings is used to set local configurations not stored in Git
(if (file-exists-p "~/.emacs.d/local-settings.el")
    (load "~/.emacs.d/local-settings.el"))

(require 'edition-settings)
(require 'mark-settings)
(require 'narrowing-settings)
(require 'windows-settings)
(require 'helm-settings)

;; dired-settings is after helm-settings to allow peep-dired
;;  to replace an Helm Dired keybinding
(require 'dired-settings)

(require 'terminal-settings)
(require 'company-settings)
(require 'yasnippet-settings)
(require 'projectile-settings)
(require 'flycheck-settings)
(require 'navigation-settings)
(require 'search-settings)
(require 'highlight-settings)
(require 'git-settings)
(require 'org-settings)
(require 'writing-settings)
(require 'doctoc)
(require 'markdown-settings)
(require 'spelling-settings)
(require 'web-settings)
(require 'yaml-settings)
(require 'rest-settings)
(require 'cucumber-settings)
(require 'clojure-settings)
(require 'haskell-settings)
(require 'elixir-settings)
(require 'smartparens-settings)
(require 'docker-settings)
(require 'prometheus-settings)
(require 'swagger-settings)
(require 'help-settings)
(require 'theme-settings)
