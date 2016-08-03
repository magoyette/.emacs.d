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

  ;; Enable syntax highlighting of code blocks
  (setq org-src-fontify-natively t)

  ;; Disable security prompt before code evaluation
  (setq org-confirm-babel-evaluate nil)

  (setq org-todo-keywords
        '((sequence "TODO(t)" "READY(r)" "DOING(d)" "TOO_MUCH_WIP(w)" "|" "DONE(f)")))

  (setq org-todo-keyword-faces
        '(("TODO" . "#dfaf8f")
          ("READY" . "#93e0e3")
          ("DOING" . "#dc8cc3")
          ("TOO_MUCH_WIP" . "#CC9393")
          ("DONE" . "#dcdccc")))

  (setq org-agenda-files (list "~/org"))

  ;; Configure org babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((sql . t)
     (java . t))))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package helm-org-rifle
  :ensure t
  :bind (("C-c o b" . helm-org-rifle)
         ("C-c o d" . helm-org-rifle-directories))
  :config
  (setq helm-org-rifle-show-path t))

(provide 'org-settings)
