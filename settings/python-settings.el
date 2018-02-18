(use-package python-mode
  :mode (("\\.py$" . python-mode))
  :config
  (subword-mode 1)
  (eldoc-mode 1))

(use-package anaconda-mode
  :ensure t
  :after python
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode)))

(use-package company-anaconda
  :ensure t
  :after (anaconda-mode company)
  :config
  (add-to-list 'company-backends 'company-anaconda))

(provide 'python-settings)
