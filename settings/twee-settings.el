(use-package twee-chapbook-mode
  :mode (("\\.tw$" . twee-chapbook-mode)
         ("\\.twee$" . twee-chapbook-mode))
  :config
  (define-key twee-chapbook-mode-map (kbd "TAB") 'twee-chapbook-outline-toggle)
  (define-key twee-chapbook-mode-map (kbd "C-x n") 'twee-chapbook-narrow-to-subtree-or-widen)
  (define-key twee-chapbook-mode-map (kbd "M-<up>") 'outline-move-subtree-up)
  (define-key twee-chapbook-mode-map (kbd "M-<down>") 'outline-move-subtree-down)
  (define-key twee-chapbook-mode-map (kbd "C-c C-f") 'outline-forward-same-level)
  (define-key twee-chapbook-mode-map (kbd "C-c C-b") 'outline-backward-same-level))

(provide 'twee-settings)
