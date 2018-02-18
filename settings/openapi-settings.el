(use-package flycheck-swagger-tools)

(use-package flycheck-swagger-cli)

;; Adapted from https://stackoverflow.com/questions/14275122/editing-markdown-pipe-tables-in-emacs
(defun transform-org-table-in-markdown-table ()
  "Transform an org table into a regular Markdown table."
  (save-excursion
    (goto-char (point-min))
    (while (search-forward "--+--" nil t) (replace-match "--|--"))))

(use-package openapi-yaml-mode
  :config
  (openapi-yaml-mode-add-to-magic-mode-alist)

  (add-hook 'openapi-yaml-mode-hook 'turn-on-orgtbl)

  (add-hook 'openapi-yaml-mode-hook
            (lambda()
              (add-hook 'after-save-hook 'transform-org-table-in-markdown-table
                        nil 'make-it-local))))

(provide 'openapi-settings)
