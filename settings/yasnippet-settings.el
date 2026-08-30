;;; -*- lexical-binding: t; -*-

(use-package yasnippet
  :diminish yas-minor-mode
  :bind ("C-c y" . yas-insert-snippet)
  :init
  (which-key-add-key-based-replacements "C-c &" "yasnippet")
  :config
  (yas-global-mode 1))

(provide 'yasnippet-settings)
