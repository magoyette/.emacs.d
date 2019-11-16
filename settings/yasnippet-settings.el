(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1))

(use-package ivy-yasnippet
  :ensure t
  :bind ("C-c y" . ivy-yasnippet)
  :after yasnippet)

(provide 'yasnippet-settings)
