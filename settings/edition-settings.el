(require 'use-package)

(setq buffer-file-coding-system 'utf-8-unix)
(set-language-environment "UTF-8")

;; Insert spaces instead of tab on indent, use 4 spaces for a tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq require-final-newline t)

;; Backup files in a backups folder
(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat user-emacs-directory "backups")))))
(setq vc-make-backup-files t)

;; Auto indent on return
(define-key global-map (kbd "RET") 'newline-and-indent)

(use-package aggressive-indent
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode))

(provide 'edition-settings)
