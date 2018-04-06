(use-package smex
  :ensure t)

(use-package helm
  :ensure t
  :diminish helm-mode
  :bind (("C-x C-r" . helm-multi-files)
         ("C-x C-b" . helm-buffers-list)
         ("C-x C-f" . helm-find-files)
         ("C-x M-b" . helm-filtered-bookmarks)
         ("M-i" . helm-semantic-or-imenu)
         ("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring)
         ("C-c <SPC>" . helm-all-mark-rings)
         ("C-h a" . helm-apropos)
         ("C-h i" . helm-info-emacs)
         ("C-x 8" . helm-ucs)
         ("M-i" . helm-semantic-or-imenu)
         :map helm-map
         ("<tab>" . helm-execute-persistent-action)
         ("C-i" . helm-execute-persistent-action)
         ("C-z" . helm-select-action))
  :init
  (ido-mode -1)

  ;; apropos also search for noninteractive functions
  (defvar apropos-do-all t)
  :config
  (require 'helm-config)
  (helm-mode 1)
  (helm-autoresize-mode 1)

  (global-unset-key (kbd "C-x c"))

  (setq helm-split-window-in-side-p t
        helm-move-to-line-cycle-in-source t
        helm-ff-search-library-in-sexp t
        helm-scroll-amount 8
        helm-ff-file-name-history-use-recentf t
        helm-M-x-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t))

(use-package helm-descbinds
  :ensure t
  :bind (("C-h b" . helm-descbinds))
  :config
  (helm-descbinds-mode))

(provide 'helm-settings)
