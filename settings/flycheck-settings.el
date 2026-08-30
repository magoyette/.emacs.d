;;; -*- lexical-binding: t; -*-

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

  (setq-default flycheck-disabled-checkers '(sh-posix-bash
                                             emacs-lisp-checkdoc
                                             json-python-json))

  ;; The built-in markdown-markdownlint-cli2 checker only looks for
  ;; .markdownlint-cli2.* config files.
  (setq-default flycheck-markdown-markdownlint-cli2-config
                '(".markdownlint-cli2.jsonc"
                  ".markdownlint-cli2.json"
                  ".markdownlint-cli2.yaml"
                  ".markdownlint.jsonc"
                  ".markdownlint.json"
                  ".markdownlint.yaml"
                  ".markdownlint.yml"))

  (global-flycheck-annotate-mode))

(use-package flycheck-package
  :after flycheck
  :config
  (flycheck-package-setup))

(use-package flycheck-relint
  :after flycheck
  :config
  (flycheck-relint-setup))

(provide 'flycheck-settings)
