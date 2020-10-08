(use-package dockerfile-mode
  :mode (("Dockerfile$" . dockerfile-mode)))

(use-package docker
  :bind ("C-c D" . docker))

(use-package docker-tramp
  :after docker)

(provide 'docker-settings)
