(require 'ispell)

(which-key-declare-prefixes "C-c i" "ispell")

(global-set-key (kbd "C-c i s") 'ispell)

(setq ispell-program-name "hunspell")
(setq ispell-extra-args '("-d en_US"))

(setq ispell-local-dictionary-alist
      '((nil
         "[[:alpha:]]"
         "[^[:alpha:]]"
         "[']"
         t
         ("-d" "en_US")
         nil
         utf-8)
        ("en_US"
         "[[:alpha:]]"
         "[^[:alpha:]]"
         "[']"
         t
         ("-d" "en_US")
         nil
         utf-8)
        ("fr"
         "[[:alpha:]ÀÂÇÈÉÊËÎÏÔÙÛÜàâçèéêëîïôùûü]"
         "[^[:alpha:]ÀÂÇÈÉÊËÎÏÔÙÛÜàâçèéêëîïôùûü]"
         "[-']"
         t
         ("-d" "fr")
         nil
         utf-8)
        ))

(defun ispell-switch-dictionary ()
  "Switch between english and french dictionaries."
  (interactive)
  (let* ((dict ispell-current-dictionary)
         (new (if (string= dict "fr") "en_US" "fr")))
    (ispell-change-dictionary new)
    (message "Switched dictionary from %s to %s" dict new)))

(global-set-key (kbd "C-c i d") 'ispell-switch-dictionary)

(which-key-declare-prefixes "C-c L" "langtool")

(use-package langtool
  :ensure t
  :bind (("C-c L c" . langtool-check)
         ("C-c L d" . langtool-check-done)
         ("C-c L s" . langtool-switch-default-language)
         ("C-c L m" . langtool-show-message-at-point)
         ("C-c L b" . langtool-correct-buffer))
  :config
  (defun langtool-autoshow-detail-popup (overlays)
    (when (require 'popup nil t)
      ;; Do not interrupt current popup
      (unless (or popup-instances
                  ;; suppress popup after type `C-g` .
                  (memq last-command '(keyboard-quit)))
        (let ((msg (langtool-details-error-message overlays)))
          (popup-tip msg)))))

  (setq langtool-autoshow-message-function
        'langtool-autoshow-detail-popup))

(provide 'spelling-settings)
