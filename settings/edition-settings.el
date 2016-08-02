(require 'use-package)

(setq buffer-file-coding-system 'utf-8-unix)
(set-language-environment "UTF-8")

;; Insert spaces instead of tab on indent, use 4 spaces for a tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq require-final-newline t)

(use-package whitespace
  :ensure t
  :config
  (setq whitespace-line-column 80) ;; limit line length
  (setq whitespace-style '(face tabs empty trailing lines-tail))

  (add-hook 'prog-mode-hook #'whitespace-mode)
  (add-hook 'before-save-hook #'whitespace-cleanup))

;; Backup files in a single backups folder
;; Source: http://whattheemacsd.com/
(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat user-emacs-directory "backups")))))

;; Backup files that are in source control
(setq vc-make-backup-files t)

;; Kill and yank more similar to copy and paste
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      mouse-yank-at-point t)

;; Auto indent on return
(define-key global-map (kbd "RET") 'newline-and-indent)

(use-package aggressive-indent
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode))

;; Unique buffer names
(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward))

;; Save last position in killed buffers
;; Source: http://whattheemacsd.com/
(use-package saveplace
  :config
  (setq-default save-place t
                save-place-file (expand-file-name ".places"
                                                  user-emacs-directory)))

;; Functions to add a new blank line above or below
;;  even if cursor is in the middle of the line
;; Source: http://whattheemacsd.com/
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)

(provide 'edition-settings)
