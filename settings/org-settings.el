;;; -*- lexical-binding: t; -*-

(use-package org
  ;; Org is bundled with Emacs 31 (9.8.7); do not let
  ;; `use-package-always-ensure' pull a MELPA copy.
  :ensure nil
  :bind (("C-c o l" . org-store-link)
         ("C-c o c" . org-capture)
         ("C-c o a" . org-agenda)
         ("C-c o b" . org-switchb)
         ("C-c o I" . org-clock-in-last)
         ("C-c o o" . org-clock-out)
         ("C-c o H" . consult-org-agenda)
         :map org-mode-map
         ("C-c o i" . org-clock-in)
         ("C-c o C" . org-clock-cancel)
         ("C-c o g" . org-clock-goto)
         ("C-c o d" . org-clock-display)
         ("C-c o h" . consult-org-heading))
  :hook ((org-mode . visual-line-mode)
         (org-mode . visual-fill-column-mode))
  :init
  (which-key-add-key-based-replacements "C-c o" "org")
  :custom
  (org-todo-keywords
   '((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "WAIT(w)" "|" "DONE(d)")))
  ;; Named faces rather than `font-lock-*' inherits: those map onto doom-one
  ;; as blue/violet/magenta/grey/yellow, which leaves NEXT and STARTED
  ;; indistinguishable and WAIT the same grey as `org-headline-done'.
  ;; No explicit :weight bold either -- `doom-themes-enable-bold' is nil.
  (org-todo-keyword-faces
   '(("TODO"    . error)
     ("NEXT"    . warning)
     ("STARTED" . font-lock-keyword-face)
     ("WAIT"    . shadow)
     ("DONE"    . success)))
  ;; Do not change the color of DONE headings
  (org-fontify-done-headline nil)
  (org-agenda-window-setup 'current-window)
  ;; Allow M-RET to create a new item without splitting the current line
  (org-M-RET-may-split-line '((item . nil)))
  ;; Do not indent text below a headline
  (org-adapt-indentation nil)
  ;; Start with the headlines folded
  (org-startup-folded t)
  ;; Keep headings and text flush left; no virtual indentation per level
  (org-startup-indented nil)
  (org-return-follows-link t)
  (org-pretty-entities t)
  ;; Emphasis markers are hidden (see org-appear below), so refuse edits that
  ;; would silently land inside invisible text.
  (org-hide-emphasis-markers t)
  (org-catch-invisible-edits 'show-and-error)
  (org-image-actual-width '(600))
  ;; Language-aware curly quotes on export; `org-export-smart-quotes-alist'
  ;; has an "fr" entry, selected by "#+LANGUAGE: fr" in the document.
  (org-export-with-smart-quotes t)
  :config
  ;; Unbind org-cycle-agenda-files to prevent conflicts with avy
  (define-key org-mode-map (kbd "C-,") nil)
  (define-key org-mode-map (kbd "C-'") nil)

  (when (fboundp 'local-settings-set-org-agenda-files)
    (local-settings-set-org-agenda-files)))

;; Reveal emphasis markers when point enters the emphasized text. This is what
;; makes `org-hide-emphasis-markers' usable -- hiding them without it is the
;; configuration reverted in 786d37f (2018).
(use-package org-appear
  :hook (org-mode . org-appear-mode)
  :custom
  (org-appear-autoemphasis t)
  (org-appear-autolinks t))

(provide 'org-settings)
