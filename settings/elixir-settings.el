(use-package elixir-mode
  :ensure t
  :mode (("\\.ex$" . elixir-mode)
         ("\\.exs$" . elixir-mode)))

(use-package alchemist
  :ensure t
  :after elixir-mode)

(provide 'elixir-settings)
