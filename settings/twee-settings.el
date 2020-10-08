(use-package twee-chapbook-mode
  :ensure nil
  :mode (("\\.tw$" . twee-chapbook-mode)
         ("\\.twee$" . twee-chapbook-mode)))

(use-package twee-mode
  :ensure nil
  :after twee-chapbook-mode
  :hook (twee-chapbook-mode . twee-mode)
  :config
  (define-key twee-mode-map (kbd "M-<up>") 'outline-move-subtree-up)
  (define-key twee-mode-map (kbd "M-<down>") 'outline-move-subtree-down)
  (define-key twee-mode-map (kbd "C-c C-f") 'outline-forward-same-level)
  (define-key twee-mode-map (kbd "C-c C-b") 'outline-backward-same-level))

(provide 'twee-settings)
