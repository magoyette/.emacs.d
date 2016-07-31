(require 'use-package)

;; Font settings
(set-face-attribute 'default nil :font "DejaVu Sans Mono 12")

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

(use-package rainbow-delimiters
  :ensure t)

(use-package spaceline
  :ensure t
  :init
  (require 'spaceline-config)
  (setq powerline-default-separator 'wave)
  :config
  ;; Use unicode character for window number (window-numbering package)
  (with-no-warnings (setq spaceline-window-numbers-unicode t))
  
  (spaceline-emacs-theme)
  (spaceline-helm-mode))

(use-package zenburn-theme
 :ensure t
 :config
 (load-theme 'zenburn t))

(provide 'theme-settings)
