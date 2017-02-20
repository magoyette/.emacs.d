(use-package projectile
  :ensure t
  :demand t  ;; projectile is necessary at startup for the dashboard
  :bind ("C-c p" . projectile-command-map)
  :config
  (setq projectile-indexing-method 'alien)
  (setq projectile-enable-caching t)

  ;; Folders ignored globally
  (setq projectile-globally-ignored-directories
        (append projectile-globally-ignored-directories
                '("elpa" "target" "node_modules" ".svn" ".cache" "bower_components"
                  ".git" ".settings" "dist")))

  (projectile-global-mode))

(use-package helm-projectile
  :ensure t
  :after projectile
  :config
  (setq projectile-completion-system 'helm)
  (helm-projectile-on))

(provide 'projectile-settings)
