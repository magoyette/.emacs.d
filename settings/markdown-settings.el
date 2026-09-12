;;; -*- lexical-binding: t; -*-

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  ;; `use-package' prepends these entries in reverse order, so keep the
  ;; README-specific matcher last to ensure it precedes the generic .md rule.
  :mode (("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'" . markdown-mode)
         ("README\\.md\\'" . gfm-mode))
  :config
  (setq markdown-command
        "pandoc --from markdown -t html5 -s")
  (setq markdown-list-indent-width 2)

  (setq markdown-fontify-code-blocks-natively t)

  (add-hook 'markdown-mode-hook #'prose-buffer-setup)

  ;; README files and explicitly selected `gfm-mode' buffers target GitHub's
  ;; Markdown dialect rather than Pandoc's manuscript-oriented dialect.
  (add-hook 'gfm-mode-hook
            (lambda ()
              (setq-local markdown-command
                          "pandoc --from gfm -t html5 -s"))))

(provide 'markdown-settings)
