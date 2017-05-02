(use-package terminal-here
  :ensure t
  :config
  (global-set-key (kbd "C-<f5>") #'terminal-here-launch)
  (global-set-key (kbd "C-<f6>") #'terminal-here-project-launch))

(provide 'terminal-settings)
