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
         ("C-x G" . magit-blame))
  :config
  (if (eq system-type 'windows-nt)
      (setenv "GIT_ASKPASS" "git-gui--askpass"))

  (setq magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1))

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

(provide 'git-settings)
