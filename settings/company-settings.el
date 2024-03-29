(require 'use-package)

(use-package company
  :diminish company-mode
  :config
  ;; Case-sensitive completion
  (defvar company-dabbrev-ignore-case nil)

  ;; Keep case when completing words
  (defvar company-dabbrev-downcase nil)

  ;; Enable completion inside comments and strings for these modes
  (setq company-etags-everywhere '(php-mode html-mode web-mode nxml-mode))

  ;; Settings for lsp
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0)

  (define-key company-mode-map (kbd "C-c f") 'company-files)

  (global-company-mode))

(use-package company-box
  :hook (company-mode . company-box-mode))

(provide 'company-settings)
