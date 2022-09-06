(add-hook 'dired-mode-hook 'auto-revert-mode)

(use-package all-the-icons)

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(setq dired-kill-when-opening-new-dired-buffer t)
(setq dired-auto-revert-buffer t)

(use-package wdired
  :config
  ;; Prompt when renaming files
  (setq wdired-use-interactive-rename t)

  ;; Use sizes in B, K, M and G
  (setq dired-listing-switches "-alh")

  (setq wdired-allow-to-change-permissions t))

(defhydra hydra-dired (:hint nil :color pink)
  "
_+_ mkdir          _m_ mark           _g_ refresh        _._ toggle hydra
_C_ copy           _U_ unmark all     _(_ details
_D_ delete         _u_ unmark         _s_ sort date/name Wdired
_R_ rename         _t_oggle           _j_ jump to file   C-x C-q : edit
_M_ chmod                                                C-c C-c : commit
_A_ regex find                                           C-c ESC : abort
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
  ("g" revert-buffer)
  ("(" dired-hide-details-mode)
  ("s" dired-sort-toggle-or-edit)
  ("j" dired-goto-file)
  ("q" nil)
  ("." nil :color blue))

(define-key dired-mode-map "." 'hydra-dired/body)

(provide 'dired-settings)
