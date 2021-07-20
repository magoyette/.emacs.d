(add-hook 'dired-mode-hook 'auto-revert-mode)

(use-package all-the-icons)

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package peep-dired
  :bind (:map dired-mode-map
              ("P" . peep-dired)))

(use-package wdired
  :config
  ;; Prompt when renaming files
  (setq wdired-use-interactive-rename t)

  ;; Use sizes in B, K, M and G
  (setq dired-listing-switches "-alh")

  (setq wdired-allow-to-change-permissions t))

(use-package dired-narrow
  :bind (:map dired-mode-map
              ("/" . dired-narrow)))

(use-package dired-collapse
  :hook (dired-mode . dired-collapse-mode))

(use-package dired-subtree
  :bind (:map dired-mode-map
             ("i" . dired-subtree-insert)
             (";" . dired-subtree-remove)))

(defhydra hydra-dired (:hint nil :color pink)
  "
_+_ mkdir          _m_ mark           _g_ refresh        _._ toggle hydra
_C_ copy           _U_ unmark all     _(_ details
_D_ delete         _u_ unmark         _/_ narrow         Wdired
_R_ rename         _t_oggle           _s_ sort date/name C-x C-q : edit
_M_ chmod          _i_ insert subtree _j_ jump to file   C-c C-c : commit
_A_ regex find     _;_ remove subtree _P_ peep           C-c ESC : abort
_Q__regex replace
"
  ("+" dired-create-directory)
  ("C" dired-do-copy)
  ("D" dired-do-delete)
  ("R" dired-do-rename)
  ("M" dired-do-chmod)
  ("A" dired-do-find-regexp)
  ("Q" dired-do-find-regexp-and-replace)
  ("m" dired-mark)
  ("U" dired-unmark-all-marks)
  ("u" dired-unmark)
  ("t" dired-toggle-marks)
  ("i" dired-subtree-insert)
  (";" dired-subtree-remove)
  ("g" revert-buffer)
  ("(" dired-hide-details-mode)
  ("/" dired-narrow)
  ("s" dired-sort-toggle-or-edit)
  ("j" dired-goto-file)
  ("P" peep-dired)
  ("q" nil)
  ("." nil :color blue))

(define-key dired-mode-map "." 'hydra-dired/body)

(use-package treemacs
  :defer t
  :bind
  (:map global-map
        ("M-a" . treemacs-select-window)
        ("C-c t d" . treemacs-delete-other-windows)
        ("C-c t t" . treemacs)
        ("C-c t b" . treemacs-bookmark)
        ("C-c t f" . treemacs-find-file)
        ("C-c t T" . treemacs-find-tag)
        ("C-c t p" . treemacs-projectile))
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode t)

  (pcase (cons (not (null (executable-find "git")))
               (not (null treemacs-python-executable)))
    (`(t . t)
     (treemacs-git-mode 'deferred))
    (`(t . _)
     (treemacs-git-mode 'simple))))

(use-package treemacs-projectile
  :after treemacs projectile)

(use-package treemacs-magit
  :after treemacs magit)

(use-package treemacs-all-the-icons
  :after treemacs all-the-icons
  :config
  (treemacs-load-theme "all-the-icons"))

(provide 'dired-treemacs-settings)
