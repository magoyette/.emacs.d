(setq buffer-file-coding-system 'utf-8-unix)
(set-language-environment "UTF-8")

;; Backup files in a backups folder
(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat user-emacs-directory "backups")))))
(setq vc-make-backup-files t)


(provide 'edition-settings)
