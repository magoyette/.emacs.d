(use-package twee-chapbook-mode
  :mode (("\\.tw$" . twee-chapbook-mode)
         ("\\.twee$" . twee-chapbook-mode)))

(use-package twee-mode
  :after twee-chapbook-mode
  :init
  (add-hook 'twee-chapbook-mode-hook 'twee-mode)
  :config
  (define-key twee-mode-map (kbd "M-<up>") 'outline-move-subtree-up)
  (define-key twee-mode-map (kbd "M-<down>") 'outline-move-subtree-down)
  (define-key twee-mode-map (kbd "C-c C-f") 'outline-forward-same-level)
  (define-key twee-mode-map (kbd "C-c C-b") 'outline-backward-same-level))

(provide 'twee-settings)
