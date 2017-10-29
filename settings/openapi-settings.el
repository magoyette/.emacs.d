(use-package flycheck-swagger-tools)

(use-package flycheck-swagger-cli)

(use-package openapi-yaml-mode
  :config
  (openapi-yaml-mode-add-to-magic-mode-alist)

  (add-hook 'openapi-yaml-mode-hook 'turn-on-orgtbl))

(provide 'openapi-settings)
