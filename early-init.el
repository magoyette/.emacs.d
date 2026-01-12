;; Set the garbage collector to only run for each 200 MB
;; Important for lsp-mode performance
(setq gc-cons-threshold 200000000)

;; For lsp-mode performance
(setenv "LSP_USE_PLISTS" "true")

;; Disable tool bar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Disable menu bar
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

;; Disable scroll bar
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Configure packages
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)



(add-to-list 'package-archives
             '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)

;; Required for https://github.com/emacs-tree-sitter/treesit-langs
(add-to-list 'package-archives
             '( "jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/") t)

(setq package-archive-priorities
      '(("melpa" . 10)
        ("nongnu" . 5)
        ("jcs-elpa" . 0)))

(package-initialize)
