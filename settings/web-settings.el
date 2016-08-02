;; Need lessc in path, see https://github.com/purcell/less-css-mode/blob/master/less-css-mode.el
(use-package less-css-mode
  :ensure t
  :mode (("\\.less$" . less-css-mode)))

;; Command line utility sass is required, http://sass-lang.com/. Make sure sass location is in emacs PATH, example:
;; https://github.com/antonj/scss-mode
(use-package scss-mode
  :ensure t
  :mode (("\\.scss$" . scss-mode)))

(use-package helm-css-scss
  :ensure t
  :config
  (dolist ($hook '(css-mode-hook scss-mode-hook less-css-mode-hook))
    (add-hook
     $hook (lambda ()
             (local-set-key (kbd "C-c c") 'helm-css-scss)))))

(use-package json-mode
  :ensure t
  :mode (("\\.json$" . json-mode)))

(use-package json-reformat
  :ensure t)

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

(provide 'web-settings)