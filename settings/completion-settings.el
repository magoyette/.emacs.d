;;; -*- lexical-binding: t; -*-

(use-package corfu
  :init
  (setq corfu-auto t
        corfu-auto-prefix 1
        corfu-auto-delay 0.2
        corfu-cycle t
        corfu-quit-no-match 'separator)
  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-popupinfo-mode))

(use-package nerd-icons-corfu
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package cape
  :bind (("C-c f" . cape-file))
  :init
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-dabbrev))

;; TAB completes if the line is already indented
(setq tab-always-indent 'complete)

;; Case-sensitive dabbrev completion
(setq dabbrev-case-fold-search nil
      dabbrev-case-replace nil)

;; Use orderless in lsp-mode completions
(defun completion-settings-lsp-capf ()
  (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
        '(orderless)))
(add-hook 'lsp-completion-mode-hook #'completion-settings-lsp-capf)

(provide 'completion-settings)
