(require 'use-package)

(use-package flycheck
  :diminish flycheck-mode
  :init
  (which-key-add-key-based-replacements "C-c !" "flycheck")
  :config
  (global-flycheck-mode)

  ;; Check the buffer after save or when flycheck-mode is enabled
  ;; Do not check the buffer when a new line is inserted or after an idle period
  ;; Checkers that are not lightweight like tsserver works better that way
  (setq flycheck-check-syntax-automatically '(save mode-enabled))

  ;; Configure the load path of my Emacs configuration
  (add-to-list 'flycheck-emacs-lisp-load-path "~/.emacs.d/settings/")
  (add-to-list 'flycheck-emacs-lisp-load-path "~/.emacs.d/features/")

  (setq-default flycheck-disabled-checkers '(sh-posix-bash)))

;; flycheck-pos-tip show flycheck markers in a pop-up
(use-package flycheck-pos-tip
  :after flycheck
  :config
  (flycheck-pos-tip-mode))

(use-package flycheck-package
  :after flycheck
  :config
  (flycheck-package-setup))

(use-package flycheck-relint
  :after flycheck
  :config
  (flycheck-relint-setup))

(provide 'flycheck-settings)
