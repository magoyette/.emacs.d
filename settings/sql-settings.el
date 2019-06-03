(require 'sql)

(use-package sqlformat
  :ensure t
  :config
  (define-key sql-mode-map (kbd "C-c C-f") 'sqlformat))

(provide 'sql-settings)
