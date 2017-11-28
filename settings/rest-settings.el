(use-package restclient
  :ensure t
  :mode (("\\.rest$" . restclient-mode))
  :defer t)

(use-package company-restclient
  :ensure t
  :after restclient
  :config
  (add-to-list 'company-backends 'company-restclient))

(provide 'rest-settings)
