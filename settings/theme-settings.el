;;; -*- lexical-binding: t; -*-

;; Commands to change text scale
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Disable blinking cursor
(blink-cursor-mode -1)

;; Highlight the line of the cursor
(global-hl-line-mode +1)

;; Display column number in mode line
(setq column-number-mode t)

(use-package page-break-lines
  :diminish page-break-lines-mode
  :config
  (global-page-break-lines-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(defvar local-settings-theme 'doom-one
  "Theme loaded at startup.  Set this in `local-settings.el'.
Any theme symbol works; `doom-*' and `modus-*' get family-specific setup.")

(defvar local-settings-themes
  '(doom-one modus-operandi-tinted modus-vivendi-tinted)
  "Themes offered by `theme-settings-select'.  Set in `local-settings.el'.")

;; Loaded on demand by `theme-settings--doom-setup', only when a doom-* theme is actually selected
(use-package doom-themes
  :ensure t
  :defer t)

(defun theme-settings--modus-setup ()
  "Set Modus options.  Must run before `load-theme'. `modus-themes' is bundled in etc/themes."
  (setq modus-themes-headings '((t . (regular)))
        modus-themes-bold-constructs nil
        modus-themes-italic-constructs nil
        modus-themes-disable-other-themes t))

(defun theme-settings--doom-setup ()
  "Set doom-themes options.  Must run before `load-theme'."
  (require 'doom-themes)
  (setq doom-themes-enable-bold nil
        doom-themes-enable-italic nil))

(defun theme-settings-load (theme)
  "Disable every enabled theme, then load THEME with its family setup."
  (mapc #'disable-theme custom-enabled-themes)
  (let ((name (symbol-name theme)))
    (cond
     ((string-prefix-p "modus-" name)
      (theme-settings--modus-setup)
      (load-theme theme t))
     ((string-prefix-p "doom-" name)
      (theme-settings--doom-setup)
      (load-theme theme t)
      ;; Fontifies #hashtags / @attags in Org; doom-specific extra.
      (doom-themes-org-config))
     (t (load-theme theme t)))))

(defun theme-settings-select (theme)
  "Switch to THEME, chosen from `local-settings-themes'."
  (interactive
   (list (intern (completing-read "Theme: " local-settings-themes nil t))))
  (theme-settings-load theme))

(global-set-key (kbd "C-c z") #'theme-settings-select)
(which-key-add-key-based-replacements "C-c z" "select theme")

(theme-settings-load local-settings-theme)

(provide 'theme-settings)
