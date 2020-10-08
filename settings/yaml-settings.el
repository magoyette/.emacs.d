(use-package yaml-mode
  :mode (("\\.yaml$" . yaml-mode)
         ("\\.yml$" . yaml-mode)
         ("\\.raml$" . yaml-mode))
  :config
  (setq highlight-indentation-offset 2)
  (add-hook 'yaml-mode-hook #'highlight-indentation-mode))

(use-package indent-tools
  :after yaml-mode
  :config
  (add-hook 'yaml-mode-hook
            (lambda ()
              (define-key yaml-mode-map (kbd "C-c >") 'indent-tools-hydra/body)))
  (setq indent-tools-indentation-of-yaml yaml-indent-offset))

(provide 'yaml-settings)
