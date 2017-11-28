(use-package clojure-mode
  :ensure t
  :mode (("\\.clj$" . clojure-mode))
  :init
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  :config
  (subword-mode))

(use-package cider
  :ensure t
  :after clojure-mode
  :commands (cider cider-connect cider-jack-in)
  :config
  (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode))

(use-package cider-eval-sexp-fu
  :ensure t
  :after cider)

(use-package clj-refactor
  :ensure t
  :after clojure-mode
  :init
  (add-hook 'clojure-mode-hook 'clj-refactor-mode)
  :config
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(provide 'clojure-settings)
