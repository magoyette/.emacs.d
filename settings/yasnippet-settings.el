(use-package yasnippet
  :diminish yas-minor-mode
  :init
  (which-key-add-key-based-replacements "C-c &" "yasnippet")
  :config
  (yas-global-mode 1))

(use-package ivy-yasnippet
  :bind ("C-c y" . ivy-yasnippet)
  :after yasnippet)

(provide 'yasnippet-settings)
