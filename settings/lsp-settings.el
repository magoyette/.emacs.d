(use-package lsp-mode
  :hook ((lsp-mode . lsp-enable-which-key-integration)
         (css-mode . lsp)
         (js-mode . lsp)
         (json-mode . lsp)
         (sass-mode . lsp)
         (sh-mode . lsp)
         (typescript-mode . lsp)
         (web-mode . lsp)
         (yaml-mode .lsp))
  :init
  (setq lsp-keymap-prefix "C-c l")
  (which-key-add-key-based-replacements "C-c l" "lsp")
  :commands lsp
  :config
  (setq lsp-completion-provider :capf)
  (lsp-modeline-code-actions-mode))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package lsp-treemacs
  :config
  (lsp-treemacs-sync-mode 1))

(provide 'lsp-settings)
