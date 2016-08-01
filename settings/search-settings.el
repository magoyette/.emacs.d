;; Use regex search by default (invert bindings)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Anzu displays the current match and the total matches for the current search
(use-package anzu
  :ensure t
  :config
  (global-anzu-mode)

  ;; Use query-replace and query-replace-regexp with anzu infos
  (global-set-key (kbd "M-%") 'anzu-query-replace)
  (global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp))

(provide 'search-settings)
