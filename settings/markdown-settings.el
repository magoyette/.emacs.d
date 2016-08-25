(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :config
  (setq markdown-command
        "pandoc --from markdown_github -t html5 -s")
  (setq markdown-list-indent-width 2))

(provide 'markdown-settings)
