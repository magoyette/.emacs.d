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
  :bind (("C-c s d" . deadgrep)))

(use-package visual-regexp
  :general
  ("C-c s g" '(vr/replace :which-key "replace")
   "C-c s q" '(vr/replace :which-key "query-replace")
   "C-c s c" '(vr/mc-mark :which-key "select-multiple-cursors")))

(global-set-key (kbd "C-c s r") 're-builder)

(defhydra dumb-jump-hydra (:color blue :columns 3)
  "Dumb Jump"
  ("s" dumb-jump-go "Jump")
  ("w" dumb-jump-go-prompt "Prompt where to jump")
  ("c" dumb-jump-go-other-window "Jump in other window")
  ("e" dumb-jump-go-prefer-external "Jump (prefer external)")
  ("d" dumb-jump-go-prefer-external-other-window "Jump in other window (prefer external)")
  ("q" dumb-jump-quick-look "Quick look def at point")
  ("b" dumb-jump-back "Jump back"))

(use-package dumb-jump
  :bind (("M-s" . dumb-jump-hydra/body))
  :config
  (setq dumb-jump-selector 'ivy)
  (setq dumb-jump-prefer-searcher 'rg))

(use-package projectile
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
  :after projectile
  :config
  (counsel-projectile-mode))

(provide 'navigation-search-settings)
