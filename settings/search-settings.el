;; Use regex search by default (invert bindings)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(setq search-default-mode #'char-fold-to-regexp)

;; Anzu displays the current match and the total matches for the current search
(use-package anzu
  :ensure t
  :diminish anzu-mode
  :bind (("M-%" . anzu-query-replace)
         ("C-M-%" . anzu-query-replace-regexp))
  :config
  (global-anzu-mode))

(use-package helm-swoop
  :ensure t
  :bind (("M-s s" . helm-swoop)
         ("M-s S" . helm-multi-swoop-all)
         ("M-s M-s" . helm-multi-swoop-projectile))
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
  :bind (("M-s d" . helm-do-ag)
         ("M-s p" . helm-do-ag-project-root))
  :config
  (custom-set-variables
   '(helm-ag-base-command "rg --no-heading")))

(use-package dumb-jump
  :ensure t
  :bind (("M-s j" . dumb-jump-go)
         ("M-s b" . dumb-jump-back)
         ("M-s o" . dumb-jump-go-other-window)
         ("M-s q" . dumb-jump-quick-look)
         ("M-s x" . dumb-jump-go-prefer-external)
         ("M-s z" . dumb-jump-go-prefer-external-other-window))
  :config
  (setq dumb-jump-selector 'helm)
  (setq dumb-jump-prefer-searcher 'rg))

(provide 'search-settings)
