(use-package less-css-mode
  :ensure t
  :mode (("\\.less$" . less-css-mode)))

(use-package sass-mode
  :ensure t
  :mode (("\\.sass$" . sass-mode)))

(use-package helm-css-scss
  :ensure t
  :after (:any css-mode less-css-mode sass-mode)
  :init
  (dolist ($hook '(css-mode-hook scss-mode-hook less-css-mode-hook))
    (add-hook
     $hook (lambda ()
             (local-set-key (kbd "C-c M-c") 'helm-css-scss)))))

(use-package json-mode
  :ensure t
  :mode (("\\.json$" . json-mode))
  :config
  (setq js-indent-level 2))

(use-package json-reformat
  :ensure t
  :mode (("\\.json$" . json-mode))
  :config
  (setq json-reformat:indent-width 2))

(use-package js2-mode
  :ensure t
  :mode (("\\.js$" . js2-mode))
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'interpreter-mode-alist '("node" . js2-mode)))

(use-package js2-refactor
  :ensure t
  :mode (("\\.js$" . js2-mode))
  :config
  (add-hook 'js2-mode-hook #'js2-refactor-mode))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (eldoc-mode +1))

(use-package typescript-mode
  :ensure t
  :mode (("\\.ts$" . typescript-mode))
  :init
  (setq-default typescript-indent-level 2)
  :config
  (add-hook 'typescript-mode-hook #'setup-tide-mode))

(use-package tide
  :ensure t
  :config
  (add-hook 'js2-mode-hook #'setup-tide-mode))

(use-package web-mode
  :ensure t
  :mode (("\\.html?\\'" . web-mode)
         ("\\.[agj]sp\\'" . web-mode)
         ("\\.[jt]sx\\'" . web-mode))
  :config
  ;; HTML indentation
  (setq web-mode-markup-indent-offset 2)

  ;; CSS identation
  (setq web-mode-css-indent-offset 2)

  ;; Programming languages indentation (JavaScript and others)
  (setq web-mode-code-indent-offset 2)

  ;; Highlight current HTML element (with a Zenburn color)
  (setq web-mode-enable-current-element-highlight t)
  (set-face-background 'web-mode-current-element-highlight-face "#2B2B2B")

  ;; Enable tide in web-mode for jsx and tsx support
  (when (string-match "[jt]sx"
                      (file-name-extension buffer-file-name))
    (setup-tide-mode)))

(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode))

(provide 'web-settings)
