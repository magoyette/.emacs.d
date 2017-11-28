;; Use regex search by default (invert bindings)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(setq search-default-mode #'char-fold-to-regexp)

(use-package dumb-jump
  :ensure t
  :bind (("M-s j" . dumb-jump-go)
         ("M-s b" . dumb-jump-back)
         ("M-s o" . dumb-jump-go-other-window)
         ("M-s q" . dumb-jump-quick-look)
         ("M-s x" . dumb-jump-go-prefer-external)
         ("M-s z" . dumb-jump-go-prefer-external-other-window))
  :config
  (setq dumb-jump-selector 'helm)
  (setq dumb-jump-prefer-searcher 'rg))

(provide 'search-settings)
