;;; -*- lexical-binding: t; -*-

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

;; Ensure treesit is loaded before package autoloads are activated below.
;; astro-ts-mode-autoloads.el calls (treesit-ready-p ...) which fails if treesit isn't loaded.
(require 'treesit nil t)

;; astro-ts-mode-autoloads.el calls (treesit-ready-p 'astro) during
;; `package-initialize', which warns at every startup when the grammar is
;; missing. The treesit-langs bundle does not ship the astro grammar, so build
;; it from source (git + cc) once, before the autoloads run.
(when (and (fboundp 'treesit-available-p)
           (treesit-available-p)
           (not (treesit-language-available-p 'astro)))
  (add-to-list 'treesit-language-source-alist
               '(astro "https://github.com/virchau13/tree-sitter-astro"))
  (condition-case err
      (treesit-install-language-grammar 'astro)
    (error (message "Could not install the astro tree-sitter grammar: %s"
                    (error-message-string err)))))

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
