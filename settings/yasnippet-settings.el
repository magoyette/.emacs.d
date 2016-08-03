(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "C-<tab>") 'yas-expand)
  (define-key yas-minor-mode-map (kbd "S-<tab>") 'yas-insert-snippet))

(provide 'yasnippet-settings)
