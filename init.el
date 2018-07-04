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

(use-package hydra
  :ensure t)

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
(add-to-list 'load-path "~/.emacs.d/submodules/prometheus-v1-rules-mode/")
(add-to-list 'load-path "~/.emacs.d/submodules/flycheck-swagger-tools/")
(add-to-list 'load-path "~/.emacs.d/submodules/flycheck-swagger-cli/")
(add-to-list 'load-path "~/.emacs.d/submodules/openapi-yaml-mode/")

;; local-settings is used to set local configurations not stored in Git
(if (file-exists-p "~/.emacs.d/local-settings.el")
    (load "~/.emacs.d/local-settings.el"))

;; Core settings
(require 'edition-settings)
(require 'helm-settings)
(require 'navigation-search-settings)
(require 'dired-neotree-settings)
(require 'windows-settings)
(require 'company-settings)
(require 'yasnippet-settings)
(require 'flycheck-settings)
(require 'spelling-settings)

;; Reading
(require 'epub-settings)
(require 'pdf-settings)

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
(require 'python-settings)
(require 'smartparens-settings)
(require 'docker-settings)
(require 'prometheus-settings)
(require 'openapi-settings)

;; Emacs Theme
(require 'theme-settings)
