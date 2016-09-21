# .emacs.d

My personal Emacs configuration. It requires Emacs 24 or 25. Most of the configuration is compatible with Windows 7 and Linux.

This repository should be cloned in the home folder of the current user.

***

- [Local settings](#local-settings)
  - [Org mode local settings](#org-mode-local-settings)
  - [Magit local settings](#magit-local-settings)
- [External dependencies](#external-dependencies)
  - [Windows HOME variable](#windows-home-variable)
  - [Git](#git)
  - [The Platinum Searcher](#the-platinum-searcher)
  - [Pandoc](#pandoc)
  - [Node and npm](#node-and-npm)
  - [TypeScript and tslint](#typescript-and-tslint)
  - [Leiningen](#leiningen)
  - [Haskell Tool Stack](#haskell-tool-stack)
  - [Elixir](#elixir)
  - [Hunspell](#hunspell)
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
  - [Help packages](#help-packages)
  - [Theme packages](#theme-packages)
- [Essential keybindings](#essential-keybindings)
  - [Package management keybindings](#package-management-keybindings)
  - [Dired keybindings](#dired-keybindings)
  - [Windows keybindings](#windows-keybindings)
  - [Helm keybindings](#helm-keybindings)
  - [Edition keybindings](#edition-keybindings)
  - [Narrowing keybindings](#narrowing-keybindings)
  - [Search and replace keybindings](#search-and-replace-keybindings)
  - [Search engines keybindings](#search-engines-keybindings)
  - [Company keybindings](#company-keybindings)
  - [YASnippet keybindings](#yasnippet-keybindings)
  - [Projectile keybindings](#projectile-keybindings)
  - [Flycheck keybindings](#flycheck-keybindings)
  - [Navigation keybindings](#navigation-keybindings)
  - [Magit keybindings](#magit-keybindings)
  - [Git timemachine keybindings](#git-timemachine-keybindings)
  - [Smerge keybindings](#smerge-keybindings)
  - [Org mode keybindings](#org-mode-keybindings)
  - [Markdown keybindings](#markdown-keybindings)
  - [Spelling keybindings](#spelling-keybindings)
  - [Web keybindings](#web-keybindings)
  - [REST keybindings](#rest-keybindings)
  - [Clojure keybindings](#clojure-keybindings)
  - [Haskell keybindings](#haskell-keybindings)
  - [Smartparens keybindings](#smartparens-keybindings)
  - [Help keybindings](#help-keybindings)
  - [Theme keybindings](#theme-keybindings)

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

## External dependencies

### Windows HOME variable

An environment variable named HOME is required on a Windows OS to allow Emacs to find the .emacs.d folder. The value of HOME must be the absolute path to the home folder of the current Windows user (where the .emacs.d repo should have been cloned). Magit also needs the HOME variable to execute git push from Windows.

### Git

[Git](https://git-scm.com/) is required by [magit](https://github.com/magit/magit).

### The Platinum Searcher

The package helm-ag is configured to use [The Platinum Searcher](https://github.com/monochromegane/the_platinum_searcher).

### Pandoc

[Pandoc](http://pandoc.org/) is necessary to preview markdown documents with markdown-mode.

### Node and npm

Node and npm are required for TypeScript development.

### TypeScript and tslint

A global installation of TypeScript and tslint is necessary to allow Flycheck to call tslint. tslint will use the tslint.json file of the project directory.

```
sudo npm install -g tslint typescript
```

### Leiningen

CIDER, the interactive development environment for Clojure, requires [Leiningen](http://leiningen.org).

### Haskell Tool Stack

Intero, the interactive development environment for Haskell, requires [Stack](haskellstack.org).

### Elixir

Alchemist requires [Elixir](http://elixir-lang.org/).

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

## Packages

The packages used by this Emacs configuration are grouped in categories. The package management is defined in init.el. For the other categories, a file suffixed with -settings.el is available in /settings.

### Package management

- [diminish](https://github.com/emacsmirror/diminish) : Hide or abbreviate minor modes.
- [paradox](https://github.com/Malabarba/paradox) : A better packages menu.
- [use-package](https://github.com/jwiegley/use-package): Package installation and configuration.

### Dired packages

- [peep-dired](https://github.com/asok/peep-dired) : Show file at point in Dired in another window.

### Emacs Lisp packages

- [eval-sexp-fu](https://github.com/hchbaw/eval-sexp-fu.el) : Highlight sexps during evaluation.

### Hydra packages

- [hydra](https://github.com/abo-abo/hydra) : Regroup related keybindings with a common prefix.

### Helm packages

- [helm](https://github.com/emacs-helm/helm) : Incremental completion and selection framework.

### Edition packages

- [aggressive-indent](https://github.com/Malabarba/aggressive-indent-mode) : Automatic indentation of code.
- [expand-region](https://github.com/magnars/expand-region.el) : Expand a region by semantic units.
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

### Org packages

- [org-mode](http://orgmode.org/) : Plain text notes, todos, agenda, etc.
- [org-bullets](https://github.com/sabof/org-bullets) : UTF-8 bullets for org-mode.
- [helm-org-rifle](https://github.com/alphapapa/helm-org-rifle) : Search through org files.
- [ace-link](https://github.com/abo-abo/ace-link) : Select a link to jump to with avy in an org buffer (also work with other modes like Info-mode).

### Markdown packages

- [markdown-mode](http://jblevins.org/projects/markdown-mode/) : Mode for Markdown files.

### Web packages

- [less-css-mode](https://github.com/purcell/less-css-mode) : Mode for LESS.
- [scss-mode](https://github.com/antonj/scss-mode) : Mode for .scss Sass files.
- [sass-mode](https://github.com/nex3/sass-mode) : Mode for .sass Sass files.
- [helm-css-scss](https://github.com/ShingoFukuyama/helm-css-scss) : Helm for CSS, LESS and Sass selectors.
- [web-mode](http://web-mode.org/) : Mode for web templates.
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

### Help packages

- [helm-descbinds](https://github.com/emacs-helm/helm-descbinds) : Helm interface for describe bindings command.
- [which-key](https://github.com/justbur/emacs-which-key) : Display available keybindings.

### Theme packages

- [page-break-lines](https://github.com/purcell/page-break-lines) : Display page break as lines.
- [rainbow-delimiters](https://github.com/Fanael/rainbow-delimiters) : Highlight delimiters according to their depth.
- [spaceline](https://github.com/TheBB/spaceline) : The Powerline theme from Spacemacs.
- [zenburn-theme](https://github.com/bbatsov/zenburn-emacs) : The Zenburn theme for Emacs.

## Essential keybindings

### Package management keybindings

- C-x p : List packages with Paradox

### Dired keybindings

- C-x d : open dired mode
- C-x C-j : show current file in dired

#### Dired mode

- j : jump to file
- > : move to next directory
- < : move to previous directory
- ^ : move to the parent directory (..)
- g : refresh
- + : create a new file
- s : alternate between sort by name and date
- m : mark a file
- % m [regex] : mark all fiels that match a regex
- u : unmark a file
- U : unmark all files
- * t : invert marking of files
- * s : mark all files
- P : show file in another windows with peep-dired
- C : copy file under cursor or marked files
- R : rename file under cursor or marked files
- D : delete file under cursor or marked files
- C-x C-q : switch to editing mode to rename files (save buffer to save changes)
- Q : run query-replace on marked files
- Z : compress/decompress
- c : compress many marked files to a single archive
- q : exit dired

### Windows keybindings

- M-1, M-2, ... : move to a numbered window

### Helm keybindings

- Helm
  - <tab> : execute persistent action
  - C-i : execute persistent action
  - C-z : select action
- C-x C-b : Helm mini
- C-x b : Helm buffers list
- C-x C-f : Helm find files
- C-x C-r : Helm recent files
- C-x f : Helm multi (combines buffers list, find files and recent files)
- M-x : Helm execute command
- M-y : Helm show kill ring
- C-c <SPC> : Helm all mark rings
- C-x r b : Helm filtered bookmarks
- M-s d : Helm search inside a directory with the platinum searcher
- M-s p : Helm search inside project root with the platinum searcher

### Edition keybindings

- C-RET : Add a new line below
- C-S-RET : Add a new line above
- M-j : Collapse lines
- C-= : Expand region by semantic units

#### Undo tree keybindings

- C-x u : visualize undo tree
  - p : undo
  - n : redo
  - b : switch to previous branch
  - f : switch to next branch
  - t : toggle timestamps
  - s : toggle selection mode
  - q : quit undo tree

#### Rectangle mark mode keybindings

- C-x SPC : enable rectangle-mark-mode for rectangular selection

#### Multiple cursors keybindings

- C-S-c C-S-c : Edit lines in region with multiple cursors
- C-> : Add a cursor to the next expression like the selected region
- C-< : Add a cursor to the previous expression like the selected region
- C-c C-< : Add a cursor to all expressions in the buffer like the selected region

### Narrowing keybindings

- C-x n : narrow or widen a region, an org block, an org subtree or a defun.
- C-u C-x n : narrow a narrowed buffer

### Search and replace keybindings

- C-s : regexp forward search
- C-r : regexp backward search
- C-M-s : search forward
- C-M-r : search backward
- M-% : Anzu query replace
- C-M-% : Anzy query replace regexp
- M-i : Helm swoop
  - C-r : previous line
  - C-s : next line
  - C-SPC : choose lines to edit
  - C-c C-e : enter edit mode
  - C-x C-s : apply edit mode changes
- C-c M-i : Helm multi swoop on selected buffers
- C-x M-i : Helm multi swoop on all buffers
- M-s d : Helm search with The Platinum Searcher in directory
- M-s p : Helm search with The Platinum Searcher in project root

### Search engines keybindings

- C-c / d : query with DuckDuckGo
- C-c / h : query with GitHub
- C-c / g : query with Google
- C-c / s : query with StackOverflow
- C-c / w : query with Wikipedia

### Navigation keybindings

- M-g M-g : Go to line number
- C-, : Input one char, then jump to a character
- C-' : Input 2 chars, then jump to a character
- M-g f : Jump the beginning of a line
- M-g w : Input one char, then jump to the beginning of a word

### Company keybindings

- TAB : Company mode expand
- C-: : Helm company
- C-c f : Trigger expanson of a file path with company

### YASnippet keybindings

- C-TAB : Expand snippet
- S-TAB : Insert a snippet

### Projectile keybindings

For the commands that find files, C-u can be done before the command to first invalidate the cache of the project files.

- C-c p h : Helm projectile (switch to buffer, find file, switch project)
- C-c p b : Switch to buffer
- C-c p p : Switch project
- C-c p f : Find file
- C-c p F : Find file in all known projects
- C-c p g : Find file based on context at point
- C-c p d : Find directory
- C-c p e : Find recent file

### Flycheck keybindings

- C-c ! n : Jump to next error
- M-g n : Jump to next error
- C-c ! p : Jump to previous error
- M-g p : Jump to previous error
- C-c ! l : List all errors in buffer
- C-c ! h : List all errors in buffer with Helm
- C-c ! v : Verify the Flycheck setup for current buffer and display enabled checkers
- C-c ! ? : Prompt for a checker and display its documentation

#### Flycheck error list keybindings

- RET : Go to current error
- n : jump to next error
- p : jump to previous error
- g : check buffer and update error list
- q : quit error list

### Magit keybindings

- C-x g : Magit status
- C-x M-g : Magit list repositories
- C-x G : Magit blame
  - RET : Show commit at point
  - SPC : Update commit buffer with the thing at point or scroll buffer up
  - DEL : Update commit buffer with the thing at point or scroll buffer down
  - n : move to next blame chunk
  - N : move to next blame chunk from same commit
  - p : move to previous blame chunk
  - P : move to previous blame chunk from same commit
  - M-w : copy hash of the commit from the current chunk
  - q : exit Magit blame
- In Magit commit buffer
  - C-c C-c : Finish commit
  - C-c C-k : Cancel commit

### Git timemachine keybindings

- C-x t : Git timemachine
  - p : previous version
  - n : next version
  - w : copy abbreviated hash of current version
  - q : exit Git timemachine

### Smerge keybindings

- C-c s : Hydra for smerge-mode

### Org mode keybindings

- C-c l : Org store link
- M-o : Select a link to jump to with avy
- C-c c : Org capture
- C-c a : Org agenda
- C-c o b : Search in all opened org files with helm-org-rifle
- C-c o d : Search in the org files of a directory with helm-org-rifle

### Markdown keybindings

- C-c C-c m : preview Markdown html
- C-c C-c p : preview Markdown file in browser
- C-c C-c l : preview Markdown in real time in an Emacs Web Wowser buffer
- C-c C-o : open link at point in a browser
- M-Up : Move list item up
- M-Down : Move list item down
- M-Right : Increase indent of list item
- M-LEFT : Decrease indent of list item
- C-c C-n : Move to next heading
- C-c C-p : Move to previous heading

### Spelling keybindings

- C-c d : Alternate between english and french dictionaries
- C-c s : Start ispell on the region or on the buffer

### Web keybindings

- C-c c : Helm for CSS, LESS and Sass selectors.

### REST keybindings

- C-c C-c : run a query and pretty print response
- C-c C-r : run a query and display response
- C-c C-g : Helm for rest-client variables and requests

### Clojure keybindings

- C-c M-j : cider-jack-in
- C-c C-m : clj-refactor
- C-c C-m hh : Hydra menu for clj-refactor
- C-c C-h : clojure cheatsheet

#### cider general keybindings

- C-c C-z : switch between the REPL buffer and the Clojure(Script) buffer
- C-c C-q : quit current nREPL connection
- C-c M-n : switch namespace of the REPL buffer to the namespace of the current buffer
- C-c C-. : jump to a namespace on the classpath
- C-c C-k : load the current buffer
- C-c C-u : undefine symbol
- M-. : jump to definition of a symbol
- M-, : return to pre-jump location
- M-TAB : complete symbol at point

#### cider eval keybindings

- C-c C-e : Evaluate the form preceding point and output result in echo area
- C-c M-e : Evaluate the form preceding point and output result to the REPL buffer
- C-c C-p : Evaluate the form preceding point and pretty print result in a popup buffer
- C-c M-p : Load the form preceding point in the REPL buffer
- C-c C-b : Interrupt pending evaluations
- C-c C-x : reload all modified files in classpath
- C-u C-c C-x : reload all files in classpath

#### cider documentation keybindings

- C-c C-d d : doc string for symbol at point
- C-c C-d j : display Javadoc in default browser for symbol at point
- C-c C-d r : search symbol in Grimoire

#### cider tests keybindings

- C-c C-t C-t : run test at point
- C-c C-t C-n : run tests for current namespace
- C-c C-t C-p : run tests for all project namespaces (load the additional namespaces)
- C-c C-t C-r : re-run failed tests
- C-c C-t C-b : show test report buffer

#### cider-test-results keybindings

- M-p/n : navigate through tests
- M-. : jump to test definition
- d : diff of actual vs expected
- e : display cause and stacktrace of failed test

#### cider tools keybindings

- C-c C-m : macroexpand-1 on the form at point
- C-u C-c C-m : macroexpand on the form at point
- C-c M-m : macroexpand-all on the form at point
- C-c M-i : inspect structure of the result of an expression
- C-c M-t v : toggle tracing of the results of a var
- C-c M-t n : toggle tracing of the results of all the vars of a namespace

#### cider-repl-mode keybindings

- RET : Evaluate current input in Clojure or open a new line
- C-RET : Close unmatched parenthesis then evaluate current input
- C-u C-c C-o : clear REPL buffer
- C-c M-o : switch between Clojure and ClojureScript REPLs
- C-up/down : navigate history of inputs
- TAB : complete symbol at point
- C-c M-n : switch to a namespace

#### cider debugging keybindings

- C-u C-c C-c : Debug the top level form under point and walk through its evaluation (defn must be evaluated to remove its instrumentation)

#### cider-stacktrace-mode keybindings

- M-p/n : navigate through causes
- M-. : jump to source location for stacktrace frame
- j : toggle display of Java frames
- c : toggle display of Clojure frames
- r : toggle display of REPL frames
- t : toggle display of tooling frames
- d : toggle display of duplicate frames

### Haskell keybindings

### Intero keybindings

- M-. : Jump to definition
- C-c C-i : Show information of identifier at point
- C-c C-t : Show the type of thing at point, or the selection
- C-u C-c C-t : Insert a type signature for the thing at point
- C-c C-l : Load this module in the REPL
- C-c C-r : Apply suggestions from GHC
- C-c C-k : Clear REPL
- C-c C-z : Switch to and from the REPL

### Smartparens keybindings

#### Smartparens navigation

- C-M-f : Jump after next balanced expression
- C-M-b : Jump before the previous balanced expression
- C-S-a : Jump to the end of the current balanced expression
- C-S-d : Jump to the beginning of the currente balanced expression
- C-M-d : Jump down one level after the opening pair of the next balanced expression
- C-M-a : Jump down backward one level from the current balanced expression
- C-M-e : Jump up one level from the current balanced expression
- C-M-u : Jump up backward one level from the current balanced expression
- C-M-n : Jump to the beginning of the following balanced expression
- C-M-p : Jump to the end of the previous balanced expression

#### Smartparens manipulation

- C-M-k : Kill the next balanced expression (if there's no next expression, kill enclosing expression)
- C-M-w : Copy the next balanced expression
- M-<delete> : Remove the wrapping pair from the following expression
- M-<backspace> : Remove the wrapping pair from the previous expression
- C-M-t : Transpose the adjacent balanced expressions (swap the expressions)
- C-<right> : Extend the current list by one element by moving the closing delimiter
- C-<left> : Contract the current list by one element by moving the closing delimiter
- C-M-<left> : Extend the current list by one element by moving the opening delimiter
- C-M-<right> : Contract the current list by one element by moving the opening delimiter
- M-D : Remove the wrapping pair from this expression
- C-M-<delete> :  Remove the wrapping pair from this expression and kill everything from the end of expression before (point) to end of this expression
- C-M-<backspace> :  Remove the wrapping pair from this expression and kill everything from the beginning of this expression to beginning of expression after (point)
- C-S-<backspace> : Remove the wrapping pair from this expression and kill everything inside save for ARG next expressions

### Help keybindings

- C-h a : Helm apropos
- C-h i : Helm info
- C-h b : Helm describe bindings

### Theme keybindings

- C-+ : Increase text scale
- C-- : Decrease text scale
