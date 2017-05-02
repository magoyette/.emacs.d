(require 'use-package)

;; Trash integration for Windows
(setq delete-by-moving-to-trash t)

(setq-default buffer-file-coding-system 'utf-8-unix)
(set-language-environment "UTF-8")

;; Insert spaces instead of tab on indent, use 4 spaces for a tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq require-final-newline t)

(use-package whitespace
  :ensure t
  :diminish whitespace-mode
  :config
  (setq whitespace-line-column 80) ;; limit line length
  (setq whitespace-style '(face tabs empty trailing lines-tail))

  (add-hook 'prog-mode-hook #'whitespace-mode)
  (add-hook 'before-save-hook #'whitespace-cleanup))

;; Backup files in a single backups folder
;; Source: http://whattheemacsd.com/
(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat user-emacs-directory "backups")))))

;; Backup files that are in source control
(setq vc-make-backup-files t)

;; Kill and yank more similar to copy and paste
(setq select-enable-clipboard t
      select-enable-primary t
      save-interprogram-paste-before-kill t
      mouse-yank-at-point t)

;; Undo redo
(when (fboundp 'winner-mode)
  (winner-mode 1))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :bind (("C-x u" . undo-tree-visualize))
  :config
  (global-undo-tree-mode))

;; Auto indent on return
(define-key global-map (kbd "RET") 'newline-and-indent)

(use-package aggressive-indent
  :ensure t
  :diminish aggressive-indent-mode
  :config
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode))

;; Unique buffer names
(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward))

;; Save last position in killed buffers
;; Source: http://whattheemacsd.com/
(use-package saveplace
  :config
  (save-place-mode)
  (setq-default save-place-file (expand-file-name ".places"
                                                  user-emacs-directory)))

(use-package move-text
  :ensure t
  :config
  (move-text-default-bindings))

(use-package expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)))

(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

;; Only enabled in specific modes
(use-package highlight-indentation
  :ensure t)

(use-package whole-line-or-region
  :ensure t
  :diminish whole-line-or-region-mode
  :config
  (whole-line-or-region-mode 1))

(provide 'edition-settings)
