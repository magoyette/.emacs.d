;;; -*- lexical-binding: t; -*-

(require 'seq)

(which-key-add-key-based-replacements "C-c c" "prose")

(defconst prose-todo-statuses
  '("IDEA" "TODO" "NEXT" "READING" "STARTED" "WAIT" "DONE")
  "Ordered statuses used for Markdown tasks.")

(defun prose-todo--status-bounds-on-line ()
  "Return bounds of a TODO status on the current line.
Prefer the status at point, otherwise return the first status on the line."
  (let ((origin (point))
        (regexp (regexp-opt prose-todo-statuses 'symbols))
        first-match
        point-match)
    (save-excursion
      (goto-char (line-beginning-position))
      (while (re-search-forward regexp (line-end-position) t)
        (let ((bounds (cons (match-beginning 0) (match-end 0))))
          (unless first-match
            (setq first-match bounds))
          (when (and (<= (car bounds) origin)
                     (<= origin (cdr bounds)))
            (setq point-match bounds))))
      (or point-match first-match))))

(defun prose-todo--cycle-status (step)
  "Cycle the TODO status on the current line by STEP positions."
  (let* ((bounds (prose-todo--status-bounds-on-line))
         (status (and bounds
                      (buffer-substring-no-properties
                       (car bounds) (cdr bounds))))
         (position (and status (seq-position prose-todo-statuses status))))
    (unless position
      (user-error "No TODO status on the current line"))
    (let ((replacement
           (nth (mod (+ position step) (length prose-todo-statuses))
                prose-todo-statuses)))
      (save-excursion
        (goto-char (car bounds))
        (delete-region (car bounds) (cdr bounds))
        (insert replacement)))))

(defun prose-todo-cycle-forward ()
  "Cycle the TODO status on the current line forward."
  (interactive)
  (prose-todo--cycle-status 1))

(defun prose-todo-cycle-backward ()
  "Cycle the TODO status on the current line backward."
  (interactive)
  (prose-todo--cycle-status -1))

(defvar-keymap prose-todo-command-map
  :doc "Keymap for Markdown TODO commands.")

(keymap-global-set "C-c c t" prose-todo-command-map)
(which-key-add-key-based-replacements "C-c c t" "todo")

(use-package hl-todo
  :hook (markdown-mode . hl-todo-mode)
  :bind (:map prose-todo-command-map
              ("n" . prose-todo-cycle-forward)
              ("p" . prose-todo-cycle-backward))
  :custom
  ;; `consult-todo' uses GNU grep for directory and project searches.  Unlike
  ;; Emacs, grep does not understand the default symbol-boundary delimiters.
  (hl-todo-keyword-delimiters 'word)
  ;; Use semantic faces so status colors follow the active theme.
  (hl-todo-keyword-faces
   '(("IDEA"    . warning)
     ("TODO"    . warning)
     ("NEXT"    . error)
     ("READING" . font-lock-keyword-face)
     ("STARTED" . font-lock-keyword-face)
     ("WAIT"    . font-lock-constant-face)
     ("DONE"    . success))))

(use-package consult-todo
  :after hl-todo
  :bind (:map prose-todo-command-map
              ("j" . consult-todo)
              ("J" . consult-todo-project))
  :custom
  (consult-todo-narrow
   '((?i . "IDEA")
     (?t . "TODO")
     (?n . "NEXT")
     (?r . "READING")
     (?s . "STARTED")
     (?w . "WAIT")
     (?d . "DONE")))
  ;; Markdown tasks are list items, not comments.
  (consult-todo-only-comment nil))

(defvar-local prose-language "fr_CA"
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
  "Apply `prose-language' to LTeX+ in the current buffer."
  (setq-local lsp-ltex-plus-language (prose-ltex-plus-language)))

(defun prose-toggle-language ()
  "Toggle Canadian English and French in the current buffer."
  (interactive)
  (setq prose-language (if (prose-french-buffer-p) "en_CA" "fr_CA"))
  (prose-apply-language)
  ;; The package's minor mode detaches only its add-on client when other LSP
  ;; clients share the buffer, then rejoins the LTeX+ workspace on enable.
  (when (bound-and-true-p lsp-ltex-plus-mode)
    (lsp-ltex-plus-mode -1)
    (lsp-ltex-plus-mode 1))
  (message "prose-language: %s (LTeX+: %s)"
           prose-language lsp-ltex-plus-language))

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
;; Spellchecking is handled on demand by LTeX+, so drop the capf entirely.
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

(defcustom prose-personal-dictionary-file
  (expand-file-name "ltex-plus-dictionary.eld" "~/.dictionary/")
  "File containing personal LTeX+ words for all prose languages."
  :type 'file
  :group 'text)

(defun prose-reload-personal-dictionary ()
  "Reload the personal dictionary when LTeX+ has already been loaded."
  (when (featurep 'lsp-ltex-plus)
    (lsp-ltex-plus-reload-settings)))

(defun prose-edit-personal-dictionary ()
  "Open the personal LTeX+ dictionary and reload it after each save."
  (interactive)
  (make-directory (file-name-directory prose-personal-dictionary-file) t)
  (find-file prose-personal-dictionary-file)
  (when (= (buffer-size) 0)
    (insert "(:fr-CA [] :en-CA [])\n"))
  (add-hook 'after-save-hook #'prose-reload-personal-dictionary nil t))

(use-package lsp-ltex-plus
  :commands lsp-ltex-plus-mode
  :init
  (setq lsp-ltex-plus-dictionary-file
        prose-personal-dictionary-file
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
  (lsp-ltex-plus-language "fr-CA")
  (lsp-ltex-plus-lt-server-uri nil)
  (lsp-ltex-plus-check-frequency "edit")
  (lsp-ltex-plus-save-additions-to 'globally-defined)
  (lsp-ltex-plus-additional-rules-enable-picky-rules nil)
  (lsp-ltex-plus-completion-enabled nil))

(define-minor-mode prose-proofreading-mode
  "Toggle live LTeX+ spelling and grammar checks in the current buffer."
  :lighter nil
  :group 'text
  (if prose-proofreading-mode
      (progn
        (prose-apply-language)
        (setq-local lsp-ltex-plus-check-frequency "edit")
        (lsp-ltex-plus-mode 1)
        (unless (bound-and-true-p lsp-ltex-plus-mode)
          (setq prose-proofreading-mode nil)))
    (when (bound-and-true-p lsp-ltex-plus-mode)
      (lsp-ltex-plus-mode -1))))

(defun prose-proofreading-eligible-buffer-p ()
  "Return non-nil when the current buffer belongs to a prose session."
  (and (derived-mode-p 'text-mode)
       (not (minibufferp))
       (not buffer-read-only)
       (not (string-prefix-p " " (buffer-name)))))

(defun prose-proofreading-enable-after-locals ()
  "Enable proofreading after directory-local variables have been applied."
  (when (and prose-proofreading-session-mode
             (prose-proofreading-eligible-buffer-p))
    (prose-proofreading-mode 1)))

(define-minor-mode prose-proofreading-session-mode
  "Toggle live proofreading in all eligible buffers for this Emacs session."
  :global t
  :group 'text
  (if prose-proofreading-session-mode
      (progn
        (add-hook 'hack-local-variables-hook
                  #'prose-proofreading-enable-after-locals)
        (dolist (buffer (buffer-list))
          (with-current-buffer buffer
            (when (prose-proofreading-eligible-buffer-p)
              (prose-proofreading-mode 1)))))
    (remove-hook 'hack-local-variables-hook
                 #'prose-proofreading-enable-after-locals)
    (dolist (buffer (buffer-list))
      (with-current-buffer buffer
        (when (bound-and-true-p prose-proofreading-mode)
          (prose-proofreading-mode -1))))))

(defun prose-proofread-code-action ()
  "Start proofreading, or run an LTeX+ code action when already active."
  (interactive)
  (if (bound-and-true-p prose-proofreading-mode)
      (call-interactively #'lsp-execute-code-action)
    (prose-proofreading-mode 1)
    (message "Proofreading enabled; use C-c c a on a diagnostic to correct it")))

(global-set-key (kbd "C-c c a") #'prose-proofread-code-action)
(global-set-key (kbd "C-c c c") #'prose-proofreading-mode)
(global-set-key (kbd "C-c c C") #'prose-proofreading-session-mode)
(global-set-key (kbd "C-c c e") #'prose-edit-personal-dictionary)

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
