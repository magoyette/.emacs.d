(add-hook 'java-mode-hook
          (lambda ()
            (setq c-offsets-alist '((arglist-cont-nonempty . +)))))

(provide 'java-settings)
