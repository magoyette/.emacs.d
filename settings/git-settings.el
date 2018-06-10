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

(which-key-declare-prefixes "C-c g" "Git")

(use-package magit
  :ensure t
  :general
  ("C-c g g" '(magit-status :which-key "status")
   "C-c g b" '(magit-blame :which-key "blame")
   "C-c g f" '(magit-file-popup :which-key "file")
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

  (add-hook 'dired-mode-hook #'diff-hl-dired-mode))

(defun kill-magit-buffers ()
  "Prompt to kill each magit buffer."
  (interactive)
  (kill-matching-buffers "^\\*magit.*"))

(general-define-key
 :prefix "C-c"
 "g k" '(kill-magit-buffers :which-key "kill magit"))

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

  (general-define-key
   :prefix "C-c"
   "g n" '(diff-hl-next-hunk :which-key "next hunk")
   "g p" '(diff-hl-previous-hunk :which-key "previous hunk")))

(use-package git-timemachine
  :ensure t
  :general
  ("C-c g t" '(git-timemachine :which-key "timemachine")))

(require 'smerge-mode)

(define-key smerge-mode-map (kbd "C-c g s")
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

(which-key-add-major-mode-key-based-replacements 'smerge-mode "C-c g s" "smerge")

(provide 'git-settings)
