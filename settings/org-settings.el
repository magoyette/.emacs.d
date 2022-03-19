(require 'use-package)

(use-package ob-restclient
  :after restclient)

(use-package org
  :mode (("\\.org$" . org-mode))
  :bind (("C-c o l" . org-store-link)
         ("C-c o c" . org-capture)
         ("C-c o a" . org-agenda)
         ("C-c o I" . org-clock-in-last)
         ("C-c o o" . org-clock-out))
  :init
  (which-key-add-key-based-replacements "C-c o" "org")
  (which-key-add-key-based-replacements "C-c t" "org clock")
  :config

  (add-hook 'org-mode-hook 'visual-line-mode)

  (define-key org-mode-map (kbd "C-c o i") 'org-clock-in)
  (define-key org-mode-map (kbd "C-c o C") 'org-clock-cancel)
  (define-key org-mode-map (kbd "C-c o g") 'org-clock-goto)
  (define-key org-mode-map (kbd "C-c o d") 'org-clock-display)

  ;; Unbind org-cycle-agenda to prevent conflicts with avy
  (define-key org-mode-map (kbd "C-,") nil)
  (define-key org-mode-map (kbd "C-'") nil)

  ;; Enable syntax highlighting of code blocks
  (setq org-src-fontify-natively t)

  ;; Disable security prompt before code evaluation
  (setq org-confirm-babel-evaluate nil)

  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "WAIT(w)" "|" "DONE(d)")))

  (setq org-todo-keyword-faces
        '(("TODO" (:inherit font-lock-negation-char-face :weight bold))
          ("NEXT" (:inherit font-lock-constant-face :weight bold))
          ("STARTED" (:inherit font-lock-builtin-face :weight bold))
          ("WAIT" (:inherit font-lock-comment-face :weight bold))
          ("DONE" (:inherit font-lock-type-face :weight bold))))

  (setq org-agenda-window-setup 'current-window)

  (when (fboundp 'local-settings-set-org-agenda-files)
    (local-settings-set-org-agenda-files))

  ;; Allow M-RET to create a new item without splitting the current line
  (setq org-M-RET-may-split-line '((item . nil)))

  ;; Do not indent text below a headline
  (setq org-adapt-indentation nil)

  ;; Start with the headlines folded
  (setq org-startup-folded t)

  ;; Do not change color of DONE headings
  (setq org-fontify-done-headline nil)

  ;; Configure org babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((sql . t)
     (java . t)
     (restclient . t))))

(use-package org-superstar
  :after org
  :config
  (setq org-hide-leading-stars t)
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

(use-package ace-link
  :after org
  :config
  (ace-link-setup-default)
  (define-key org-mode-map (kbd "M-O") 'ace-link-org))

(provide 'org-settings)
