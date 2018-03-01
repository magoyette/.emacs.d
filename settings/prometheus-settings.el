(use-package prometheus-v1-rules-mode
  :mode (("\\.rules$" . prometheus-v1-rules-mode))
  :init
  (add-to-list 'exec-path "~/gocode/bin/"))

(provide 'prometheus-settings)
