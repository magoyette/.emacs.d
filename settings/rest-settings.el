(use-package restclient
  :ensure t
  :defer t)

(use-package restclient-helm
  :ensure t
  :after restclient)

(use-package company-restclient
  :ensure t
  :after restclient
  :config
  (add-to-list 'company-backends 'company-restclient))

(provide 'rest-settings)
