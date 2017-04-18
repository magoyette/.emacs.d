(add-hook 'dired-mode-hook 'auto-revert-mode)

(use-package all-the-icons-dired
  :ensure t
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

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

;; Dired quick sort doesn't work on Windows unless an external ls is used
;; https://www.gnu.org/software/emacs/manual/html_node/efaq-w32/Dired-ls.html
(if (not (eq system-type 'windows-nt))
    (use-package dired-quick-sort
      :ensure t
      :config
      (dired-quick-sort-setup)))

(use-package dired-narrow
  :ensure t
  :bind (:map dired-mode-map
              ("/" . dired-narrow)))

(provide 'dired-settings)
