(use-package yaml-mode
  :ensure t
  :mode (("\\.yaml$" . yaml-mode)
         ("\\.yml$" . yaml-mode)
         ("\\.raml$" . yaml-mode))
  :config
  (add-hook 'yaml-mode-hook #'highlight-indentation-mode))

(provide 'yaml-settings)
