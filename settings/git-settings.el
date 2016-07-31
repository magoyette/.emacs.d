(require 'use-package)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x G" . magit-blame))
  :config
  (if (eq system-type 'windows-nt)
      (setenv "GIT_ASKPASS" "git-gui--askpass")))

(provide 'git-settings)
