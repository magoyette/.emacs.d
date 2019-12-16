(require 'use-package)

(use-package elfeed
  :ensure t
  :config
  (global-set-key (kbd "C-x w") 'elfeed)

  (setq-default elfeed-search-filter "@1-week-ago +unread "))

(provide 'elfeed-settings)
