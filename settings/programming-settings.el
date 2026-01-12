(setq css-indent-offset 2)
(setq js-indent-level 2)

(add-to-list 'auto-mode-alist '("\\.cjs\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.mjs\\'" . js-mode))

(use-package treesit-langs
  :config
  (treesit-langs-major-mode-setup))

(use-package astro-ts-mode
  :mode (("\\.astro\\'" . astro-ts-mode)))

(use-package web-mode
  :mode (("\\.html?\\'" . web-mode))
  :demand t
  :config
  ;; HTML indentation
  (setq web-mode-markup-indent-offset 2)

  ;; CSS identation
  (setq web-mode-css-indent-offset 2)

  ;; Programming languages indentation (JavaScript and others)
  (setq web-mode-code-indent-offset 2)

  (setq web-mode-enable-current-element-highlight t))

(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (progn
                (flycheck-add-mode 'javascript-eslint 'web-mode)
                (flycheck-add-next-checker 'lsp 'javascript-eslint)))))

(use-package prettier
  :hook ((astro-ts-mode . prettier-mode)
         (css-mode . prettier-mode)
         (css-ts-mode . prettier-mode)
         (js-json-mode . prettier-mode)
         (js-mode . prettier-mode)
         (js-ts-mode . prettier-mode)
         (json-mode . prettier-mode)
         (json-ts-mode . prettier-mode)
         (markdown-mode . prettier-mode)
         (sass-mode . prettier-mode)
         (tsx-ts-mode . prettier-mode)
         (typescript-ts-mode . prettier-mode)
         (web-mode . prettier-mode)
         (yaml-mode . prettier-mode))
  :config
  (add-to-list 'prettier-major-mode-parsers
             `(astro-ts-mode . (astro))))

(use-package lsp-mode
  :hook ((lsp-mode . lsp-enable-which-key-integration)
         (astro-ts-mode . lsp)
         (css-mode . lsp)
         (css-ts-mode . lsp)
         (js-json-mode . lsp)
         (js-mode . lsp)
         (js-ts-mode . lsp)
         (json-ts-mode . lsp)
         (sass-mode . lsp)
         (sh-mode . lsp)
         (tsx-ts-mode . lsp)
         (typescript-ts-mode . lsp)
         (web-mode . lsp)
         (yaml-mode .lsp))
  :preface
  ;; See https://github.com/blahgeek/emacs-lsp-booster
  (defun lsp-booster--advice-json-parse (old-fn &rest args)
    "Try to parse bytecode instead of json."
    (or
     (when (equal (following-char) ?#)
       (let ((bytecode (read (current-buffer))))
         (when (byte-code-function-p bytecode)
           (funcall bytecode))))
     (apply old-fn args)))
  (advice-add (if (progn (require 'json)
                         (fboundp 'json-parse-buffer))
                  'json-parse-buffer
                'json-read)
              :around
              #'lsp-booster--advice-json-parse)

  (defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
    "Prepend emacs-lsp-booster command to lsp CMD."
    (let ((orig-result (funcall old-fn cmd test?)))
      (if (and (not test?)                             ;; for check lsp-server-present?
               (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
               lsp-use-plists
               (not (functionp 'json-rpc-connection))  ;; native json-rpc
               (executable-find "emacs-lsp-booster"))
          (progn
            (when-let ((command-from-exec-path (executable-find (car orig-result))))  ;; resolve command from exec-path (in case not found in $PATH)
              (setcar orig-result command-from-exec-path))
            (message "Using emacs-lsp-booster for %s!" orig-result)
            (cons "emacs-lsp-booster" orig-result))
        orig-result)))
  (advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command)
  :init
  (setq lsp-keymap-prefix "C-c l")
  (which-key-add-key-based-replacements "C-c l" "lsp")
  :commands lsp
  :config
  (setq lsp-completion-provider :capf)
  (setq lsp-idle-delay 0.500)
  (lsp-modeline-code-actions-mode))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package lsp-treemacs
  :config
  (lsp-treemacs-sync-mode 1))

(use-package lsp-ivy
    :bind (("C-c l s" . lsp-ivy-workspace-symbol)
           ("C-c l S" . lsp-ivy-global-workspace-symbol)))

(use-package lsp-tailwindcss
  :after lsp-mode
  :init
  (setq lsp-tailwindcss-add-on-mode t
        lsp-tailwindcss-server-version "0.14.8"
        lsp-tailwindcss-skip-config-check t)
  :config
  (setq lsp-tailwindcss-major-modes '(;astro-ts-mode
                                      css-ts-mode
                                      typescript-ts-mode
                                      tsx-ts-mode
                                      web-mode)))

(provide 'programming-settings)
