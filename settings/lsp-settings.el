(which-key-add-key-based-replacements "C-c l" "lsp")

(setq lsp-keymap-prefix "C-c l")

(use-package lsp-mode
  :ensure t
  :hook ((lsp-mode . lsp-enable-which-key-integration)
         (css-mode . lsp)
         (js-mode . lsp)
         (json-mode . lsp)
         (sass-mode . lsp)
         (typescript-mode . lsp)
         (web-mode . lsp)
         (yaml-mode .lsp))
  :commands lsp
  :config
  (setq lsp-completion-provider :capf))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-treemacs
  :ensure t
  :config
  (lsp-treemacs-sync-mode 1))

(provide 'lsp-settings)
