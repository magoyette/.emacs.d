# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Emacs 30 configuration. The repository should be cloned to `~/.emacs.d`.

## Setup

### Required external tools

- **RipGrep** (`rg`) — used by counsel-rg, swiper, and deadgrep
- **Git** — required by magit
- **Pandoc** — required for markdown preview
- **ShellCheck** — used by flycheck for shell script linting
- **Node/npm** — required for LSP servers and prettier
- **emacs-lsp-booster** binary — improves LSP performance
- **DejaVuSansM Nerd Font Mono** — required by nerd-icons

### Node dependencies

```shell
./install-node-deps.sh
```

### ESLint LSP server

Install from inside Emacs: `M-x lsp-install-server` then select `eslint`.

### local-settings.el

A `~/.emacs.d/local-settings.el` file must be created for machine-specific config (not stored in git). Example:

```elisp
(defun local-settings-set-org-agenda-files ()
  (setq org-agenda-files (list "~/notes")))

(setq magit-repository-directories '(("~/.emacs.d" . 0)
                                     ("~/repos" . 1)))
```

### Generating tables of contents

```shell
./generate-toc.sh
```

## Architecture

### Load order

1. `early-init.el` — sets GC threshold, `LSP_USE_PLISTS` env var, disables UI elements, configures package archives (MELPA, NonGNU ELPA, jcs-elpa)
2. `init.el` — adds `settings/` to load path, installs `use-package`, configures core packages (ivy/counsel/swiper, avy, hydra, crux, nerd-icons), then `require`s all settings modules

### Settings modules (`settings/`)

Each file handles a specific domain and ends with `(provide 'module-name)`:

| File | Contents |
| ---- | -------- |
| `emacs-settings.el` | Font, UI, eldoc, ISO dead keys |
| `edition-settings.el` | expand-region, multiple-cursors, undo-tree, move-text |
| `navigation-search-settings.el` | projectile, counsel-projectile, deadgrep, dumb-jump, visual-regexp |
| `dired-settings.el` | dired + nerd-icons-dired |
| `treemacs-settings.el` | treemacs + projectile/magit/nerd-icons integrations |
| `windows-settings.el` | ace-window |
| `company-settings.el` | company + company-box |
| `flycheck-settings.el` | flycheck + flycheck-pos-tip, flycheck-package, flycheck-relint |
| `shell-settings.el` | shell configuration |
| `git-settings.el` | magit, diff-hl, git-modes, smerge-mode hydra |
| `markdown-settings.el` | markdown-mode |
| `yaml-settings.el` | yaml-mode, indent-tools |
| `programming-settings.el` | lsp-mode (with emacs-lsp-booster integration), lsp-ui, lsp-treemacs, lsp-ivy, lsp-tailwindcss, web-mode, astro-ts-mode, treesit-langs, prettier |
| `theme-settings.el` | doom-themes, doom-modeline, rainbow-delimiters, page-break-lines |

### Key conventions

- **Package management**: `use-package` with `:ensure t` (set globally). Packages install from MELPA by default.
- **Keybindings**: `general.el` is used for defining keys (`:general` in `use-package`). `which-key` documents prefix keys (`C-c e` edition, `C-c s` search, `C-c g` git, `C-c l` lsp, `C-c T` terminal).
- **File storage**: `no-littering` redirects generated files to `var/` and `etc/` subdirectories. Custom variables go to `etc/custom.el`.
- **LSP performance**: GC threshold set to 200MB in `early-init.el`; `emacs-lsp-booster` wraps LSP server commands when the binary is available.
- **Completion**: Ivy ecosystem (ivy + counsel + swiper + flx for fuzzy matching + smex for M-x history).
