;;; -*- lexical-binding: t; -*-

;; Two views for Markdown files: `markdown-mode' edits the source for
;; writing, `markdown-modern-mode' renders it inline for reading.  The
;; command below switches between them; `normal-mode' on the way back
;; honors the auto-mode-alist routing that sends README files to
;; `gfm-mode'.  It is bound to C-c C-m in both major modes.
(defun markdown-settings-toggle-view ()
  "Switch this Markdown buffer between the writing and reading views.
Enable `markdown-modern-mode' when the buffer is in `markdown-mode' or
`gfm-mode'.  Otherwise, when the buffer is in `markdown-modern-mode',
return to the source-editing major mode chosen for this file."
  (interactive)
  (cond
   ((derived-mode-p 'markdown-mode) (markdown-modern-mode))
   ((derived-mode-p 'markdown-modern-mode) (normal-mode))
   (t (user-error "Not in a Markdown buffer"))))

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
                          "pandoc --from gfm -t html5 -s")))

  ;; Switch this buffer to the rendered reading view of markdown-modern.
  (keymap-set markdown-mode-map "C-c C-m" #'markdown-settings-toggle-view))

;; markdown-modern renders styled Markdown inline in. It is its own
;; major mode derived from `text-mode', not an extension of markdown-mode.
;; This mode is enabled per buffer, mostly for reading, with
;; M-x markdown-modern-mode. It is not on MELPA: update it with
;; M-x package-vc-upgrade. Tree-sitter drives all parsing; the `markdown'
;; and `markdown-inline' grammars it needs ship in the treesit-langs
;; bundle (settings/programming-settings.el). hl-todo highlights do not
;; apply in its buffers: the mode disables font-lock.
(use-package markdown-modern
  :vc (:url "https://github.com/rjprins/markdown-modern"
       :lisp-dir "lisp"
       :rev :newest)
  :commands markdown-modern-mode
  :config
  ;; `prose-buffer-setup' is not hooked here: the mode manages its own
  ;; display (variable-pitch, visual line wrapping, left margin).
  (general-define-key
   :keymaps 'markdown-modern-mode-map
   "C-c C-m" '(markdown-settings-toggle-view :which-key "markdown-mode")))

(provide 'markdown-settings)
