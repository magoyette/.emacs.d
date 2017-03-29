(require 'use-package)

(use-package flycheck
  :ensure t
  :defer 2
  :diminish flycheck-mode
  :config
  (global-flycheck-mode)

  ;; Check the buffer after save or when flycheck-mode is enabled
  ;; Do not check the buffer when a new line is inserted or after an idle period
  ;; Checkers that are not lightweight like tsserver works better that way
  (setq flycheck-check-syntax-automatically '(save mode-enabled))

  ;; Configure the load path of my Emacs configuration
  (add-to-list 'flycheck-emacs-lisp-load-path "~/.emacs.d/settings/")
  (add-to-list 'flycheck-emacs-lisp-load-path "~/.emacs.d/features/"))

;; flycheck-pos-tip show flycheck markers in a pop-up
(use-package flycheck-pos-tip
  :ensure t
  :after flycheck
  :config
  (flycheck-pos-tip-mode))

(provide 'flycheck-settings)
