(add-hook 'dired-mode-hook 'auto-revert-mode)

(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :ensure t
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package peep-dired
  :ensure t
  :bind (:map dired-mode-map
              ("P" . peep-dired)))

(use-package wdired
  :ensure t
  :config
  ;; Prompt when renaming files
  (setq wdired-use-interactive-rename t)

  ;; Use sizes in B, K, M and G
  (setq dired-listing-switches "-alh")

  (setq wdired-allow-to-change-permissions t))

(use-package dired-narrow
  :ensure t
  :bind (:map dired-mode-map
              ("/" . dired-narrow)))

(use-package dired-collapse
  :ensure t
  :config
  (add-hook 'dired-mode-hook 'dired-collapse-mode))

(use-package dired-subtree
  :ensure t
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

(use-package neotree
  :ensure t
  :bind (("<f8>" . neotree-toggle))
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-window-fixed-size nil)
  (setq neo-mode-line-type 'default)
  (setq neo-window-width 35))

(defun neotree-project-dir ()
  "Open NeoTree using the projectile project root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "Could not find git project root."))))

(global-set-key (kbd "<f9>") 'neotree-project-dir)

(provide 'dired-neotree-settings)
