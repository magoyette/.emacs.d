(use-package restclient
  :mode (("\\.rest$" . restclient-mode))
  :defer t)

(use-package company-restclient
  :after restclient
  :config
  (add-to-list 'company-backends 'company-restclient))

(provide 'rest-settings)
