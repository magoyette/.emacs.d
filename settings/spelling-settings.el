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

(provide 'spelling-settings)
