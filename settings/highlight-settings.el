(use-package highlight-escape-sequences
  :ensure t
  :config
  (hes-mode))

;; Enable links in comments and strings
(add-hook 'prog-mode-hook 'goto-address-prog-mode)

(provide 'highlight-settings)
