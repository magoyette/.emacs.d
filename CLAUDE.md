# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Emacs 31 configuration. The repository should be cloned to `~/.emacs.d`.

## Setup

### Required external tools

- **RipGrep** (`rg`) — used by consult-ripgrep, consult-line, and deadgrep
- **fd** — used by consult-fd
- **Git** — required by magit
- **Pandoc** — required for markdown preview
- **ShellCheck** — used by flycheck for shell script linting
- **markdownlint-cli2** — used by flycheck for markdown linting
- **Node/npm** — required for LSP servers and prettier
- **emacs-lsp-booster** binary — improves LSP performance
- **LTeX+ LS** (`ltex-ls-plus`) — local grammar and spelling server
- **DejaVuSansM Nerd Font Mono** — required by nerd-icons
- **hunspell + Enchant** (with English and French dictionaries) — spellchecking backend for `jinx`
- **dictd** (with GCIDE, WordNet, and English/French FreeDict databases) — local offline dictionary server for `dictionary.el`

### Node dependencies

```shell
./install-node-deps.sh
```

### ESLint LSP server

Install from inside Emacs: `M-x lsp-install-server` then select `eslint`.

### local-settings.el

A `~/.emacs.d/local-settings.el` file must be created for machine-specific config (not stored in git). Example:

### Generating tables of contents

```shell
./generate-toc.sh
```

## Architecture

### Load order

1. `early-init.el` — sets GC threshold, `LSP_USE_PLISTS` env var, disables UI elements, configures package archives (MELPA, NonGNU ELPA, jcs-elpa)
2. `init.el` — adds `settings/` to load path, installs `use-package`, configures core packages (vertico/consult/marginalia/orderless/embark, avy, hydra, crux, nerd-icons), then `require`s all settings modules

### Settings modules (`settings/`)

Each file handles a specific domain and ends with `(provide 'module-name)`:

| File                            | Contents                                                                                                                                        |
| ------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `emacs-settings.el`             | Font, UI, eldoc, ISO dead keys                                                                                                                  |
| `edition-settings.el`           | expand-region, multiple-cursors, undo-tree, move-text                                                                                           |
| `navigation-search-settings.el` | projectile, deadgrep, visual-regexp                                                                                                             |
| `dired-settings.el`             | dired + nerd-icons-dired                                                                                                                        |
| `treemacs-settings.el`          | treemacs + projectile/magit/nerd-icons integrations                                                                                             |
| `windows-settings.el`           | ace-window                                                                                                                                      |
| `completion-settings.el`        | corfu, nerd-icons-corfu, cape                                                                                                                   |
| `flycheck-settings.el`          | flycheck + flycheck-pos-tip, flycheck-package, flycheck-relint                                                                                  |
| `shell-settings.el`             | shell configuration                                                                                                                             |
| `git-settings.el`               | magit, diff-hl, git-modes, smerge-mode hydra                                                                                                    |
| `markdown-settings.el`          | markdown-mode                                                                                                                                   |
| `org-settings.el`               | org, org-appear                                                                                                                                 |
| `prose-settings.el`             | jinx, LTeX+, prose variables, dictionary.el, thesaurus, and etymology lookups                                                                   |
| `yaml-settings.el`              | yaml-mode, indent-tools                                                                                                                         |
| `programming-settings.el`       | lsp-mode and integrations, web-mode, astro-ts-mode, treesit-langs, prettier                                                                     |
| `theme-settings.el`             | doom-themes, modus-themes (bundled), doom-modeline, rainbow-delimiters, page-break-lines; theme via `local-settings-theme`, `C-c z` switches    |

### Key conventions

- **Package management**: `use-package` with `:ensure t` (set globally). Packages install from MELPA by default.
- **Keybindings**: `general.el` is used for defining keys (`:general` in `use-package`). `which-key` documents prefix keys (`C-c e` edition, `C-c s` search, `C-c g` git, `C-c l` lsp, `C-c o` org, `C-c z` select theme, `C-c T` terminal, `C-c c` prose with `w`/`d` sub-prefixes for writing and dictionary/lookup).
- **File storage**: `no-littering` redirects generated files to `var/` and `etc/` subdirectories. Custom variables go to `etc/custom.el`.
- **LSP performance**: GC threshold set to 200MB in `early-init.el`; `emacs-lsp-booster` wraps LSP server commands when the binary is available.
- **Completion**: minibuffer completion via Vertico + Consult + Marginalia + Orderless (fuzzy/component matching) + Embark (contextual actions); `savehist-mode` persists history, including M-x recency. In-buffer completion via Corfu (+ nerd-icons-corfu for icons; terminal popups work natively via Emacs 31's `tty-child-frames`) + Cape.
