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

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x G" . magit-blame)
         ("C-x M-g" . magit-list-repositories))
  :config
  (if (eq system-type 'windows-nt)
      (setenv "GIT_ASKPASS" "git-gui--askpass"))

  ;; Display Git Submodules infos in Magit status
  (dolist (inserter '(magit-insert-modules-unpulled-from-upstream
                      magit-insert-modules-unpulled-from-pushremote
                      magit-insert-modules-unpushed-to-upstream
                      magit-insert-modules-unpushed-to-pushremote
                      magit-insert-submodules))
    (magit-add-section-hook
     'magit-status-sections-hook inserter
     'magit-insert-unpulled-from-upstream))

  (setq magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1)

  ;; Sort branches with more recent commits or tags at the top of the list
  (setq magit-list-refs-sortby "-creatordate"))

(defun kill-magit-buffers ()
  (interactive)
  (kill-matching-buffers "^\\*magit.*"))

(global-set-key (kbd "C-x M-d") 'kill-magit-buffers)

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(use-package git-timemachine
  :ensure t
  :bind (("C-x t" . git-timemachine)))

(require 'smerge-mode)

(define-key smerge-mode-map (kbd "C-c s")
  (defhydra hydra-smerge ()
    "
^Resolve conflict^                   ^Navigate^
------------------------------------------------
_m_: keep my version                 _n_: go to next conflict
_o_: keep other version              _p_: go to previous conflict
_b_: keep base version
_a_: keep all 3 versions
_c_: keep current version (at point)
"
    ("n" smerge-next)
    ("p" smerge-prev)
    ("m" smerge-keep-mine :color blue)
    ("o" smerge-keep-other :color blue)
    ("b" smerge-keep-base :color blue)
    ("a" smerge-keep-all :color blue)
    ("c" smerge-keep-current :color blue)))

(use-package browse-at-remote
  :ensure t
  :bind (("C-c g g" . browse-at-remote)))

(provide 'git-settings)
