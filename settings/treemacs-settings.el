(use-package treemacs
  :defer t
  :bind
  (:map global-map
        ("M-a" . treemacs-select-window)
        ("C-c t d" . treemacs-delete-other-windows)
        ("C-c t t" . treemacs)
        ("C-c t b" . treemacs-bookmark)
        ("C-c t f" . treemacs-find-file)
        ("C-c t T" . treemacs-find-tag)
        ("C-c t p" . treemacs-projectile)
        ("C-c t e" . treemacs-edit-workspaces)))

(use-package treemacs-projectile
  :after treemacs projectile)

(use-package treemacs-magit
  :after treemacs magit)

(use-package treemacs-all-the-icons
  :after treemacs all-the-icons
  :config
  (treemacs-load-theme "all-the-icons"))

(provide 'treemacs-settings)
