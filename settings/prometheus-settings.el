(use-package prometheus-rules-mode
  :mode (("\\.rules$" . prometheus-rules-mode))
  :init
  (add-to-list 'exec-path "~/gocode/bin/"))

(provide 'prometheus-settings)
