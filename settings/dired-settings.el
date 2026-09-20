;;; -*- lexical-binding: t; -*-

(use-package dired
  :ensure nil
  :hook (dired-mode . auto-revert-mode)
  :custom
  (dired-auto-revert-buffer t)
  (dired-kill-when-opening-new-dired-buffer t)
  (dired-listing-switches "-alh")
  :config
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

  (define-key dired-mode-map "." #'hydra-dired/body))

(use-package nerd-icons-dired
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package wdired
  :config
  ;; Prompt when renaming files
  (setq wdired-use-interactive-rename t)

  (setq wdired-allow-to-change-permissions t))

(provide 'dired-settings)
