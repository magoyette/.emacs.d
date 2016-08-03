(require 'use-package)

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)

  ;; Check the buffer after save or when flycheck-mode is enabled
  ;; Do not check the buffer when a new line is inserted or after an idle period
  ;; Checkers that are not lightweight like tsserver works better that way
  (setq flycheck-check-syntax-automatically '(save mode-enabled))

  ;; Configure the load path of my Emacs configuration
  (add-to-list 'flycheck-emacs-lisp-load-path "~/.emacs.d/settings/")

  ;; Disabled checkers
  ;; emacs-lisp-checkdoc is for Emacs Lisp documentation conventions
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

;; flycheck-pos-tip show flycheck markers in a pop-up
(use-package flycheck-pos-tip
  :ensure t
  :after flycheck
  :config
  (flycheck-pos-tip-mode))

(use-package helm-flycheck
  :ensure t
  :after flycheck
  :config
  (define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))

(provide 'flycheck-settings)
