(require 'use-package)

;; pdf-tools is troublesome to install on Windows
(if (not (eq system-type 'windows-nt))
    (use-package pdf-tools
      :ensure t
      :config
      (pdf-tools-install)))

(provide 'pdf-settings)
