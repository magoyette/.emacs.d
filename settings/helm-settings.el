(require 'use-package)

;; Deactivate ido-mode, since Helm is used instead
(ido-mode -1)

(use-package helm
  :ensure t
  :diminish helm-mode
  :init
  (require 'helm-config)
  (helm-mode 1)
  (helm-autoresize-mode 1)
  (helm-push-mark-mode 1)
  :config
  (global-unset-key (kbd "C-x c"))
  
  (setq helm-split-window-in-side-p t
        helm-move-to-line-cycle-in-source t
        helm-ff-search-library-in-sexp t
        helm-scroll-amount 8
        helm-ff-file-name-history-use-recentf t
        helm-M-x-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t)
  
  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))
  :bind (("C-x C-b" . helm-mini)
         ("C-x b" . helm-buffers-list)
         ("C-x C-f" . helm-find-files)
         ("C-x C-r" . helm-recentf)
         ("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring)
         ("C-c <SPC>" . helm-all-mark-rings)
         ("C-x r b" . helm-filtered-bookmarks)
         ("C-h a" . helm-apropos)
         ("C-h i" . helm-info-emacs)
         ("C-c h" . helm-command-prefix)
         :map helm-map
         ("<tab>" . helm-execute-persistent-action)
         ("C-i" . helm-execute-persistent-action)
	 ("C-z" . helm-select-action)))

(provide 'helm-settings)
