(require 'use-package)

(use-package nov
  :ensure t
  :mode (("\\.epub\\'" . nov-mode)))

(provide 'epub-settings)
