(use-package company
  :ensure t
  :diminish company-mode
  :config
  ;; Case-sensitive completion
  (defvar company-dabbrev-ignore-case nil)

  ;; Keep case when completing words
  (defvar company-dabbrev-downcase nil)

  ;; Enable completion inside comments and strings for these modes
  (setq company-etags-everywhere '(php-mode html-mode web-mode nxml-mode))

  (global-company-mode))

(use-package helm-company
  :ensure t
  :commands helm-company
  :config
  (eval-after-load 'company
    '(progn
       (define-key company-mode-map (kbd "C-:") 'helm-company)
       (define-key company-active-map (kbd "C-:") 'helm-company))))

(provide 'company-settings)
