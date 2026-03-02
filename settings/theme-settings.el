(require 'use-package)

;; Commands to change text scale
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Disable blinking cursor
(blink-cursor-mode -1)

;; Highlight the line of the cursor
(global-hl-line-mode +1)

;; Display column number in mode line
(setq column-number-mode t)

(use-package page-break-lines
  :diminish page-break-lines-mode
  :config
  (global-page-break-lines-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package doom-themes
  :ensure t
  :custom
  (set-face-bold-p 'bold nil)
  (doom-themes-enable-bold nil)
  (doom-themes-enable-italic nil)
  :config
  (load-theme 'doom-one t)
  (doom-themes-org-config))

(provide 'theme-settings)
