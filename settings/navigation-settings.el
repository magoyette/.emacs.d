;; Line numbers activated only when going to a line
;; Source: whattheemacsd.com
(global-set-key [remap goto-line] 'goto-line-with-feedback)

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

(use-package neotree
  :ensure t
  :bind (("<f8>" . neotree-toggle))
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-window-fixed-size nil)
  (setq neo-mode-line-type 'default)
  (setq neo-window-width 35))

(provide 'navigation-settings)
