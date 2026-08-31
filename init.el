;;; -*- lexical-binding: t; -*-

(add-to-list 'load-path "~/.emacs.d/settings/")

(require 'emacs-settings)

;; Configure Melpa
(global-set-key (kbd "C-x p") 'list-packages)

;; Index each use-package block in imenu-auto-rescan, must be set before use-package is loaded
(setq use-package-enable-imenu-support t)

(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(setq backup-directory-alist '(("" . "~/.emacs.d/var/backup/per-save")))

;; Must be loaded before other packages
(use-package no-littering
  :config
  (require 'recentf)
  (recentf-mode 1)
  (add-to-list 'recentf-exclude
               (recentf-expand-file-name no-littering-var-directory))
  (add-to-list 'recentf-exclude
               (recentf-expand-file-name no-littering-etc-directory))

  (setq custom-file (no-littering-expand-etc-file-name "custom.el"))

  (setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))

;; Persist minibuffer history
(use-package savehist
  :ensure nil
  :init
  (setq history-length 1000)
  (setq savehist-additional-variables '(corfu-history search-ring regexp-search-ring))
  (savehist-mode 1))

(use-package diminish
  :config
  (diminish 'visual-line-mode))

(use-package general)

;; which-key is included in Emacs 30 (keep :ensure nil)
(use-package which-key
  :ensure nil
  :diminish which-key-mode
  :bind (("C-c h m" . which-key-show-major-mode))
  :init
  (setq which-key-idle-delay 0.5)
  (which-key-mode 1)
  :config
  (which-key-add-key-based-replacements "C-c e" "edition")
  (which-key-add-key-based-replacements "C-c h" "help")
  (which-key-add-key-based-replacements "C-c s" "search & replace")
  (which-key-add-key-based-replacements "C-c T" "terminal"))

(use-package hydra)

(use-package avy
  :bind (("C-," . avy-goto-char)
         ("C-'" . avy-goto-char-2)))

(global-set-key
 (kbd "C-c a")
 (defhydra hydra-avy (:exit t :hint nil)
  "
 Line^^       Region^^        Goto
----------------------------------------------------------
 [_y_] yank   [_Y_] yank      [_c_] timed char  [_C_] char
 [_m_] move   [_M_] move      [_w_] word        [_W_] any word
 [_k_] kill   [_K_] kill      [_l_] line        [_L_] end of line"
  ("c" avy-goto-char-timer)
  ("C" avy-goto-char)
  ("w" avy-goto-word-1)
  ("W" avy-goto-word-0)
  ("l" avy-goto-line)
  ("L" avy-goto-end-of-line)
  ("m" avy-move-line)
  ("M" avy-move-region)
  ("k" avy-kill-whole-line)
  ("K" avy-kill-region)
  ("y" avy-copy-line)
  ("Y" avy-copy-region)))

;; Add more information in some describe commands
(setq completions-detailed t)

;; Disable imenu's results cache
(setq imenu-auto-rescan t)

;; apropos also search for noninteractive functions
(setq apropos-do-all t)

(use-package vertico
  :init
  (setq enable-recursive-minibuffers t)
  (setq vertico-count 20)
  (setq vertico-cycle t)
  (vertico-mode))

;; Path editing helpers in find-file (bundled with vertico under extensions/)
(use-package vertico-directory
  :ensure nil
  :after vertico
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :bind (:map minibuffer-local-map ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

;; Hide commands not applicable to the current mode from M-x
(setq read-extended-command-predicate #'command-completion-default-include-p)

(use-package consult
  :general
  ("C-x C-b" 'consult-buffer
   "C-x C-r" 'consult-recent-file
   "C-x M-b" 'consult-bookmark
   "M-y" 'consult-yank-pop
   "M-i" 'consult-imenu
   "C-s" 'consult-line
   "C-M-s" 'consult-line-multi
   "C-c h i" 'info-lookup-symbol
   "C-c h f" 'describe-function
   "C-c h v" 'describe-variable
   "C-c h l" 'find-library
   "C-c h a" 'apropos
   "C-c e u" 'insert-char
   "C-c s s" '(consult-ripgrep :which-key "rg")
   "C-c s f" '(consult-fd :which-key "fd")
   "C-c s i" '(consult-imenu-multi :which-key "imenu-multi"))
  :bind (([remap isearch-backward] . consult-line)
         :map minibuffer-local-map
         ("C-r" . consult-history))
  :init
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)
  :config
  ;; `projectile-project-root' carries no autoload cookie and projectile is
  ;; deferred until "C-c p", so it must be loaded explicitly here.
  (setq consult-project-function
        (lambda (_)
          (require 'projectile)
          (projectile-project-root))))

(use-package embark
  :bind (("C-." . embark-act)
         ("C-c e a" . embark-act)
         ("C-;" . embark-dwim)
         ("C-c h b" . embark-bindings))
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :after (embark consult)
  :hook (embark-collect-mode . consult-preview-at-point-mode))

(use-package crux
  :bind (("<S-return>" . crux-smart-open-line)
         ("<C-S-return>" . crux-smart-open-line-above)
         ("C-c d" . crux-duplicate-current-line-or-region)
         ("M-j" . crux-top-join-line)
         ("C-c k" . crux-kill-other-buffers)
         ("C-c T b" . crux-visit-term-buffer)
         ("C-c r" . crux-rename-file-and-buffer)))

;;;;; Load settings and features

;; local-settings is used to set local configurations not stored in Git
(if (file-exists-p "~/.emacs.d/local-settings.el")
    (load "~/.emacs.d/local-settings.el"))

(use-package nerd-icons
  :custom
  (nerd-icons-font-family "DejaVuSansM Nerd Font Mono"))

(require 'edition-settings)
(require 'navigation-search-settings)
(require 'dired-settings)
(require 'treemacs-settings)
(require 'windows-settings)
(require 'completion-settings)
(require 'yasnippet-settings)
(require 'flycheck-settings)
(require 'shell-settings)
(require 'git-settings)
(require 'markdown-settings)
(require 'org-settings)
(require 'programming-settings)
(require 'yaml-settings)
(require 'theme-settings)
