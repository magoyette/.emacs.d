(which-key-add-key-based-replacements "C-c L" "langtool")

(use-package langtool
  :ensure t
  :bind (("C-c L c" . langtool-check)
         ("C-c L d" . langtool-check-done)
         ("C-c L s" . langtool-switch-default-language)
         ("C-c L b" . langtool-correct-buffer))
  :config
  ;; Display message at point with popup
  (defun langtool-autoshow-detail-popup (overlays)
    (when (require 'popup nil t)
      ;; Do not interrupt current popup
      (unless (or popup-instances
                  ;; suppress popup after type `C-g` .
                  (memq last-command '(keyboard-quit)))
        (let ((msg (langtool-details-error-message overlays)))
          (popup-tip msg)))))

  (setq langtool-autoshow-message-function
        'langtool-autoshow-detail-popup)

  (setq langtool-user-arguments
        '("-b"  ;; Paragraph break on a single line break instead of two
          ;; Rules index: https://community.languagetool.org/rule/list
          ;; ARROWS: Cause issues with HTML comments
          ;; DASH_RULE: Cause issues with Markdown lists
          ;; EN_QUOTES: Cause issues with Markdown code blocks
          ;; FRENCH_WHITESPACE: Requires a whitespace before :, ? and !
          ;; MULTIPLICATION_SIGN: Cause issues with Markdown bold and italic
          ;; WORD_CONTAINS_UNDERSCORE: Cause issues with Markdown bold and italic
          "--disable" "ARROWS,DASH_RULE,EN_QUOTES,FRENCH_WHITESPACE,MULTIPLICATION_SIGN,WORD_CONTAINS_UNDERSCORE")))

(provide 'spelling-settings)
