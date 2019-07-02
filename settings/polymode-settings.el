(use-package polymode
  :ensure t
  :config
  (define-hostmode poly-markdown-hostmode
    :mode 'markdown-mode)

  (define-innermode poly-markdown-edn-metadata-header-innermode
    :mode 'clojure-mode
    :head-matcher "\\`---\n"
    :tail-matcher "[^\\`]---\n"
    :head-mode 'host
    :tail-mode 'host)

  ;; This polymode is used for the markdown documents of my personal web site
  ;; (https://github.com/magoyette/magoyette.github.io),
  ;;  which contains EDN (https://github.com/edn-format/edn) metadata headers.
  (define-polymode poly-markdown-edn-metadata-mode
    :hostmode 'poly-markdown-hostmode
    :innermodes '(poly-markdown-edn-metadata-header-innermode))

  (add-to-list 'auto-mode-alist
               '(".*marcandregoyette\\.com/resources/.*\\.md\\'"
                 . poly-markdown-edn-metadata-mode)))

(provide 'polymode-settings)
