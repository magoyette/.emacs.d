(add-to-list 'load-path "~/.emacs.d/settings/")

(require 'emacs-settings)

;; Configure Melpa
(global-set-key (kbd "C-x p") 'list-packages)

;; Necessary for the installation of use-package
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package no-littering
  :config
  (require 'recentf)
  (add-to-list 'recentf-exclude no-littering-var-directory)
  (add-to-list 'recentf-exclude no-littering-etc-directory)

  (setq custom-file (no-littering-expand-etc-file-name "custom.el"))

  (setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))

(use-package diminish
  :config
  (diminish 'visual-line-mode))

(use-package general)

(use-package which-key
  :diminish which-key-mode
  :bind (("C-c h m" . which-key-show-major-mode))
  :config
  (which-key-mode)

  (which-key-add-key-based-replacements "C-c e" "edition")
  (which-key-add-key-based-replacements "C-c h" "help")
  (which-key-add-key-based-replacements "C-c s" "search & replace")
  (which-key-add-key-based-replacements "C-c T" "terminal"))

;; Used by ivy to show recent commands in M-x
(use-package smex)

;; Ivy has an hydra
(use-package hydra)

;; Used by ivy-avy
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

; Used by ivy while doing fuzzy matching
(use-package flx)

(use-package ivy
  :diminish (ivy-mode)
  :bind (("C-x C-b" . ivy-switch-buffer))
  :init
  (setq enable-recursive-minibuffers t)
  (ivy-mode 1)
  :config
  (setq ivy-height 20)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-use-selectable-prompt t))

(use-package ivy-hydra)

(use-package swiper
  :bind (("C-s" . counsel-grep-or-swiper)
         ([remap isearch-backward] . counsel-grep-or-swiper)
         ("C-M-s" . swiper-all))
  :config
  ;; Use rg instead of grep in counsel-grep-or-swiper
  ;; -M 120 allows to hide lines that are too long to avoid slowdowns
  ;;        (ex: log files)
  (setq counsel-grep-base-command
        "rg -i -M 120 --no-heading --line-number --color never '%s' %s"))

;; Add more information in some describe commands
(setq completions-detailed t)

(use-package counsel
  :general
  ("M-x" 'counsel-M-x
   "C-x C-f" 'counsel-find-file
   "C-x C-r" 'counsel-recentf
   "C-x d" 'counsel-dired
   "C-c h f" 'counsel-describe-function
   "C-c h v" 'counsel-describe-variable
   "C-c h l" 'counsel-find-library
   "C-c h i" 'counsel-info-lookup-symbol
   "C-c h a" 'counsel-apropos
   "C-c h b" 'counsel-descbinds
   "C-c e u" 'counsel-unicode-char
   "M-i" 'counsel-imenu
   "C-x M-b" 'counsel-bookmark
   "M-y" 'counsel-yank-pop
   "C-c T s" 'counsel-switch-to-shell-buffer
   "C-c s s" '(counsel-rg :which-key "rg")
   "C-c s f" '(counsel-fzf :which-key "fzf"))
  :init
  ;; apropos also search for noninteractive functions
  (defvar apropos-do-all t)
  :config
  (define-key minibuffer-local-map
    (kbd "C-r") 'counsel-minibuffer-history)

  ;; Use a vertical bar as separator in counsel-yank-pop
  (setq counsel-yank-pop-separator
         (format "\n%s\n" (make-string 60 ?┅))))

;; Disable imenu's results cache
(setq imenu-auto-rescan t)

;; imenu in all buffers with same major mode or same projectile project
(use-package imenu-anywhere
  :general
  ("C-c s i" '(ivy-imenu-anywhere :which-key "imenu-anywhere")))

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

(require 'edition-settings)
(require 'navigation-search-settings)
(require 'dired-settings)
(require 'treemacs-settings)
(require 'windows-settings)
(require 'company-settings)
(require 'yasnippet-settings)
(require 'flycheck-settings)
(require 'spelling-settings)
(require 'shell-settings)
(require 'git-settings)
(require 'markdown-settings)
(require 'web-settings)
(require 'yaml-settings)
(require 'lsp-settings)
(require 'org-settings)
(require 'theme-settings)
