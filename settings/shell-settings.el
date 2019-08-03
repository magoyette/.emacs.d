(use-package terminal-here
  :ensure t
  :bind (("C-c T l" . terminal-here-launch)
         ("C-c T p" . terminal-here-project-launch)))

(use-package shell
  :config
  (define-key shell-mode-map
    (kbd "C-r") 'counsel-shell-history))

;; Syntax highlight for Bash variables inside strings
;; Source: https://fuco1.github.io/2017-06-11-Font-locking-with-custom-matchers.html
(defun my-match-variables-in-quotes (limit)
  "Match variables in double-quotes in `sh-mode'."
  (with-syntax-table sh-mode-syntax-table
    (catch 'done
      (while (re-search-forward
              ;; `rx' is cool, mkay.
              (rx (or line-start (not (any "\\")))
                  (group "$")
                  (group
                   (or (and "{" (+? nonl) "}")
                       (and (+ (any alnum "_")))
                       (and (any "*" "@" "#" "?" "-" "$" "!" "0" "_")))))
              limit t)
        (-when-let (string-syntax (nth 3 (syntax-ppss)))
          (when (= string-syntax 34)
            (throw 'done (point))))))))

(font-lock-add-keywords
 'sh-mode '((my-match-variables-in-quotes
             (1 'default t)
             (2 font-lock-variable-name-face t))))

(provide 'shell-settings)
