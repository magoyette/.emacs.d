(require 'use-package)

;; Trash integration for Windows
(setq delete-by-moving-to-trash t)

(setq-default buffer-file-coding-system 'utf-8-unix)
(set-language-environment "UTF-8")

;; Insert spaces instead of tab on indent, use 4 spaces for a tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq require-final-newline t)

;; Sentence end with a single space
(setq sentence-end-double-space nil)

;; Workaround to insert a ` symbol
(global-set-key [S-dead-grave] "`")

(use-package whitespace
  :ensure t
  :diminish whitespace-mode
  :config
  (setq whitespace-style '(face tabs empty trailing))

  (add-hook 'prog-mode-hook #'whitespace-mode)
  (add-hook 'before-save-hook #'whitespace-cleanup))

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

(use-package typo
  :ensure t
  :config
  (typo-global-mode))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :bind (("C-x u" . undo-tree-visualize))
  :config
  (global-undo-tree-mode))

;; Auto indent on return
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Unique buffer names
(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward))

(use-package saveplace
  :config
  (save-place-mode))

(use-package move-text
  :ensure t
  :bind (("M-<up>" . move-text-up)
         ("M-<down>" . move-text-down)))

(use-package expand-region
  :ensure t
  :bind (("C-=" . er/expand-region)))

(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this))
  :config
  ;; Rebind to avoid conflict with avy
  (define-key mc/keymap (kbd "C-.") 'mc-hide-unmatched-lines-mode))

;; Only enabled in specific modes
(use-package highlight-indentation
  :ensure t)

(use-package whole-line-or-region
  :ensure t
  :diminish whole-line-or-region-local-mode
  :config
  (whole-line-or-region-mode 1))

;; Fix mark commands in transient mark mode
;; Source: https://www.masteringemacs.org/article/fixing-mark-commands-transient-mark-mode

(defun push-mark-no-activate ()
  "Pushes `point' to `mark-ring' and does not activate the region
Equivalent to \\[set-mark-command] when \\[transient-mark-mode] is disabled."
  (interactive)
  (push-mark (point) t nil)
  (message "Pushed mark to ring"))

(global-set-key (kbd "C-«") 'push-mark-no-activate)

(defun jump-to-mark ()
  "Jumps to the local mark, respecting the `mark-ring' order.
This is the same as using \\[set-mark-command] with the prefix argument."
  (interactive)
  (set-mark-command 1))

(global-set-key (kbd "M-«") 'jump-to-mark)

;; Override default exchange-point-and-mark-no-activate
(defun exchange-point-and-mark-no-activate ()
  "Identical to \\[exchange-point-and-mark] but will not activate the region."
  (interactive)
  (exchange-point-and-mark)
  (deactivate-mark nil))

(define-key global-map [remap exchange-point-and-mark]
  'exchange-point-and-mark-no-activate)

(use-package highlight-escape-sequences
  :ensure t
  :config
  (hes-mode))

;; Sources
;; http://endlessparentheses.com/the-toggle-map-and-wizardry.html
;; http://endlessparentheses.com/emacs-narrow-or-widen-dwim.html

(defun narrow-or-widen-dwim (p)
  "Widen if buffer is narrowed, narrow-dwim otherwise.
Dwim means: region, org-src-block, org-subtree, or
defun, whichever applies first. Narrowing to
org-src-block actually calls `org-edit-src-code'.

With prefix P, don't widen, just narrow even if buffer
is already narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning)
                           (region-end)))
        ((derived-mode-p 'org-mode)
         (cond ((ignore-errors (org-edit-src-code) t)
                (delete-other-windows))
               ((ignore-errors (org-narrow-to-block) t))
               (t (org-narrow-to-subtree))))
        ((derived-mode-p 'latex-mode)
         (LaTeX-narrow-to-environment))
        (t (narrow-to-defun))))

;; Replace Emacs narrowing keymap by narrow-or-widen-dwim
(define-key ctl-x-map "n" #'narrow-or-widen-dwim)
(add-hook 'LaTeX-mode-hook
          (lambda () (define-key LaTeX-mode-map "\C-x n" nil)))

(provide 'edition-settings)
