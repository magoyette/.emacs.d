(require 'use-package)

(which-key-add-key-based-replacements "C-c o" "Org")
(which-key-add-key-based-replacements "C-c t" "Org Clock")

(use-package ob-restclient
  :ensure t
  :after restclient)

(use-package org
  :ensure t
  :mode (("\\.org$" . org-mode))
  :bind (("C-c o l" . org-store-link)
         ("C-c o c" . org-capture)
         ("C-c o a" . org-agenda)
         ("C-c t l" . org-clock-in-last)
         ("C-c t o" . org-clock-out))
  :config

  (add-hook 'org-mode-hook 'visual-line-mode)

  (define-key org-mode-map (kbd "C-c t i") 'org-clock-in)
  (define-key org-mode-map (kbd "C-c t c") 'org-clock-cancel)
  (define-key org-mode-map (kbd "C-c t c") 'org-clock-goto)
  (define-key org-mode-map (kbd "C-c t c") 'org-clock-display)

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
        '(("TODO" . "#dfaf8f")
          ("NEXT" . "#93e0e3")
          ("STARTED" . "#dc8cc3")
          ("WAIT" . "#CC9393")
          ("DONE" . "#dcdccc")))

  (setq org-agenda-window-setup 'current-window)

  (when (fboundp 'local-settings-set-org-agenda-files)
    (local-settings-set-org-agenda-files))

  ;; Allow M-RET to create a new item without splitting the current line
  (setq org-M-RET-may-split-line '((item . nil)))

  ;; Configure org babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((sql . t)
     (java . t)
     (restclient . t))))

(use-package org-bullets
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package ace-link
  :ensure t
  :after org
  :config
  (ace-link-setup-default)
  (define-key org-mode-map (kbd "M-O") 'ace-link-org))

(provide 'org-settings)
