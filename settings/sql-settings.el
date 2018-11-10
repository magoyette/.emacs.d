(use-package sqlformat
  :ensure t
  :config
  (add-hook 'sql-mode-hook 'sqlformat-mode))

(provide 'sql-settings)
