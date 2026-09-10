# .emacs.d

My personal Emacs configuration. It requires Emacs 31.

This repository should be cloned in the home folder of the current user.

---

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Local settings](#local-settings)
- [Per-repository prose settings](#per-repository-prose-settings)
- [Markdown dialects and Pandoc conversion](#markdown-dialects-and-pandoc-conversion)
- [External dependencies](#external-dependencies)
  - [General Tools](#general-tools)
    - [Git](#git)
    - [Pandoc](#pandoc)
    - [RipGrep](#ripgrep)
    - [fd](#fd)
    - [ShellCheck](#shellcheck)
    - [markdownlint-cli2](#markdownlint-cli2)
    - [LTeX+](#ltex)
    - [hunspell and Enchant](#hunspell-and-enchant)
    - [dictd](#dictd)
  - [Node Tools](#node-tools)
    - [Node and npm](#node-and-npm)
    - [Install ESlint LSP server](#install-eslint-lsp-server)
  - [Emacs LSP Booster](#emacs-lsp-booster)
- [Generating the tables of contents](#generating-the-tables-of-contents)
- [Keybindings](#keybindings)
- [Packages](#packages)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Local settings

This Emacs configuration requires the creation of a file named `local-settings.el` in the folder `~/.emacs.d`.

The `local-settings.el` file is used for configurations that vary depending on the computer. Refer to the example below.

```elisp
;;; -*- lexical-binding: t; -*-

;; org-settings.el calls this function to configure the directory for org agenda
(defun local-settings-set-org-agenda-files ()
  (setq org-agenda-files (list "~/notes")))

;; Configure which folders are scanned by Magit when listing repositories (`C-c g r`)
(setq magit-repository-directories '(("~/.emacs.d" . 0)
                                     ("~/repos" . 1)))

;; Theme to load at startup
(setq local-settings-theme 'doom-one)

;; Themes included in the theme selection of `C-c z'
(setq local-settings-themes '(doom-one modus-operandi-tinted modus-vivendi-tinted))
```

## External dependencies

### General Tools

#### Git

[Git](https://git-scm.com/) is required by [magit](https://github.com/magit/magit).

#### Pandoc

[Pandoc](http://pandoc.org/) is necessary to preview markdown documents with markdown-mode.

#### RipGrep

Many packages depend on the search tool [RipGrep](https://github.com/BurntSushi/ripgrep).

#### fd

[fd](https://github.com/sharkdp/fd) is used by `consult-fd` (`C-c s f`) for fast, gitignore-aware file search.

#### ShellCheck

[ShellCheck](https://github.com/koalaman/shellcheck) is used for static analysis of shell scripts by flycheck.

[ShellCheck rules](https://github.com/koalaman/shellcheck/wiki)

#### markdownlint-cli2

[markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2) is used for static analysis of markdown files by flycheck (checker `markdown-markdownlint-cli2`).

#### LTeX+

[LTeX+](https://github.com/ltex-plus/ltex-ls-plus) supplies local/offline
grammar and spelling diagnostics through `lsp-ltex-plus`. The dev-setup Emacs
sub-playbook installs its pinned server and bundled Java runtime.

#### hunspell and Enchant

[hunspell](https://hunspell.github.io/) and [Enchant](https://github.com/rrthomas/enchant), with English and French dictionaries installed, provide the spellchecking backend that `jinx` binds to via its dynamic module.

#### dictd

[dictd](https://en.wikipedia.org/wiki/DICT), with the GCIDE, WordNet, and English/French FreeDict databases installed, is a local offline dictionary server used by `dictionary.el`, avoiding the unencrypted `dict.org` network fallback.

### Node Tools

#### Node and npm

Node and npm are required for many JavaScript libraries.

Run `install-node-deps.sh` to install the Node dependencies of this configuration.

```shell
./install-node-deps.sh
```

#### Install ESlint LSP server

```text
M-x lsp-install-server
eslint
```

### Emacs LSP Booster

Install the [emacs-lsp-booster](https://github.com/blahgeek/emacs-lsp-booster/releases) binary.

## Generating the tables of contents

The tables of contents of this repository are generated with a Bash script.

```shell
./generate-toc.sh
```

## Keybindings

See [keybindings.md](keybindings.md) for a list of commonly used keybindings.

## Packages

The packages used by this Emacs configuration are grouped in categories. The package management is defined in `init.el`. For the other categories, a file suffixed with `-settings.el` is available in `/settings`.

See [packages.md](packages.md) for a list of all the included packages.

## Prose settings

Prose settings can be changed by repository based on its language with directory-local variables.

| Variable                   | Values               | Effect                                                                                                                     |
| -------------------------- | -------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `prose-language`           | `"en_CA"`, `"fr_CA"` | Select Canadian English or French for both Jinx and LTeX+. Defaults to `"en_CA"`; toggle with `C-c c L`.                   |
| `prose-visual-fill-column` | `t`, `nil`           | Narrow and center Markdown text with `visual-fill-column-mode`. Defaults to `nil`, so Markdown uses the full window width. |

To use French throughout a project, create a `.dir-locals.el` at its root:

```elisp
((nil . ((prose-visual-fill-column . t)
         (prose-language . "fr_CA"))))
```

Regardless of `prose-visual-fill-column`, `visual-fill-column-mode` can always be toggled in the current buffer with `C-c v`.

LTeX+ checks Markdown, GFM, and Org when a file is opened or saved, not after every edit.
`C-c l a` can be used on a diagnostic for corrections, dictionary additions, rule disabling, and false-positive suppression. Its saved choices live under `var/lsp-ltex-plus/`.

Jinx remains enabled as the immediate spellchecker, so some spelling issues can appear in both systems.
