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
  - [Flycheck Checkstyle local settings](#flycheck-checkstyle-local-settings)
- [Git Submodules](#git-submodules)
  - [doctoc.el](#doctocel)
  - [Flycheck Checkstyle](#flycheck-checkstyle)
  - [prometheus-rules-mode](#prometheus-rules-mode)
- [External dependencies](#external-dependencies)
  - [Windows OS setup](#windows-os-setup)
    - [Windows HOME variable](#windows-home-variable)
  - [General Tools](#general-tools)
    - [Git](#git)
    - [Pandoc](#pandoc)
    - [The Platinum Searcher](#the-platinum-searcher)
  - [Java Tools](#java-tools)
    - [JDK](#jdk)
    - [Leiningen](#leiningen)
    - [CheckStyle](#checkstyle)
  - [Node Tools](#node-tools)
    - [Node and npm](#node-and-npm)
    - [doctoc](#doctoc)
    - [TypeScript and tslint](#typescript-and-tslint)
  - [Other Programming Languages](#other-programming-languages)
    - [Elixir](#elixir)
    - [Haskell Tool Stack](#haskell-tool-stack)
  - [Hunspell](#hunspell)
    - [Hunspell on Linux](#hunspell-on-linux)
    - [Hunspell on Windows](#hunspell-on-windows)
- [Keybindings](#keybindings)
- [Packages](#packages)
  - [Package management](#package-management)
  - [Dired packages](#dired-packages)
  - [Emacs Lisp packages](#emacs-lisp-packages)
  - [Hydra packages](#hydra-packages)
  - [Helm packages](#helm-packages)
  - [Edition packages](#edition-packages)
  - [Search and replace packages](#search-and-replace-packages)
  - [Search engines packages](#search-engines-packages)
  - [Company packages](#company-packages)
  - [YASnippet packages](#yasnippet-packages)
  - [Projectile packages](#projectile-packages)
  - [Flycheck packages](#flycheck-packages)
  - [Navigation packages](#navigation-packages)
  - [Git packages](#git-packages)
  - [Org packages](#org-packages)
  - [Markdown packages](#markdown-packages)
  - [Web packages](#web-packages)
  - [YAML packages](#yaml-packages)
  - [REST packages](#rest-packages)
  - [Cucumber packages](#cucumber-packages)
  - [Clojure packages](#clojure-packages)
  - [Haskell packages](#haskell-packages)
  - [Elixir packages](#elixir-packages)
  - [Smartparens packages](#smartparens-packages)
  - [Docker packages](#docker-packages)
  - [Prometheus packages](#prometheus-packages)
  - [Apache Thrift packages](#apache-thrift-packages)
  - [Help packages](#help-packages)
  - [Theme packages](#theme-packages)

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
                                     "~/.gitignore_global"))
```

### Flycheck Checkstyle local settings

Flycheck Checkstyle is a Flycheck checker for Java code. It needs to be configured with the path to the Checkstyle jar and the path to a configuration file (ex: the [Google Java Style](https://github.com/checkstyle/checkstyle/blob/master/src/main/resources/google_checks.xml) configuration).

``` elisp
(setq flycheck-checkstyle-jar "/home/<user>/dev/tools/checkstyle/checkstyle-7.3-all.jar")

(setq flycheck-checkstyle-configuration-file "/home/<user>/dev/tools/checkstyle/google_checks.xml")
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

### Flycheck Checkstyle

[Flycheck Checkstyle](https://github.com/magoyette/flycheck-checkstyle) is an Emacs Flycheck checker for CheckStyle.

### prometheus-rules-mode

[prometheus-rules-mode](https://github.com/magoyette/prometheus-rules-mode) is a package that adds support for [Prometheus](https://prometheus.io) rules in Emacs.

## External dependencies

### Windows OS setup

#### Windows HOME variable

An environment variable named HOME is required on a Windows OS to allow Emacs to find the .emacs.d folder. The value of HOME must be the absolute path to the home folder of the current Windows user (where the .emacs.d repo should have been cloned). Magit also needs the HOME variable to execute git push from Windows.

### General Tools

#### Git

[Git](https://git-scm.com/) is required by [magit](https://github.com/magit/magit).

#### Pandoc

[Pandoc](http://pandoc.org/) is necessary to preview markdown documents with markdown-mode.

#### The Platinum Searcher

The package helm-ag is configured to use [The Platinum Searcher](https://github.com/monochromegane/the_platinum_searcher).

### Java Tools

#### JDK

Many dependencies of this Emacs configuration need a JDK available in the path of the OS. The following commands should print the versions of the JRE and JDK currently available.

``` shell
java -version
javac -version
```

#### Leiningen

CIDER, the interactive development environment for Clojure, requires the [Leiningen](http://leiningen.org) build tool.

#### CheckStyle

Flycheck Checkstyle requires Checkstyle. Its configuration is described in [Flycheck Checkstyle local settings](#flycheck-checkstyle-local-settings).

### Node Tools

#### Node and npm

Node and npm are required for many JavaScript libraries.

#### doctoc

doctoc is a JavaScript library used to generate the table of contents of a markdown file.

doctoc can be installed with npm.
```
npm install -g doctoc
```

#### TypeScript and tslint

A global installation of TypeScript and tslint is necessary to allow Flycheck to call tslint. tslint will use the tslint.json file of the project directory.

```
sudo npm install -g tslint typescript
```

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

See [keybindings.md](keybindings.md) for a list of keybindings.

## Packages

The packages used by this Emacs configuration are grouped in categories. The package management is defined in init.el. For the other categories, a file suffixed with -settings.el is available in /settings.

### Package management

- [diminish](https://github.com/emacsmirror/diminish) : Hide or abbreviate minor modes.
- [paradox](https://github.com/Malabarba/paradox) : A better packages menu.
- [use-package](https://github.com/jwiegley/use-package): Package installation and configuration.

### Dired packages

- [peep-dired](https://github.com/asok/peep-dired) : Show file at point in Dired in another window.

### Emacs Lisp packages

- [cask-mode](https://github.com/Wilfred/cask-mode) : A mode for Cask files.
- [eval-sexp-fu](https://github.com/hchbaw/eval-sexp-fu.el) : Highlight sexps during evaluation.

### Hydra packages

- [hydra](https://github.com/abo-abo/hydra) : Regroup related keybindings with a common prefix.

### Helm packages

- [helm](https://github.com/emacs-helm/helm) : Incremental completion and selection framework.

### Edition packages

- [aggressive-indent](https://github.com/Malabarba/aggressive-indent-mode) : Automatic indentation of code.
- [expand-region](https://github.com/magnars/expand-region.el) : Expand a region by semantic units.
- [highlight-indentation](https://github.com/antonj/Highlight-Indentation-for-Emacs) : Displays guidelines for indentation.
- [multiple-cursors](https://github.com/magnars/multiple-cursors.el) : Add multiple cursors to Emacs.
- [undo-tree](https://melpa.org/#/undo-tree) : Visualize undo history as a tree of changes.

### Search and replace packages

- [anzu](https://github.com/syohex/emacs-anzu) : Display current and total matches when doing searches.
- [helm-ag](https://github.com/syohex/emacs-helm-ag) : Integrate The Platinum Searcher with Helm.
- [helm-swoop](https://github.com/ShingoFukuyama/helm-swoop) : Package to search and replace or navigate through a buffer.

### Search engines packages

- [engine-mode](https://github.com/hrs/engine-mode) : Query search engines from Emacs.

### Company packages

- [company](https://company-mode.github.io/) : Completion system.
- [company-quickhelp](https://github.com/expez/company-quickhelp) : Documentation popups for company.
- [helm-company](https://github.com/manuel-uberti/helm-company) : Helm interface for company mode.

### YASnippet packages

- [yasnippet](https://github.com/capitaomorte/yasnippet) : Template system.

### Projectile packages

- [projectile](https://github.com/bbatsov/projectile) : Library to work with projects.
- [helm-projectile](https://github.com/bbatsov/projectile) : Helm interface for projectile.

### Flycheck packages

- [flycheck](https://github.com/flycheck/flycheck) : Syntax checking.
- [flycheck-pos-tip](https://github.com/flycheck/flycheck-pos-tip) : Show flycheck issues in tooltip.
- [helm-flycheck](https://github.com/yasuyk/helm-flycheck) : Helm interface for flycheck.

### Navigation packages

- [avy](https://github.com/abo-abo/avy) : Jump to a specific position in buffer.

### Git packages

- [diff-hl](https://github.com/dgutov/diff-hl): Highlight uncommited changes.
- [git-modes](https://github.com/magit/git-modes): Modes for gitconfig, gitattributes and gitignore files.
- [git-timemachine](https://github.com/pidu/git-timemachine): Package to navigate through the versions of a file tracked with Git.
- [magit](https://github.com/magit/magit): Git porcelain for Emacs.
- [browse-at-remote](https://github.com/rmuslimov/browse-at-remote): Open current buffer at GitHub, GitLab or BitBucket.

### Org packages

- [org-mode](http://orgmode.org/) : Plain text notes, todos, agenda, etc.
- [org-bullets](https://github.com/sabof/org-bullets) : UTF-8 bullets for org-mode.
- [helm-org-rifle](https://github.com/alphapapa/helm-org-rifle) : Search through org files.
- [ace-link](https://github.com/abo-abo/ace-link) : Select a link to jump to with avy in an org buffer (also work with other modes like Info-mode).

### Markdown packages

- [markdown-mode](http://jblevins.org/projects/markdown-mode/) : Mode for Markdown files.
- [doctoc.el](https://github.com/magoyette/doctoc.el) : Support for [DocToc](https://github.com/thlorenz/doctoc) in Emacs.

### Web packages

- [less-css-mode](https://github.com/purcell/less-css-mode) : Mode for LESS.
- [sass-mode](https://github.com/nex3/sass-mode) : Mode for .sass Sass files.
- [helm-css-scss](https://github.com/ShingoFukuyama/helm-css-scss) : Helm for CSS, LESS and Sass selectors.
- [web-mode](http://web-mode.org/) : Mode for web templates.
- [emmet-mode](https://github.com/smihica/emmet-mode) : Support for Emmet in Emacs.
- [js2-mode](https://github.com/mooz/js2-mode) : Mode for JavaScript.
- [js2-refactor](https://github.com/magnars/js2-refactor.el) : Mode to refactor JavaScript code.
- [json-mode](https://github.com/joshwnj/json-mode) : Mode for JSON files.
- [json-reformat](https://github.com/gongo/json-reformat) : Mode to reformat JSON files.
- [typescript-mode](https://github.com/ananthakumaran/typescript.el) : Mode for TypeScript files.
- [tide](https://github.com/ananthakumaran/tide) : TypeScript Interactive Development Environment for Emacs.

### YAML packages

- [yaml-mode](https://github.com/yoshiki/yaml-mode) : Mode for YAML files.

### REST packages

- [rest-client](https://github.com/pashky/restclient.el) : REST client for Emacs.
- [restclient-helm](https://github.com/pashky/restclient.el) : Helm interface to restclient.
- [company-restclient](https://github.com/iquiw/company-restclient) : Company completion for HTTP methods and headers in rest-client.

### Cucumber packages

- [feature-mode](https://github.com/michaelklishin/cucumber.el) : Mode for Gherkin and Cucumber.

### Clojure packages

- [clojure-mode](https://github.com/clojure-emacs/clojure-mode) : Mode for Clojure and ClojureScript programming.
- [CIDER](https://github.com/clojure-emacs/cider) : Clojure(Script) Interactive Development Environment that Rocks.
- [cider-eval-sexp-fu](https://github.com/clojure-emacs/cider-eval-sexp-fu) : Highlight Clojure(Script) sexps during evaluation.
- [squiggly-clojure](https://github.com/clojure-emacs/squiggly-clojure) : Flycheck for Clojure. Supports eastwood, core.typed and kibit.
- [clj-refactor](https://github.com/clojure-emacs/clj-refactor.el) : Refactoring functions for Clojure.
- [clojure-cheatsheet](https://github.com/clojure-emacs/clojure-cheatsheet) : The Clojure Cheatsheet in Emacs.

### Haskell packages

- [haskell-mode](https://github.com/haskell/haskell-mode) : Mode for Haskell programming.
- [intero](https://github.com/commercialhaskell/intero) : Interactive development environment for Haskell.

### Elixir packages

- [elixir-mode](https://github.com/elixir-lang/emacs-elixir) : Mode for Elixir programming.
- [alchemist](https://github.com/tonini/alchemist.el) : Interactive development environment for Elixir.

### Smartparens packages

- [smartparens](https://github.com/Fuco1/smartparens) : Mode to handle pairs of symbols.

### Docker packages

- [dockerfile-mode](https://github.com/spotify/dockerfile-mode) : Mode to edit Dockerfiles.
- [docker.el](https://github.com/Silex/docker.el): Commands to manage Docker from Emacs.
- [docker-tramp.el](https://github.com/emacs-pe/docker-tramp.el): A TRAMP method to connect to Docker containers.

### Prometheus packages

- [prometheus-rules-mode](https://github.com/magoyette/prometheus-rules-mode) : Support for [Prometheus](https://prometheus.io) rules in Emacs.

### Apache Thrift packages

- [thrift](https://github.com/apache/thrift/blob/master/contrib/thrift.el) : Support for Apache Thrift files.

### Help packages

- [helm-descbinds](https://github.com/emacs-helm/helm-descbinds) : Helm interface for describe bindings command.
- [which-key](https://github.com/justbur/emacs-which-key) : Display available keybindings.

### Theme packages

- [page-break-lines](https://github.com/purcell/page-break-lines) : Display page break as lines.
- [rainbow-delimiters](https://github.com/Fanael/rainbow-delimiters) : Highlight delimiters according to their depth.
- [spaceline](https://github.com/TheBB/spaceline) : The Powerline theme from Spacemacs.
- [zenburn-theme](https://github.com/bbatsov/zenburn-emacs) : The Zenburn theme for Emacs.
