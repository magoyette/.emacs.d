# .emacs.d

My personal Emacs configuration. It requires Emacs 27.

This repository should be cloned in the home folder of the current user.

---

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Local settings](#local-settings)
- [External dependencies](#external-dependencies)
  - [Windows OS setup](#windows-os-setup)
    - [Windows HOME variable](#windows-home-variable)
  - [Fonts](#fonts)
    - [all-the-icons.el fonts](#all-the-iconsel-fonts)
  - [General Tools](#general-tools)
    - [Git](#git)
    - [hadolint](#hadolint)
    - [Pandoc](#pandoc)
    - [RipGrep](#ripgrep)
    - [ShellCheck](#shellcheck)
  - [Node Tools](#node-tools)
    - [Node and npm](#node-and-npm)
  - [Java Tools](#java-tools)
    - [LanguageTool](#languagetool)
- [Generating the tables of contents](#generating-the-tables-of-contents)
- [Keybindings](#keybindings)
- [Packages](#packages)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Local settings

This Emacs configuration requires the creation of a file named `local-settings.el` in the folder `~/.emacs.d`.

The `local-settings.el` file is used for configurations that vary depending on the computer. Refer to the example below.

```elisp
;; org-settings.el calls this function to configure the directory for org agenda
(defun local-settings-set-org-agenda-files ()
  (setq org-agenda-files (list "~/notes")))

;; Configure which folders are scanned by Magit when listing repositories (`C-c g r`)
(setq magit-repository-directories '(("~/.emacs.d" . 0)
                                     ("~/repos" . 1)))

;; Path to the LanguageTool jar
(setq langtool-language-tool-jar "~/bin/LanguageTool-4.7/languagetool-commandline.jar")
```

## External dependencies

### Windows OS setup

#### Windows HOME variable

An environment variable named `HOME` is required on a Windows OS to allow Emacs to find the `.emacs.d` folder. The value of `HOME` must be the absolute path to the home folder of the current Windows user (where the `.emacs.d` repo should have been cloned). Magit also needs the `HOME` variable to execute git push from Windows.

### Fonts

#### all-the-icons.el fonts

The fonts from [all-the-icons.el](https://github.com/domtronn/all-the-icons.el/tree/master/fonts) must be installed since many packages use them.

### General Tools

#### Git

[Git](https://git-scm.com/) is required by [magit](https://github.com/magit/magit).

#### hadolint

[hadolint](https://github.com/hadolint/hadolint) is a Dockerfile linter used by flycheck.

[hadolint rules](https://github.com/hadolint/hadolint#rules)

#### Pandoc

[Pandoc](http://pandoc.org/) is necessary to preview markdown documents with markdown-mode.

#### RipGrep

Many packages depend on the search tool [RipGrep](https://github.com/BurntSushi/ripgrep).

#### ShellCheck

[ShellCheck](https://github.com/koalaman/shellcheck) is used for static analysis of shell scripts by flycheck.

[ShellCheck rules](https://github.com/koalaman/shellcheck/wiki)

### Node Tools

#### Node and npm

Node and npm are required for many JavaScript libraries.

Run `install-node-deps.sh` to install the Node dependencies of this configuration.

```shell
./install-node-deps.sh
```

### Java Tools

This Emacs configuration needs a JDK available in the path of the OS.

#### LanguageTool

[LanguageTool](https://www.languagetool.org/) is a tool for language spelling, style and grammar.

The variable `langtool-language-tool-jar` must be configured with its path in the file `local-settings.el`.

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
