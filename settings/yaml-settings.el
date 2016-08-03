(use-package yaml-mode
  :ensure t
  :mode (("\\.yaml$" . yaml-mode)
         ("\\.yml$" . yaml-mode)
         ("\\.raml$" . yaml-mode)))

(provide 'yaml-settings)
