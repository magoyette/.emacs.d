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

(which-key-add-key-based-replacements "C-c s" "Search & Replace")

(use-package helm-swoop
  :ensure t
  :bind (("C-s" . helm-swoop)
         ("C-M-s" . helm-multi-swoop-all)
         ("C-c s w" . helm-multi-swoop-projectile))
  :config
  ;; Enable colors in results
  (setq helm-swoop-speed-or-color t)

  ;; Move up and down like isearch
  (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
  (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)

  ;; Disable pre-input
  (setq helm-swoop-pre-input-function (lambda () "")))

(use-package helm-ag
  :ensure t
  :bind (("C-c s r" . helm-do-ag)
         ("C-c s s" . helm-do-ag-project-root))
  :init
  (setq helm-follow-mode-persistent t)
  :config
  (custom-set-variables
   '(helm-ag-base-command "rg --no-heading")))

(use-package deadgrep
  :ensure t
  :bind (("C-c s d" . deadgrep)))

(use-package visual-regexp
  :ensure t
  :general
  ("C-c s g" '(vr/replace :which-key "replace")
   "C-c s q" '(vr/replace :which-key "query-replace")
   "C-c s c" '(vr/mc-mark :which-key "select-multiple-cursors")))

(use-package imenu-anywhere
  :ensure t
  :bind (("C-c s i" . imenu-anywhere)))

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

(use-package avy
  :ensure t
  :bind (("C-," . avy-goto-char)
         ("C-'" . avy-goto-char-2)))

(use-package ace-jump-helm-line
  :ensure t
  :after avy
  :config
  (define-key helm-map (kbd "C-,") 'ace-jump-helm-line))

(use-package projectile
  :ensure t
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  (setq projectile-indexing-method 'turbo-alien)
  (setq projectile-enable-caching t)

  ;; Folders ignored globally
  (setq projectile-globally-ignored-directories
        (append projectile-globally-ignored-directories
                '("elpa" "target" "node_modules" ".svn" ".cache" "bower_components"
                  ".git" ".settings" "dist")))

  (setq projectile-completion-system 'helm)

  (projectile-global-mode))

(use-package helm-projectile
  :ensure t
  :after projectile
  :config
  (helm-projectile-on))

(provide 'navigation-search-settings)
