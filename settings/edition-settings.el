;;; -*- lexical-binding: t; -*-

;; Trash integration for Windows
(setq delete-by-moving-to-trash t)

(setq-default buffer-file-coding-system 'utf-8-unix)
(set-language-environment "UTF-8")

;; Insert spaces instead of tab on indent, use 4 spaces for a tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq require-final-newline t)

;; Bundled since Emacs 30; applies .editorconfig on top of the defaults above
(use-package editorconfig
  :ensure nil
  :diminish editorconfig-mode
  :config
  (editorconfig-mode 1))

;; Sentence end with a single space
(setq sentence-end-double-space nil)

;; Workaround to insert a ` symbol
(global-set-key [S-dead-grave] "`")

;; Insert a typesetter's apostrophe
(global-set-key (kbd "M-,") "’")

(use-package whitespace
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

;; `xterm-extra-capabilities' defaults to `check': Emacs probes the terminal
;; with a DA query and only sends the modifyOtherKeys enable sequence
;; if the reply looks right. Forcing the list skips the probe and
;; sends it unconditionally.
(unless (display-graphic-p)
  (setq xterm-extra-capabilities '(modifyOtherKeys)))

;; Some terminal multiplexers only forward a chord like Ctrl+= to Emacs
;; if it has enabled the Kitty keyboard protocol.
;; xterm.el decodes Kitty/CSI-u input natively but never enables the
;; protocol itself, so kkp.el is needed to actually send the enable sequence.
(use-package kkp
  :hook (tty-setup . global-kkp-mode))

;; Undo redo
(when (fboundp 'winner-mode)
  (winner-mode 1))

(use-package undo-tree
  :diminish undo-tree-mode
  :bind (("C-x u" . undo-tree-visualize))
  :config
  (global-undo-tree-mode))

;; Auto indent on return
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Bracket and quote pairing in code buffers only
(add-hook 'prog-mode-hook #'electric-pair-local-mode)

;; Unique buffer names
(use-package uniquify
  :ensure nil
  :config
  (setq uniquify-buffer-name-style 'forward))

(use-package saveplace
  :config
  (save-place-mode))

(use-package move-text
  :bind (("M-<up>" . move-text-up)
         ("M-<down>" . move-text-down)))

(use-package expand-region
  :bind (("C-=" . er/expand-region)))

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C-c e l" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this))
  :config
  ;; Rebind to avoid conflict with avy
  (define-key mc/keymap (kbd "C-.") 'mc-hide-unmatched-lines-mode))

;; Only enabled in specific modes
(use-package highlight-indentation)

(use-package whole-line-or-region
  :diminish whole-line-or-region-local-mode
  :config
  (whole-line-or-region-global-mode 1))

;; Fix mark commands in transient mark mode
;; Source: https://www.masteringemacs.org/article/fixing-mark-commands-transient-mark-mode

(defun push-mark-no-activate ()
  "Pushes `point' to `mark-ring' and does not activate the region
Equivalent to \\[set-mark-command] when \\[transient-mark-mode] is disabled."
  (interactive)
  (push-mark (point) t nil)
  (message "Pushed mark to ring"))

(global-set-key (kbd "C-«") 'push-mark-no-activate)
(global-set-key (kbd "C-c e p") 'push-mark-no-activate)

(defun jump-to-mark ()
  "Jumps to the local mark, respecting the `mark-ring' order.
This is the same as using \\[set-mark-command] with the prefix argument."
  (interactive)
  (set-mark-command 1))

(global-set-key (kbd "M-«") 'jump-to-mark)
(global-set-key (kbd "C-c e j") 'jump-to-mark)

;; Override default exchange-point-and-mark-no-activate
(defun exchange-point-and-mark-no-activate ()
  "Identical to \\[exchange-point-and-mark] but will not activate the region."
  (interactive)
  (exchange-point-and-mark)
  (deactivate-mark nil))

(define-key global-map [remap exchange-point-and-mark]
  'exchange-point-and-mark-no-activate)

(use-package highlight-escape-sequences
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
