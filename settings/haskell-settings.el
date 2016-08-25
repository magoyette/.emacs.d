(use-package haskell-mode
  :ensure t
  :mode (("\\.hs$" . haskell-mode)
         ("\\.lhs$" . haskell-mode)))

(use-package intero
  :ensure t
  :after haskell-mode
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

(provide 'haskell-settings)
