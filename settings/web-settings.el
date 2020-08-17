(setq css-indent-offset 2)
(setq js-indent-level 2)

(use-package sass-mode
  :ensure t
  :mode (("\\.sass$" . sass-mode)))

(use-package json-mode
  :ensure t
  :mode (("\\.json$" . json-mode))
  :config
  (setq js-indent-level 2))

(use-package json-reformat
  :ensure t
  :after json-mode
  :config
  (setq json-reformat:indent-width 2))

(use-package js2-mode
  :ensure t
  :config
  (add-hook 'js-mode-hook 'js2-minor-mode)
  (add-to-list 'interpreter-mode-alist '("node" . js2-mode)))

(use-package js2-refactor
  :ensure t
  :after js2-mode
  :config
  (add-hook 'js2-mode-hook #'js2-refactor-mode))

(use-package typescript-mode
  :ensure t
  :mode (("\\.ts$" . typescript-mode))
  :init
  (setq-default typescript-indent-level 2))

(use-package web-mode
  :ensure t
  :mode (("\\.html?\\'" . web-mode)
         ("\\.[agj]sp\\'" . web-mode))
  :config
  ;; HTML indentation
  (setq web-mode-markup-indent-offset 2)

  ;; CSS identation
  (setq web-mode-css-indent-offset 2)

  ;; Programming languages indentation (JavaScript and others)
  (setq web-mode-code-indent-offset 2)

  ;; Highlight current HTML element (with a Zenburn color)
  (setq web-mode-enable-current-element-highlight t)
  (set-face-background 'web-mode-current-element-highlight-face "#2B2B2B"))

(use-package prettier-js
  :ensure t
  :config
  (add-hook 'js-mode-hook 'prettier-js-mode)
  (add-hook 'web-mode-hook 'prettier-js-mode))

(provide 'web-settings)
