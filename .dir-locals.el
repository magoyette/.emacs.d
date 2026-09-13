((nil . ((eval . (progn
                   (require 'grep)
                   (setq-local
                    grep-find-ignored-directories
                    (cons "elpa"
                          (default-value
                           'grep-find-ignored-directories))))))))
