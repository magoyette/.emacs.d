(require 'use-package)

;; Commands to change text scale
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Disable blinking cursor
(blink-cursor-mode -1)

;; Highlight the line of the cursor
(global-hl-line-mode +1)

;; Highlight matching parenthesis
(show-paren-mode 1)

;; Display column number in mode line
(setq column-number-mode t)

(use-package page-break-lines
  :ensure t
  :diminish page-break-lines-mode
  :config
  (global-page-break-lines-mode))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode))

(use-package spaceline
  :ensure t
  :init
  (require 'spaceline-config)
  (setq powerline-default-separator 'wave)
  :config
  (spaceline-emacs-theme))

;; Depends on page-break-lines
(use-package dashboard
  :ensure t
  :init
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-startup-banner 'logo)
  :config
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-items '((projects . 10)
                     (recents  . 10)
                     (bookmarks . 5))))

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

(provide 'theme-settings)
