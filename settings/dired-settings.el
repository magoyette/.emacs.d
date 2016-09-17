(use-package peep-dired
  :ensure t
  :bind (:map dired-mode-map
              ("P" . peep-dired)))

(provide 'dired-settings)
