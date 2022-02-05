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
  :diminish page-break-lines-mode
  :config
  (global-page-break-lines-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package spaceline
  :init
  (require 'spaceline-config)
  (setq powerline-default-separator 'wave)
  :config
  (spaceline-emacs-theme))

(defun modus-themes-toggle-with-spaceline ()
  "Switch between the modus-themes and reset spaceline"
  (interactive)
  (modus-themes-toggle)
  (powerline-reset))

(use-package modus-themes
  :ensure t
  :init
  (setq modus-themes-bold-constructs t
        modus-themes-fringes 'subtle
        modus-themes-region '(bg-only)
        modus-themes-org-blocks 'gray-background)

  (modus-themes-load-themes)
  :config
  (modus-themes-load-operandi)
  :bind ("<f5>" . modus-themes-toggle-with-spaceline))

(provide 'theme-settings)
