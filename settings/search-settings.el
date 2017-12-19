(use-package dumb-jump
  :ensure t
  :bind (("M-s j" . dumb-jump-go)
         ("M-s b" . dumb-jump-back)
         ("M-s o" . dumb-jump-go-other-window)
         ("M-s q" . dumb-jump-quick-look)
         ("M-s x" . dumb-jump-go-prefer-external)
         ("M-s z" . dumb-jump-go-prefer-external-other-window))
  :config
  (setq dumb-jump-selector 'ivy)
  (setq dumb-jump-prefer-searcher 'rg))

(use-package visual-regexp
  :ensure t
  :general
  ("C-c s g" '(vr/replace :which-key "replace")
   "C-c s s" '(vr/replace :which-key "query-replace")
   "C-c s c" '(vr/mc-mark :which-key "select-multiple-cursors")))

(provide 'search-settings)
