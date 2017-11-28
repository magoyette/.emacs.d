(require 'use-package)

(use-package org
  :ensure t
  :diminish visual-line-mode
  :mode (("\\.org$" . org-mode))
  :bind (("C-c l" . org-store-link)
         ("C-c c" . org-capture)
         ("C-c a" . org-agenda))
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
        '((sequence "TODO(t)" "READY(r)" "DOING(d)" "WAITING(w)" "BLOCKED(b)" "|" "DONE(f)")))

  (setq org-todo-keyword-faces
        '(("TODO" . "#dfaf8f")
          ("READY" . "#93e0e3")
          ("DOING" . "#dc8cc3")
          ("WAITING" . "#CC9393")
          ("BLOCKED" . "#CC9393")
          ("DONE" . "#dcdccc")))

  (when (fboundp 'local-settings-set-org-agenda-files)
    (local-settings-set-org-agenda-files))

  ;; Configure org babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((sql . t)
     (java . t))))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package ace-link
  :ensure t
  :config
  (ace-link-setup-default)
  (define-key org-mode-map (kbd "M-o") 'ace-link-org))

(provide 'org-settings)
