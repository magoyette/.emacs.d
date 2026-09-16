;;; folding-settings.el --- Unified folding configuration  -*- lexical-binding: t; -*-

;; Search folded text and reveal matches instead of skipping them.
(setq-default search-invisible 'open)

(use-package kirigami
  :bind ("C-c z o" . kirigami-open-fold)
        ("C-c z O" . kirigami-open-fold-rec)
        ("C-c z r" . kirigami-open-folds)
        ("C-c z c" . kirigami-close-fold)
        ("C-c z m" . kirigami-close-folds)
        ("C-c z a" . kirigami-toggle-fold)
  :custom
  (kirigami-preserve-visual-position t)
  :config
  (kirigami-global-mode 1))

(which-key-add-key-based-replacements "C-c z" "folding")

(use-package outline
  :ensure nil
  :hook ((conf-mode . outline-minor-mode)
         (diff-mode . outline-minor-mode)
         (emacs-lisp-mode . outline-minor-mode)
         (lisp-mode . outline-minor-mode)
         (markdown-mode . outline-minor-mode)))

(with-eval-after-load 'markdown-mode
  ;; markdown-mode already binds the terminal/C-i TAB event to its Org-derived
  ;; visibility cycle.  Bind the distinct GUI TAB event to the same command.
  (keymap-set markdown-mode-map "<tab>" #'markdown-cycle))

(use-package outline-indent
  :commands outline-indent-minor-mode
  :hook ((sass-mode . outline-indent-minor-mode)
         (yaml-mode . outline-indent-minor-mode)
         (yaml-ts-mode . outline-indent-minor-mode))
  :custom
  (outline-indent-ellipsis " ▼"))

;; Load Hideshow before web-mode so web-mode can register its block syntax.
(use-package hideshow
  :ensure nil
  :demand t
  :hook ((lisp-interaction-mode . folding-settings-enable-hideshow)
         (web-mode . folding-settings-enable-hideshow))
  :preface
  (defun folding-settings-enable-hideshow ()
    "Enable Hideshow as the buffer's sole folding backend."
    (when (bound-and-true-p outline-minor-mode)
      (outline-minor-mode -1))
    (hs-minor-mode 1)))

(defun folding-settings-enable-treesit-fold ()
  "Create a parser when needed, then enable `treesit-fold-mode'."
  (require 'treesit-langs)
  (treesit-langs-major-mode-setup)
  ;; treesit-fold uses the first parser in a buffer.  astro-ts-mode creates
  ;; several embedded-language parsers after its primary parser, putting CSS
  ;; first, so recreate the Astro parser last to restore the intended order.
  (when (eq major-mode 'astro-ts-mode)
    (when-let* ((parser
                 (seq-find
                  (lambda (candidate)
                    (eq (treesit-parser-language candidate) 'astro))
                  (treesit-parser-list))))
      (unless (eq parser (car (treesit-parser-list)))
        (treesit-parser-delete parser)
        (setq-local treesit-primary-parser (treesit-parser-create 'astro)))))
  (treesit-fold-mode 1))

(use-package treesit-fold
  :hook ((astro-ts-mode . folding-settings-enable-treesit-fold)
         (bash-ts-mode . folding-settings-enable-treesit-fold)
         (css-mode . folding-settings-enable-treesit-fold)
         (css-ts-mode . folding-settings-enable-treesit-fold)
         (js-json-mode . folding-settings-enable-treesit-fold)
         (js-mode . folding-settings-enable-treesit-fold)
         (js-ts-mode . folding-settings-enable-treesit-fold)
         (json-mode . folding-settings-enable-treesit-fold)
         (json-ts-mode . folding-settings-enable-treesit-fold)
         (sh-mode . folding-settings-enable-treesit-fold)
         (tsx-ts-mode . folding-settings-enable-treesit-fold)
         (typescript-ts-mode . folding-settings-enable-treesit-fold))
  :custom
  (treesit-fold-line-count-show t)
  (treesit-fold-line-count-format " ▼ %d")
  :config
  ;; Astro derives from html-ts-mode, but treesit-fold dispatches on the exact
  ;; major mode.  Its grammar uses HTML-compatible element node names.
  (add-to-list 'treesit-fold-range-alist
               `(js-json-mode . ,(treesit-fold-parsers-json)))
  (add-to-list 'treesit-fold-range-alist
               '(astro-ts-mode
                 (element . treesit-fold-range-html)
                 (frontmatter . treesit-fold-range-seq)
                 (style_element . treesit-fold-range-html)))
  (set-face-attribute 'treesit-fold-replacement-face nil
                      :inherit 'shadow
                      :foreground 'unspecified
                      :box nil
                      :weight 'bold))

(use-package savefold
  :init
  (setq savefold-backends '(outline org hideshow treesit-fold markdown)
        savefold-directory (no-littering-expand-var-file-name "savefold/"))
  :config
  ;; savefold 2025 still passes the pre-Emacs 31 offset arguments to
  ;; `hs-make-overlay', whose offsets are now buffer-local Hideshow settings.
  (defun folding-settings--savefold-hideshow-recover-folds ()
    "Restore Hideshow folds using the Emacs 31 overlay API."
    (savefold-utils--unless-file-recently-modified
     (mapc
      (lambda (fold-data)
        (hs-make-overlay (nth 0 fold-data)
                         (nth 1 fold-data)
                         (nth 2 fold-data)))
      (savefold-utils--get-file-attr savefold-hideshow--folds-attr))))
  (advice-add 'savefold-hideshow--recover-folds
              :override #'folding-settings--savefold-hideshow-recover-folds)
  (savefold-mode 1)

  ;; Org 9.8 uses its current folding API even when folds are represented by
  ;; overlays.  savefold mistakes that case for the legacy API and consequently
  ;; misses headline folds, so direct it to the current API with valid specs.
  (setq savefold-org--text-prop-fold-specs
        `(org-fold-outline
          ,(if (eq org-fold-core-style 'text-properties)
               'org-fold-block
             'org-hide-block)
          ,(if (eq org-fold-core-style 'text-properties)
               'org-fold-drawer
             'org-hide-drawer)))
  (defun folding-settings--savefold-org-old-fashioned-p ()
    "Return nil so savefold uses the current Org folding API."
    nil)
  (advice-add 'savefold-org--using-old-fashioned-foldsp
              :override #'folding-settings--savefold-org-old-fashioned-p))

(provide 'folding-settings)

;;; folding-settings.el ends here
