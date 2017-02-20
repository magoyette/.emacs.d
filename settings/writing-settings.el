(use-package visual-fill-column
  :ensure t
  :bind (("C-c v" . visual-fill-column-mode))
  :init
  (setq-default fill-column 80)
  :config (setq-default visual-fill-column-center-text t
                        visual-fill-column-fringes-outside-margins nil))

(provide 'writing-settings)
