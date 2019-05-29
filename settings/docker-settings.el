(use-package dockerfile-mode
  :ensure t
  :mode (("Dockerfile$" . dockerfile-mode)))

(use-package docker
  :ensure t
  :bind ("C-c D" . docker))

(use-package docker-tramp
  :ensure t
  :after docker)

(provide 'docker-settings)
