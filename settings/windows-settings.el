(use-package winum
  :ensure t
  :config
  (setcdr (assoc 'winum-mode minor-mode-map-alist)
          (let ((map (make-sparse-keymap)))
            (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
            (define-key map (kbd "M-1") 'winum-select-window-1)
            (define-key map (kbd "M-2") 'winum-select-window-2)
            (define-key map (kbd "M-3") 'winum-select-window-3)
            (define-key map (kbd "M-4") 'winum-select-window-4)
            (define-key map (kbd "M-5") 'winum-select-window-5)
            (define-key map (kbd "M-6") 'winum-select-window-6)
            (define-key map (kbd "M-7") 'winum-select-window-7)
            (define-key map (kbd "M-8") 'winum-select-window-8)
            map))

  ;; Necessary for spaceline integration
  (setq winum-auto-setup-mode-line nil)

  (winum-mode))

(use-package visual-fill-column
  :ensure t
  :bind (("C-c v" . visual-fill-column-mode))
  :init
  (setq-default fill-column 80)
  :config (setq-default visual-fill-column-center-text t
                        visual-fill-column-fringes-outside-margins nil))

(global-set-key
 (kbd "C-c w")
  (defhydra hydra-window ()
    "Windows/Frames"
    ("n" make-frame-command "Open a new frame" :color blue)
    ("t" crux-transpose-windows "Transpose windows" :color blue)
    ("m" toggle-frame-maximized "Toggle maximization of frame")
    ("f" toggle-frame-fullscreen "Toggle fullscreen")
    ("o" other-frame "Select other frame")
    ("d" delete-frame "Delete frame")
    ("v" visual-fill-column-mode "Toggle visual-fill-column-mode")))

(provide 'windows-settings)
