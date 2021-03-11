# .emacs.d

My personal Emacs configuration. It requires Emacs 27.

This repository should be cloned in the home folder of the current user. Since this repository has some Git submodules, it can be cloned with the recursive option to load the submodules immediately.

```shell
cd ~
git clone --recursive https://github.com/magoyette/.emacs.d.git
```

---

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Local settings](#local-settings)
  - [Org mode local settings](#org-mode-local-settings)
  - [Magit local settings](#magit-local-settings)
  - [LanguageTool settings](#languagetool-settings)
- [Git Submodules](#git-submodules)
  - [doctoc.el](#doctocel)
  - [flycheck-swagger-cli](#flycheck-swagger-cli)
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
  - [Node Tools](#node-tools)
    - [Node and npm](#node-and-npm)
    - [doctoc](#doctoc)
    - [HTML Language Server](#html-language-server)
    - [js-yaml](#js-yaml)
    - [JSON Language Server](#json-language-server)
    - [prettier](#prettier)
    - [stylelint](#stylelint)
    - [swagger-cli](#swagger-cli)
    - [TypeScript and tslint](#typescript-and-tslint)
    - [VS Code CSS Language Server](#vs-code-css-language-server)
    - [YAML Language Server](#yaml-language-server)
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

```elisp
(setq langtool-language-tool-jar "~/bin/LanguageTool-4.7/languagetool-commandline.jar")
```

## Git Submodules

This Emacs configuration depends on some packages that are in their initial development. These packages are not available on Melpa, so they are included in this repository as Git submodules.

The submodules can be added with the following command.

```shell
git submodule update --init
```

It's also possible to clone this repository with the submodules.

```shell
git clone --recursive https://github.com/magoyette/.emacs.d.git
```

### doctoc.el

[doctoc.el](https://github.com/magoyette/doctoc.el) is a package that adds support for [DocToc](https://github.com/thlorenz/doctoc) in Emacs.

### flycheck-swagger-cli

[flycheck-swagger-cli](https://github.com/magoyette/flycheck-swagger-cli) is a Flycheck checker for OpenAPI and Swagger files that uses swagger-cli.

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

The fonts from [all-the-icons.el](https://github.com/domtronn/all-the-icons.el/tree/master/fonts) must be installed since many packages use them.

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

```shell
java -version
javac -version
```

### Node Tools

#### Node and npm

Node and npm are required for many JavaScript libraries.

#### doctoc

doctoc is a JavaScript library used to generate the table of contents of a Markdown file.

doctoc can be installed with npm.

```shell
npm install -g doctoc
```

#### HTML Language Server

The HTML Language Server is used by lsp-mode.

```shell
npm install -g vscode-html-languageserver-bin
```

#### js-yaml

[js-yaml](https://github.com/nodeca/js-yaml) is a JavaScript YAML parser. It is used by Flycheck to check YAML files.

```shell
npm install -g js-yaml
```

#### JSON Language Server

The JSON language server is used by lsp-mode.

```shell
npm i -g vscode-json-languageserver
```

#### prettier

Prettier must be installed for the prettier-js package.

```shell
npm install -g prettier
```

#### stylelint

[stylelint](https://stylelint.io/) is used for static analysis of CSS, SASS and LESS files.

```shell
npm install -g stylelint
```

A stylelint configuration can be installed globally.

```shell
npm install -g stylelint-config-standard
```

#### swagger-cli

[Swagger/OpenAPI CLI](https://github.com/APIDevTools/swagger-cli) provides JavaScript tools to work with Swagger/OpenAPI. It is used by [flycheck-swagger-cli](https://github.com/magoyette/flycheck-swagger-cli) to validate Swagger/OpenAPI documents with Flycheck.

```
npm install -g @apidevtools/swagger-cli
```

#### TypeScript and tslint

A global installation of TypeScript, the TypeScript language server and tslint is necessary for lsp-mode and Flycheck. tslint will use the `tslint.json` file of the project directory.

```
npm install -g tslint typescript typescript-language-server
```

[tslint rules](https://palantir.github.io/tslint/rules/)

#### VS Code CSS Language Server

The VS Code CSS language server is used by lsp-mode for CSS, Less, SASS and SCSS.

```shell
npm install -g vscode-css-languageserver-bin
```

#### YAML Language Server

The YAML language server is used by lsp-mode for YAML files.

```shell
npm install -g yaml-language-server
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
