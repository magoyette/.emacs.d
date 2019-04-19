(which-key-declare-prefixes "C-c l" "lsp")

(use-package lsp-mode
  :ensure t
  :bind (("C-c l D" . lsp-describe-session)
         ("C-c l d" . lsp-describe-thing-at-point)
         ("C-c l a" . lsp-execute-code-action)
         ("C-c l f" . lsp-format-buffer)
         ("C-c l i" . lsp-goto-implementation)
         ("C-c l t" . lsp-goto-type-definition)
         ("C-c l r" . lsp-rename)
         ("C-c l h" . lsp-symbol-highlight)
         ("C-c l w" . lsp-restart-workspace)
         ("C-c l F a" . lsp-workspace-folders-add)
         ("C-c l F r" . lsp-workspace-folders-remove)
         ("C-c l F s" . lsp-workspace-folders-switch)
         ("C-c l r" . lsp-find-references)
         ("C-c l R" . lsp-find-definition)
         ("C-c l l s" . lsp-lens-show)
         ("C-c l l h" . lsp-lens-hide))
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company-lsp
  :ensure t
  :commands company-lsp)

(provide 'lsp-settings)
