;; Line numbers activated only when going to a line
;; Source: whattheemacsd.com
(global-set-key [remap goto-line] 'goto-line-with-feedback)

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

(use-package deadgrep
  :ensure t
  :bind (("C-c s d" . deadgrep)))

(use-package visual-regexp
  :ensure t
  :general
  ("C-c s g" '(vr/replace :which-key "replace")
   "C-c s q" '(vr/replace :which-key "query-replace")
   "C-c s c" '(vr/mc-mark :which-key "select-multiple-cursors")))

(use-package dumb-jump
  :ensure t
  :bind (("M-s j" . dumb-jump-go)
         ("M-s b" . dumb-jump-back)
         ("M-s o" . dumb-jump-go-other-window)
         ("M-s q" . dumb-jump-quick-look)
         ("M-s x" . dumb-jump-go-prefer-external)
         ("M-s z" . dumb-jump-go-prefer-external-other-window))
  :config
  (setq dumb-jump-selector 'ivy)
  (setq dumb-jump-prefer-searcher 'rg))

(use-package projectile
  :ensure t
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  (setq projectile-enable-caching t)

  ;; Folders ignored globally
  (setq projectile-globally-ignored-directories
        (append projectile-globally-ignored-directories
                '("elpa" "target" "node_modules" ".svn" ".cache" "bower_components"
                  ".git" ".settings" "dist")))

  (setq projectile-completion-system 'ivy)

  (projectile-global-mode))

(use-package counsel-projectile
  :ensure t
  :after projectile
  :config
  (counsel-projectile-mode))

(provide 'navigation-search-settings)
