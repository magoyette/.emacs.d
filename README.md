# .emacs.d

My personal Emacs configuration. It requires Emacs 26. The configuration is optimized for Linux, but most of its features are compatible with Windows 10.

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
  - [LanguageTool settings](#languagetool-settings)
  - [Terminal-here settings](#terminal-here-settings)
  - [Elfeed settings](#elfeed-settings)
- [Git Submodules](#git-submodules)
  - [doctoc.el](#doctocel)
  - [flycheck-swagger-cli](#flycheck-swagger-cli)
  - [flycheck-swagger-tools](#flycheck-swagger-tools)
  - [openapi-yaml-mode](#openapi-yaml-mode)
  - [twee-mode](#twee-mode)
  - [twee-chapbook-mode](#twee-chapbook-mode)
- [External dependencies](#external-dependencies)
  - [Windows OS setup](#windows-os-setup)
    - [Windows HOME variable](#windows-home-variable)
  - [Fonts](#fonts)
    - [all-the-icons.el fonts](#all-the-iconsel-fonts)
  - [General Tools](#general-tools)
    - [Git](#git)
    - [LanguageTool](#languagetool)
    - [Pandoc](#pandoc)
    - [RipGrep](#ripgrep)
  - [Java Tools](#java-tools)
    - [JDK](#jdk)
    - [Leiningen](#leiningen)
  - [Node Tools](#node-tools)
    - [Node and npm](#node-and-npm)
    - [doctoc](#doctoc)
    - [HTML Language Server](#html-language-server)
    - [js-yaml](#js-yaml)
    - [stylelint](#stylelint)
    - [swagger-tools](#swagger-tools)
    - [TypeScript and tslint](#typescript-and-tslint)
  - [Python tools](#python-tools)
  - [VS Code CSS Language Server](#vs-code-css-language-server)
  - [Flycheck checkers](#flycheck-checkers)
    - [hadolint](#hadolint)
    - [ShellCheck](#shellcheck)
- [Keybindings](#keybindings)
- [Packages](#packages)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Local settings

This Emacs configuration requires the creation of a file named `local-settings.el` in the folder `~/.emacs.d`.

The `local-settings.el` file is used for configurations that vary depending on the computer.

### Org mode local settings

The `org-settings.el` file will try to call a function named `local-settings-set-org-agenda-files` to set the `org-agenda-files` variable.

This function should be defined in `local-settings.el`.

```elisp
(defun local-settings-set-org-agenda-files ()
  (setq org-agenda-files (list "~/org")))
```

### Magit local settings

`magit-repository-directories` can be set to configure which folders must be scanned by Magit when listing repositories (`C-x M-g`).

```elisp
(setq magit-repository-directories '(("~/.emacs.d" . 0)
                                     ("~/dev" . 3)))
```

### LanguageTool settings

The path to the LanguageTool jar must be configured.

``` elisp
(setq langtool-language-tool-jar "~/bin/LanguageTool-4.7/languagetool-commandline.jar")
```

### Terminal-here settings

The terminal opened by terminal-here can be configured.

``` elisp
(setq terminal-here-terminal-command (list "gnome-terminal"))
```

### Elfeed settings

Elfeed is an Atom/RSS reader. The feeds for Elfeed are configured in local settings.

``` elisp
(setq elfeed-feeds
      '(("https://planet.emacslife.com/atom.xml" emacs)))
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

### flycheck-swagger-cli

[flycheck-swagger-cli](https://github.com/magoyette/flycheck-swagger-cli) is a Flycheck checker for OpenAPI 2 and Swagger files that uses swagger-cli.

### flycheck-swagger-tools

[flycheck-swagger-tools](https://github.com/magoyette/flycheck-swagger-tools) is a Flycheck checker for OpenAPI 2 and Swagger files that uses swagger-tools.

### openapi-yaml-mode

[openapi-yaml-mode](https://github.com/magoyette/openapi-yaml-mode) is a major mode for OpenAPI YAML files.

### twee-mode

[twee-mode](https://github.com/magoyette/twee-mode) provide a minor mode for [Twine](http://twinery.org/) interactive fictions written with Twee files.

### twee-chapbook-mode

[twee-chapbook-mode](https://github.com/magoyette/twee-chapbook-mode) provide a major mode to write [Twine](http://twinery.org/) interactive fictions in the [Chapbook](https://github.com/klembot/chapbook) story format.

## External dependencies

### Windows OS setup

#### Windows HOME variable

An environment variable named `HOME` is required on a Windows OS to allow Emacs to find the `.emacs.d` folder. The value of `HOME` must be the absolute path to the home folder of the current Windows user (where the `.emacs.d` repo should have been cloned). Magit also needs the `HOME` variable to execute git push from Windows.

### Fonts

#### all-the-icons.el fonts

The neotree package is configured to use the [fonts of all-the-icons.el](https://github.com/domtronn/all-the-icons.el/tree/master/fonts).

### General Tools

#### Git

[Git](https://git-scm.com/) is required by [magit](https://github.com/magit/magit).

#### LanguageTool

[LanguageTool](https://www.languagetool.org/) is a tool for language spelling, style and grammar.

#### Pandoc

[Pandoc](http://pandoc.org/) is necessary to preview markdown documents with markdown-mode.

#### RipGrep

The package dumb-jump is configured to use [RipGrep](https://github.com/BurntSushi/ripgrep).

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

doctoc is a JavaScript library used to generate the table of contents of a Markdown file.

doctoc can be installed with npm.
```
npm install -g doctoc
```

#### HTML Language Server

The HTML Language Server is used by lsp-mode.

``` shell
npm install -g vscode-html-languageserver-bin
```

#### js-yaml

[js-yaml](https://github.com/nodeca/js-yaml) is a JavaScript YAML parser. It is used by Flycheck to check YAML files.

```
npm install -g js-yaml
```

#### stylelint

[stylelint](https://stylelint.io/) is used for static analysis of CSS, SASS and LESS files.

``` shell
sudo npm install -g stylelint
```

A stylelint configuration can be installed globally.

``` shell
sudo npm install -g stylelint-config-standard
```

#### swagger-tools

[Swagger Tools](https://github.com/apigee-127/swagger-tools/blob/master/docs/CLI.md) provides JavaScript tools to work with Swagger. It is used by Swaggermacs to check Swagger documents with Flycheck.

```
npm install -g swagger-tools
```

#### TypeScript and tslint

A global installation of TypeScript, the TypeScript language server and tslint is necessary for lsp-mode and Flycheck. tslint will use the `tslint.json` file of the project directory.

```
sudo npm install -g tslint typescript typescript-language-server
```

[tslint rules](https://palantir.github.io/tslint/rules/)

### Python tools

[sqlparse](https://github.com/andialbrecht/sqlparse) is used by the [sqlformat](https://github.com/purcell/sqlformat) package to format SQL.

``` shell
pip install --user --upgrade sqlparse
```

### VS Code CSS Language Server

The VS Code CSS language server is used by lsp-mode for CSS, Less, SASS and SCSS.

``` shell
sudo npm install -g vscode-css-languageserver-bin
```

### Flycheck checkers

#### hadolint

[hadolint](https://github.com/hadolint/hadolint) is a Dockerfile linter.

[hadolint rules](https://github.com/hadolint/hadolint#rules)

#### ShellCheck

[ShellCheck](https://github.com/koalaman/shellcheck) is used for static analysis of shell scripts.

[ShellCheck rules](https://github.com/koalaman/shellcheck/wiki)

## Keybindings

See [keybindings.md](keybindings.md) for a list of commonly used keybindings.

## Packages

The packages used by this Emacs configuration are grouped in categories. The package management is defined in `init.el`. For the other categories, a file suffixed with `-settings.el` is available in `/settings`.

See [packages.md](packages.md) for a list of all the included packages.
