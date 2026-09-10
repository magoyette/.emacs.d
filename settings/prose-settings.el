;;; -*- lexical-binding: t; -*-

(which-key-add-key-based-replacements "C-c c" "prose")

(defvar-local prose-language "en_CA"
  "Language of the prose in the current buffer.
Supported values are `en_CA' and `fr_CA'.")

(put 'prose-language 'safe-local-variable
     (lambda (value) (member value '("en_CA" "fr_CA"))))

(defvar-local prose-visual-fill-column nil
  "Non-nil to narrow and center prose with `visual-fill-column-mode'.
Meant to be set from a `.dir-locals.el' at the root of a repository whose
Markdown files are prose rather than documentation read alongside code.")

(put 'prose-visual-fill-column 'safe-local-variable #'booleanp)

(defun prose-french-buffer-p ()
  "Return non-nil when the current buffer is marked as French prose."
  (string= prose-language "fr_CA"))

(defun prose-ltex-plus-language ()
  "Return the LTeX+ language corresponding to `prose-language'."
  (string-replace "_" "-" prose-language))

(defun prose-apply-language ()
  "Apply `prose-language' to Jinx and LTeX+ in the current buffer."
  (setq-local jinx-languages prose-language
              lsp-ltex-plus-language (prose-ltex-plus-language)))

(defun prose-toggle-language ()
  "Toggle Canadian English and French in the current buffer."
  (interactive)
  (setq prose-language (if (prose-french-buffer-p) "en_CA" "fr_CA"))
  (prose-apply-language)
  (when (bound-and-true-p jinx-mode)
    (jinx-mode -1)
    (jinx-mode 1))
  ;; The package's minor mode detaches only its add-on client when other LSP
  ;; clients share the buffer, then rejoins the LTeX+ workspace on enable.
  (when (bound-and-true-p lsp-ltex-plus-mode)
    (lsp-ltex-plus-mode -1)
    (lsp-ltex-plus-mode 1))
  (message "prose-language: %s (Jinx: %s, LTeX+: %s)"
           prose-language jinx-languages lsp-ltex-plus-language))

(global-set-key (kbd "C-c c L") #'prose-toggle-language)

(defun prose-apply-visual-fill-column ()
  "Enable `visual-fill-column-mode' when `prose-visual-fill-column' is set."
  (when prose-visual-fill-column
    (visual-fill-column-mode 1)))

(defun prose-buffer-setup ()
  "Enable prose-friendly defaults in the current buffer.
Narrowing and centering the text is opt-in per directory, and is applied
from `hack-local-variables-hook' rather than here: `run-mode-hooks' runs
major mode hooks before it calls `hack-local-variables', so
`prose-visual-fill-column' still holds its default value at this point."
  (visual-line-mode 1)
  (add-hook 'hack-local-variables-hook #'prose-apply-visual-fill-column nil t))

;; Word completion from `ispell' needs a plain word-list file
;; (`ispell-alternate-dictionary'), which is not installed here, so
;; `ispell-completion-at-point' signals an error on every completion attempt.
;; Spellchecking is handled by jinx, so drop the capf entirely.
(setopt text-mode-ispell-word-completion nil)

(defun prose-quiet-completion ()
  "Disable Corfu auto completion in the current buffer.
Completion stays available on demand via TAB and `completion-at-point'.
Both forms are needed because the order in which this runs relative to
`corfu-mode' depends on the buffer: `setq-local' handles the case where
`corfu-mode' has not been enabled yet, `remove-hook' the case where it has."
  (setq-local corfu-auto nil)
  (remove-hook 'post-command-hook 'corfu-auto--post-command t))

(add-hook 'text-mode-hook #'prose-quiet-completion)

(use-package jinx
  :diminish jinx-mode
  :bind (("M-$" . jinx-correct)
         ("C-c c l" . jinx-languages))
  :init
  (setq jinx-languages "en_CA"))

(use-package vertico-multiform
  :ensure nil
  :after vertico
  :config
(add-to-list 'vertico-multiform-categories
               '(jinx grid (vertico-grid-annotate . 20) (vertico-count . 4)))
  (vertico-multiform-mode 1))

(defun prose-enable-language-tools ()
  "Enable prose checkers after directory-local variables have been applied."
  (when (derived-mode-p 'text-mode)
    (prose-apply-language)
    (jinx-mode 1))
  (when (and (buffer-file-name)
             (memq major-mode '(markdown-mode gfm-mode org-mode)))
    (unless (bound-and-true-p lsp-ltex-plus-mode)
      (lsp-ltex-plus-mode 1))))

(use-package lsp-ltex-plus
  :commands lsp-ltex-plus-mode
  :init
  ;; Enable both checkers here so their first pass uses directory-local values.
  (add-hook 'hack-local-variables-hook #'prose-enable-language-tools)
  (setq lsp-ltex-plus-dictionary-file
        (no-littering-expand-var-file-name
         "lsp-ltex-plus/stored-dictionary.eld")
        lsp-ltex-plus-enabled-rules-file
        (no-littering-expand-var-file-name
         "lsp-ltex-plus/enabled-rules.eld")
        lsp-ltex-plus-disabled-rules-file
        (no-littering-expand-var-file-name
         "lsp-ltex-plus/disabled-rules.eld")
        lsp-ltex-plus-hidden-false-positives-file
        (no-littering-expand-var-file-name
         "lsp-ltex-plus/hidden-false-positives.eld"))
  :custom
  (lsp-ltex-plus-language "en-CA")
  (lsp-ltex-plus-lt-server-uri nil)
  (lsp-ltex-plus-check-frequency "save")
  (lsp-ltex-plus-additional-rules-enable-picky-rules nil)
  (lsp-ltex-plus-completion-enabled nil))

;; English definitions, thesaurus and etymology from the local dictd server:
;; GCIDE (definitions with etymologies), WordNet 3.0, FreeDict fra-eng/eng-fra.
;; "localhost" removes the dict.org fallback, which speaks unencrypted TCP on
;; port 2628.
(use-package dictionary
  :ensure nil
  :bind (("C-c c d" . dictionary-lookup-definition)
         ("C-c c D" . dictionary-search))
  :init
  (setq dictionary-server "localhost"
        dictionary-use-single-buffer t))

(use-package wiktionary-bro
  :bind (("C-c c w" . wiktionary-bro-dwim)))

(use-package powerthesaurus
  :bind (("C-c c p" . powerthesaurus-lookup-dwim)))

;; Offline English thesaurus: shells out to the local `wn' WordNet CLI, no
;; network at all. Distinct from `dict-wn' above, which serves WordNet
;; definitions over DICT rather than a synonym/synset list.
(use-package synosaurus
  :bind (("C-c c s" . synosaurus-lookup)))

(provide 'prose-settings)
