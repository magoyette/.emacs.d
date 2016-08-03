;; apropos also search for noninteractive functions
(defvar apropos-do-all t)

(use-package helm-descbinds
  :ensure t
  :bind (("C-h b" . helm-descbinds))
  :config
  (helm-descbinds-mode))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode))

(provide 'help-settings)
