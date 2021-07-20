(setq css-indent-offset 2)
(setq js-indent-level 2)

(use-package sass-mode
  :mode (("\\.sass$" . sass-mode)))

(use-package json-mode
  :mode (("\\.json$" . json-mode))
  :config
  (setq js-indent-level 2))

(use-package typescript-mode
  :mode (("\\.ts$" . typescript-mode))
  :init
  (setq-default typescript-indent-level 2))

(use-package web-mode
  :mode (("\\.html?\\'" . web-mode)
         ("\\.[agj]sp\\'" . web-mode))
  :config
  ;; HTML indentation
  (setq web-mode-markup-indent-offset 2)

  ;; CSS identation
  (setq web-mode-css-indent-offset 2)

  ;; Programming languages indentation (JavaScript and others)
  (setq web-mode-code-indent-offset 2)

  (setq web-mode-enable-current-element-highlight t))

(use-package prettier
  :hook ((css-mode . prettier-mode)
         (js-mode . prettier-mode)
         (json-mode . prettier-mode)
         (markdown-mode . prettier-mode)
         (sass-mode . prettier-mode)
         (typescript-mode . prettier-mode)
         (web-mode . prettier-mode)
         (yaml-mode . prettier-mode)))

(provide 'web-settings)
