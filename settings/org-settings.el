(require 'use-package)

(which-key-declare-prefixes "C-c o" "Org")

(use-package org
  :ensure t
  :mode (("\\.org$" . org-mode))
  :bind (("C-c o l" . org-store-link)
         ("C-c o c" . org-capture)
         ("C-c o a" . org-agenda))
  :config

  (add-hook 'org-mode-hook 'visual-line-mode)

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

  (when (fboundp 'local-settings-set-org-agenda-files)
    (local-settings-set-org-agenda-files))

  ;; Allow M-RET to create a new item without splitting the current line
  (setq org-M-RET-may-split-line '((item . nil)))

  ;; Configure org babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((sql . t)
     (java . t))))

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
  (define-key org-mode-map (kbd "M-o") 'ace-link-org))

(provide 'org-settings)
