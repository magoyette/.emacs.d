(use-package prometheus-rules-mode
  :mode (("\\.rules$" . prometheus-rules-mode))
  :init
  (add-to-list 'exec-path "~/gocode/bin/"))
;; (setq flycheck-promtool-rules-executable "/home/magoyette/gocode/bin/promtool")

(provide 'prometheus-settings)
