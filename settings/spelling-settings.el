(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'org-mode-hook 'turn-on-flyspell)
(add-hook 'markdown-mode-hook 'turn-on-flyspell)

(setq ispell-program-name "hunspell")

(use-package flyspell-correct-helm
  :ensure t
  :config
  (define-key flyspell-mode-map (kbd "C-;")
    'flyspell-correct-previous-word-generic))

(provide 'spelling-settings)
