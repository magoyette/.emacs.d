# .emacs.d

My personal Emacs configuration. It requires Emacs 24 or 25. Most of the configuration is compatible with Windows 7 and Linux.

This repository should be cloned in the home folder of the current user. Since this repository has some Git submodules, it can be cloned with the recursive option to load the submodules immediately.

``` shell
cd ~
git clone --recursive https://github.com/magoyette/.emacs.d.git
```

***

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Local settings](#local-settings)
  - [Org mode local settings](#org-mode-local-settings)
  - [Magit local settings](#magit-local-settings)
- [Git Submodules](#git-submodules)
  - [doctoc.el](#doctocel)
  - [prometheus-rules-mode](#prometheus-rules-mode)
  - [swaggermacs](#swaggermacs)
- [External dependencies](#external-dependencies)
  - [Windows OS setup](#windows-os-setup)
    - [Windows HOME variable](#windows-home-variable)
  - [Fonts](#fonts)
    - [all-the-icons.el fonts](#all-the-iconsel-fonts)
  - [General Tools](#general-tools)
    - [Git](#git)
    - [Pandoc](#pandoc)
    - [RipGrep](#ripgrep)
  - [Java Tools](#java-tools)
    - [JDK](#jdk)
    - [Leiningen](#leiningen)
  - [Node Tools](#node-tools)
    - [Node and npm](#node-and-npm)
    - [doctoc](#doctoc)
    - [js-yaml](#js-yaml)
    - [swagger-tools](#swagger-tools)
    - [TypeScript and tslint](#typescript-and-tslint)
  - [Flycheck checkers](#flycheck-checkers)
    - [ShellCheck](#shellcheck)
  - [Other Programming Languages](#other-programming-languages)
    - [Elixir](#elixir)
    - [Haskell Tool Stack](#haskell-tool-stack)
  - [Hunspell](#hunspell)
    - [Hunspell on Linux](#hunspell-on-linux)
    - [Hunspell on Windows](#hunspell-on-windows)
- [Keybindings](#keybindings)
- [Packages](#packages)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Local settings

This Emacs configuration requires the creation of a file named local-settings.el in the folder ~/.emacs.d.

The local-settings.el file is used for configurations that vary depending on the computer.

### Org mode local settings

The org-settings.el file will try to call a function named local-settings-set-org-agenda-files to set the org-agenda-files variable.

This function should be defined in local-settings.el.

```elisp
(defun local-settings-set-org-agenda-files ()
  (setq org-agenda-files (list "~/org")))
```

### Magit local settings

magit-repository-directories can be set to configure which folders must be scanned by Magit when listing repositories (C-x M-g).

```elisp
(setq magit-repository-directories '("~/.emacs.d"
                                     "~/.gitconfig-setup"
                                     "~/.lein"
                                     "~/dev"))
```

## Git Submodules

This Emacs configuration depends on some packages that are in their initial development. These packages are not available on Melpa, so they are included in this repository as Git submodules.

The submodules can be added with the following command.
``` shell
git submodule update --init
```

It's also possible to clone this repository with the submodules.

``` shell
git clone --recursive https://github.com/magoyette/.emacs.d.git
```

### doctoc.el

[doctoc.el](https://github.com/magoyette/doctoc.el) is a package that adds support for [DocToc](https://github.com/thlorenz/doctoc) in Emacs.

### prometheus-rules-mode

[prometheus-rules-mode](https://github.com/magoyette/prometheus-rules-mode) is a package that adds support for [Prometheus](https://prometheus.io) rules in Emacs.

### swaggermacs

[swaggermacs](https://github.com/magoyette/swaggermacs) is a package that adds support for Swagger2 YAML files in Emacs.

## External dependencies

### Windows OS setup

#### Windows HOME variable

An environment variable named HOME is required on a Windows OS to allow Emacs to find the .emacs.d folder. The value of HOME must be the absolute path to the home folder of the current Windows user (where the .emacs.d repo should have been cloned). Magit also needs the HOME variable to execute git push from Windows.

### Fonts

#### all-the-icons.el fonts

The neotree package is configured to use the [fonts of all-the-icons.el](https://github.com/domtronn/all-the-icons.el/tree/master/fonts).

### General Tools

#### Git

[Git](https://git-scm.com/) is required by [magit](https://github.com/magit/magit).

#### Pandoc

[Pandoc](http://pandoc.org/) is necessary to preview markdown documents with markdown-mode.

#### RipGrep

The package helm-ag is configured to use [RipGrep](https://github.com/BurntSushi/ripgrep).

### Java Tools

#### JDK

Many dependencies of this Emacs configuration need a JDK available in the path of the OS. The following commands should print the versions of the JRE and JDK currently available.

``` shell
java -version
javac -version
```

#### Leiningen

CIDER, the interactive development environment for Clojure, requires the [Leiningen](http://leiningen.org) build tool.

### Node Tools

#### Node and npm

Node and npm are required for many JavaScript libraries.

#### doctoc

doctoc is a JavaScript library used to generate the table of contents of a markdown file.

doctoc can be installed with npm.
```
npm install -g doctoc
```

#### js-yaml

[js-yaml](https://github.com/nodeca/js-yaml) is a JavaScript YAML parser. It is used by Flycheck to check YAML files.

```
npm install -g js-yaml
```

#### swagger-tools

[Swagger Tools](https://github.com/apigee-127/swagger-tools/blob/master/docs/CLI.md) provides JavaScript tools to work with Swagger. It is used by Swaggermacs to check Swagger documents with Flycheck.

```
npm install -g swagger-tools
```

#### TypeScript and tslint

A global installation of TypeScript and tslint is necessary to allow Flycheck to call tslint. tslint will use the tslint.json file of the project directory.

```
sudo npm install -g tslint typescript
```

### Flycheck checkers

#### ShellCheck

[ShellCheck](https://github.com/koalaman/shellcheck) is used for static analysis of shell scripts.

### Other Programming Languages

#### Elixir

Alchemist requires [Elixir](http://elixir-lang.org/).

#### Haskell Tool Stack

Intero, the interactive development environment for Haskell, requires [Stack](haskellstack.org).

### Hunspell

Hunspell is a spell checker used with ispell. Flyspell is not used in this configuration, since I find its on-the-fly spell checking annoying in the context of my workflow.

#### Hunspell on Linux

Use the package manager to install hunspell. On Fedora, the packages I use are hunspell, hunspell-en and hunspell-fr.

#### Hunspell on Windows

The installation on Windows involves many steps.

- Download Hunspell on [ezwinports](https://sourceforge.net/projects/ezwinports/files/)
- Unzip in the folder where hunspell must be available
- Add the path to hunspell\bin to the Path environment variable
- Add an environment variable named DICTIONARY with the value of the default dictionary (like en_US)
- Download the [Hunspell french dictionary from LibreOffice](https://cgit.freedesktop.org/libreoffice/dictionaries/tree/fr_FR)
- Copy the following files to \hunspell\share\hunspell :
  - fr.aff
  - fr.dic
  - hyph-fr.dic
  - hyph-fr.tex
  - README_fr.txt
  - README_hyph_fr.txt
  - README_thes_fr.txt
  - thes_fr.dat

## Keybindings

See [keybindings.md](keybindings.md) for a general list of keybindings.

See [programming-keybindings.md](programming-keybindings.md) for list of keybindings related to programming.

## Packages

The packages used by this Emacs configuration are grouped in categories. The package management is defined in init.el. For the other categories, a file suffixed with -settings.el is available in /settings.

See [packages.md](packages.md) for a list of all the included packages.
