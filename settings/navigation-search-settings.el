;; Line numbers activated only when going to a line
;; Source: whattheemacsd.com
(global-set-key [remap goto-line] 'goto-line-with-feedback)

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (display-line-numbers-mode 1)
        (goto-line (read-number "Goto line: ")))
    (display-line-numbers-mode -1)))

(use-package deadgrep
  :bind (("C-c s d" . deadgrep)))

(use-package visual-regexp
  :general
  ("C-c s g" '(vr/replace :which-key "regex-replace")
   "C-c s q" '(vr/query-replace :which-key "regex-query-replace")
   "C-c s c" '(vr/mc-mark :which-key "regex-multiple-cursors")))

(global-set-key (kbd "C-c s r") 're-builder)

(use-package projectile
  :bind-keymap ("C-c p" . projectile-command-map)
  :init
  (which-key-add-key-based-replacements "C-c p" "projectile")
  :config
  (setq projectile-enable-caching t)

  ;; Folders ignored globally
  (setq projectile-globally-ignored-directories
        (append projectile-globally-ignored-directories
                '("elpa" "target" "node_modules" ".svn" ".cache" "bower_components"
                  ".git" ".settings" "dist")))

  (setq projectile-completion-system 'ivy)

  (projectile-mode 1))

(use-package counsel-projectile
  :after projectile
  :config
  (counsel-projectile-mode))

(provide 'navigation-search-settings)
