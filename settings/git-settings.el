(require 'use-package)

(use-package gitattributes-mode
  :ensure t
  :mode (("\\.gitattributes$" . gitattributes-mode)))

(use-package gitconfig-mode
  :ensure t
  :mode (("\\.gitconfig$" . gitconfig-mode)))

(use-package gitignore-mode
  :ensure t
  :mode (("\\.gitignore$" . gitignore-mode)))

(which-key-add-key-based-replacements "C-c g" "Git")

(use-package magit
  :ensure t
  :general
  ("C-c g g" '(magit-status :which-key "status")
   "C-c g b" '(magit-blame :which-key "blame")
   "C-c g f" '(magit-file-popup :which-key "file")
   "C-c g c" '(magit-dispatch-popup :which-key "commands")
   "C-c g r" '(magit-list-repositories :which-key "repositories"))
  :config
  (if (eq system-type 'windows-nt)
      (setenv "GIT_ASKPASS" "git-gui--askpass"))

  ;; Display Git Submodules infos in Magit status
  (dolist (inserter '(magit-insert-modules-unpulled-from-upstream
                      magit-insert-modules-unpulled-from-pushremote
                      magit-insert-modules-unpushed-to-upstream
                      magit-insert-modules-unpushed-to-pushremote
                      magit-insert-modules-overview))
    (magit-add-section-hook
     'magit-status-sections-hook inserter
     'magit-insert-unpulled-from-upstream))

  (setq magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1)

  (setq magit-process-finish-apply-ansi-colors t)

  ;; Sort branches with more recent commits or tags at the top of the list
  (setq magit-list-refs-sortby "-creatordate")

  (add-hook 'dired-mode-hook #'diff-hl-dired-mode)

  ;; Source: https://manuel-uberti.github.io/emacs/2018/02/17/magit-bury-buffer/
  (defun mu-magit-kill-buffers ()
    "Restore window configuration and kill all Magit buffers."
    (interactive)
    (let ((buffers (magit-mode-get-buffers)))
      (magit-restore-window-configuration)
      (mapc #'kill-buffer buffers)))

  (bind-key "q" #'mu-magit-kill-buffers magit-status-mode-map))

(defun kill-magit-buffers ()
  "Prompt to kill each magit buffer."
  (interactive)
  (let ((buffers (magit-mode-get-buffers)))
    (magit-restore-window-configuration)
    (mapc #'kill-buffer buffers)))

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode-unless-remote)

  (general-define-key
   :prefix "C-c"
   "g n" '(diff-hl-next-hunk :which-key "next hunk")
   "g p" '(diff-hl-previous-hunk :which-key "previous hunk")))

(use-package git-timemachine
  :ensure t
  :general
  ("C-c g t" '(git-timemachine :which-key "timemachine")))

;; Source: https://github.com/alphapapa/unpackaged.el#smerge-mode
(use-package smerge-mode
  :after hydra
  :config
  (defhydra unpackaged/smerge-hydra
    (:color pink :hint nil :post (smerge-auto-leave))
    "
^Move^       ^Keep^               ^Diff^                 ^Other^
^^-----------^^-------------------^^---------------------^^-------
_n_ext       _b_ase               _<_: upper/base        _C_ombine
_p_rev       _u_pper              _=_: upper/lower       _r_esolve
^^           _l_ower              _>_: base/lower        _k_ill current
^^           _a_ll                _R_efine
^^           _RET_: current       _E_diff
"
    ("n" smerge-next)
    ("p" smerge-prev)
    ("b" smerge-keep-base)
    ("u" smerge-keep-upper)
    ("l" smerge-keep-lower)
    ("a" smerge-keep-all)
    ("RET" smerge-keep-current)
    ("\C-m" smerge-keep-current)
    ("<" smerge-diff-base-upper)
    ("=" smerge-diff-upper-lower)
    (">" smerge-diff-base-lower)
    ("R" smerge-refine)
    ("E" smerge-ediff)
    ("C" smerge-combine-with-next)
    ("r" smerge-resolve)
    ("k" smerge-kill-current)
    ("ZZ" (lambda ()
            (interactive)
            (save-buffer)
            (bury-buffer))
     "Save and bury buffer" :color blue)
    ("q" nil "cancel" :color blue))
  :hook (magit-diff-visit-file . (lambda ()
                                   (when smerge-mode
                                     (unpackaged/smerge-hydra/body)))))

(provide 'git-settings)
