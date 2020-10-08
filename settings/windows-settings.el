(use-package ace-window
  :bind (("M-z" . ace-window)))

(global-set-key
 (kbd "C-c w")
 (defhydra hydra-frame-window (:color red :hint nil)
  "
^Frames^          ^Window^                    ^Window Size^ ^Text^
_n_: new          _c_: clone in new window    ^ ^ _k_ ^ ^   _K_
_m_: maximize     _e_: swap                   _h_ ^+^ _l_   ^+^
_f_: fullscreen   _w_: delete                 ^ ^ _j_ ^ ^   _J_
_d_: delete       _v_: visual fill column     _b_alance     ^ ^
"
  ("n" make-frame-command :exit t)
  ("m" toggle-frame-maximized)
  ("f" toggle-frame-fullscreen)
  ("d" delete-frame :exit t)
  ("c" clone-indirect-buffer-other-window :exit t)
  ("t" crux-transpose-windows :color blue)
  ("v" visual-fill-column-mode)
  ("e" ace-swap-window)
  ("w" ace-delete-window :exit t)
  ("k" shrink-window)
  ("h" shrink-window-horizontally)
  ("l" enlarge-window-horizontally)
  ("j" enlarge-window)
  ("b" balance-windows)
  ("K" text-scale-decrease)
  ("J" text-scale-increase)))

(use-package visual-fill-column
  :bind (("C-c v" . visual-fill-column-mode))
  :init
  (setq-default fill-column 80)
  :config (setq-default visual-fill-column-center-text t
                        visual-fill-column-fringes-outside-margins nil))

(provide 'windows-settings)
