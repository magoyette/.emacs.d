;; Use regex search by default (invert bindings)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Anzu displays the current match and the total matches for the current search
(use-package anzu
  :ensure t
  :diminish anzu-mode
  :config
  (global-anzu-mode)

  ;; Use query-replace and query-replace-regexp with anzu infos
  (global-set-key (kbd "M-%") 'anzu-query-replace)
  (global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp))

(use-package helm-swoop
  :ensure t
  :bind
  (("M-i" . helm-swoop)
   ("C-c M-i" . helm-multi-swoop)
   ("C-x M-i" . helm-multi-swoop-all))
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
   '(helm-ag-base-command "pt -e --nocolor --nogroup")))

(provide 'search-settings)
