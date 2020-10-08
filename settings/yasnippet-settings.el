(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1))

(use-package ivy-yasnippet
  :bind ("C-c y" . ivy-yasnippet)
  :after yasnippet)

(provide 'yasnippet-settings)
