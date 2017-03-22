(use-package peep-dired
  :ensure t
  :bind (:map dired-mode-map
              ("P" . peep-dired)))

(use-package wdired
  :ensure t
  :config
  ;; Prompt when renaming files
  (setq wdired-use-interactive-rename t)

  ;; Use sizes in B, K, M and G
  (setq dired-listing-switches "-alh")

  (setq wdired-allow-to-change-permissions t))

(use-package dired-quick-sort
  :ensure t
  :config
  (dired-quick-sort-setup))

(provide 'dired-settings)
