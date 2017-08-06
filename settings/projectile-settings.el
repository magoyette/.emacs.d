(use-package projectile
  :ensure t
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
  :config
  (setq projectile-completion-system 'helm)
  (helm-projectile-on))

(global-set-key (kbd "C-x x") 'helm-projectile)

(defun neotree-project-dir ()
  "Open NeoTree using the projectile project root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "Could not find git project root."))))

(global-set-key (kbd "<f9>") 'neotree-project-dir)

(global-set-key
 (kbd "C-x M-x")
 (defhydra hydra-projectile (:color teal
                             :hint nil)
   "
    PROJECTILE: %(projectile-project-root)

    Find File            Search/NeoTree         Buffers                Cache
------------------------------------------------------------------------------------------
 _f_: file              _r_: ripgrep             _b_: switch to buffer    _c_: cache clear
 _p_: file in projets   _n_: NeoTree             _k_: kill all buffers    _x_: remove known project
 _d_: dir               _m_: multi-swoop                                _X_: cleanup non-existing
                                                                    ^^^^_z_: cache current

"
   ("r"   helm-ag-project-root)
   ("b"   helm-projectile-switch-to-buffer)
   ("c"   projectile-invalidate-cache)
   ("d"   helm-projectile-find-dir)
   ("f"   helm-projectile-find-file)
   ("n"   neotree-project-dir)
   ("p"   helm-projectile-find-file-in-known-projects)
   ("k"   projectile-kill-buffers)
   ("m"   helm-multi-swoop-projectile)
   ("s"   helm-projectile-switch-project "switch project")
   ("t"   terminal-here-project-launch "open external terminal")
   ("x"   projectile-remove-known-project)
   ("X"   projectile-cleanup-known-projects)
   ("z"   projectile-cache-current-file)
   ("q"   nil "cancel" :color blue)))

(provide 'projectile-settings)
