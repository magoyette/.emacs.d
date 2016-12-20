(use-package dockerfile-mode
  :ensure t
  :mode (("Dockerfile$" . dockerfile-mode)))

(use-package docker
  :ensure t)

(use-package docker-tramp
  :ensure t)

(provide 'docker-settings)
