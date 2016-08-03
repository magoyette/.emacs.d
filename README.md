# .emacs.d

My personal Emacs configuration. It requires Emacs 24 or 25. Most of the configuration is compatible with Windows 7 and Linux.

This repository should be cloned in the home folder of the current user.

***

- [External dependencies](#external-dependencies)
  - [Windows HOME variable](#windows-home-variable)
  - [Git](#git)
  - [Pandoc](#pandoc)
- [Packages](#packages)
  - [Package management](#package-management)
  - [Helm packages](#helm-packages)
  - [Edition packages](#edition-packages)
  - [Search and replace packages](#search-and-replace-packages)
  - [Company packages](#company-packages)
  - [Flycheck packages](#flycheck-packages)
  - [Git packages](#git-packages)
  - [Org packages](#org-packages)
  - [Markdown packages](#markdown-packages)
  - [Web packages](#web-packages)
  - [YAML packages](#yaml-packages)
  - [REST packages](#rest-packages)
  - [Cucumber packages](#cucumber-packages)
  - [Theme packages](#theme-packages)
- [Essential keybindings](#essential-keybindings)
  - [Windows keybindings](#windows-keybindings)
  - [Helm keybindings](#helm-keybindings)
  - [Edition keybindings](#edition-keybindings)
  - [Search and replace keybindings](#search-and-replace-keybindings)
  - [Company keybindings](#company-keybindings)
  - [Flycheck keybindings](#flycheck-keybindings)
  - [Navigation keybindings](#navigation-keybindings)
  - [Magit keybindings](#magit-keybindings)
  - [Git timemachine keybindings](#git-timemachine-keybindings)
  - [Org mode keybindings](#org-mode-keybindings)
  - [Markdown keybindings](#markdown-keybindings)
  - [Web keybindings](#web-keybindings)
  - [REST keybindings](#rest-keybindings)
  - [Theme keybindings](#theme-keybindings)

## External dependencies

### Windows HOME variable

An environment variable named HOME is required on a Windows OS to allow Emacs to find the .emacs.d folder. The value of HOME must be the absolute path to the home folder of the current Windows user (where the .emacs.d repo should have been cloned). Magit also needs the HOME variable to execute git push from Windows.

### Git

[Git](https://git-scm.com/) is required by [magit](https://github.com/magit/magit).

### Pandoc

[Pandoc](http://pandoc.org/) is necessary to preview markdown documents with markdown-mode.

## Packages

The packages used by this Emacs configuration are grouped in categories. The package management is defined in init.el. For the other categories, a file suffixed with -settings.el is available in /settings.

### Package management

- [use-package](https://github.com/jwiegley/use-package): Package installation and configuration.

### Helm packages

- [helm](https://github.com/emacs-helm/helm) : Incremental completion and selection framework.

### Edition packages

- [aggressive-indent](https://github.com/Malabarba/aggressive-indent-mode) : Automatic indentation of code.

### Search and replace packages

- [anzu](https://github.com/syohex/emacs-anzu) : Display current and total matches when doing searches.
- [helm-swoop](https://github.com/ShingoFukuyama/helm-swoop) : Package to search and replace or navigate through a buffer.

### Company packages

- [company](https://company-mode.github.io/) : Completion system.
- [helm-company](https://github.com/manuel-uberti/helm-company) : Helm interface for company mode.

### Flycheck packages

- [flycheck](https://github.com/flycheck/flycheck) : Syntax checking.
- [flycheck-pos-tip](https://github.com/flycheck/flycheck-pos-tip) : Show flycheck issues in tooltip.

### Git packages

- [diff-hl](https://github.com/dgutov/diff-hl): Highlight uncommited changes.
- [git-modes](https://github.com/magit/git-modes): Modes for gitconfig, gitattributes and gitignore files.
- [git-timemachine](https://github.com/pidu/git-timemachine): Package to navigate through the versions of a file tracked with Git.
- [magit](https://github.com/magit/magit): Git porcelain for Emacs.

### Org packages

- [org-mode](http://orgmode.org/) : Plain text notes, todos, agenda, etc.
- [org-bullets](https://github.com/sabof/org-bullets) : UTF-8 bullets for org-mode.
- [helm-org-rifle](https://github.com/alphapapa/helm-org-rifle) : Search through org files.

### Markdown packages

- [markdown-mode](http://jblevins.org/projects/markdown-mode/) : Mode for Markdown files.

### Web packages

- [less-css-mode](https://github.com/purcell/less-css-mode) : Mode for LESS.
- [scss-mode](https://github.com/antonj/scss-mode): Mode for Sass.
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

### Theme packages

- [page-break-lines](https://github.com/purcell/page-break-lines) : Display page break as lines.
- [rainbow-delimiters](https://github.com/Fanael/rainbow-delimiters) : Highlight delimiters according to their depth.
- [spaceline](https://github.com/TheBB/spaceline) : The Powerline theme from Spacemacs.
- [zenburn-theme](https://github.com/bbatsov/zenburn-emacs) : The Zenburn theme for Emacs.

## Essential keybindings

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
- M-x : Helm execute command
- M-y : Helm show kill ring
- C-c <SPC> : Helm all mark rings
- C-x r b : Helm filtered bookmarks
- C-h a : Helm apropos
- C-h i : Helm info emacs
- M-s d : Helm search inside a directory with the platinum searcher
- M-s p : Helm search inside project root with the platinum searcher

### Edition keybindings

- C-RET : Add a new line below
- C-S-RET : Add a new line above
- M-j : Collapse lines

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

### Navigation keybindings

- M-g M-g : Go to line number

### Company keybindings

- TAB : Company mode expand
- C-: : Helm company

### Flycheck keybindings

- C-c ! n : Jump to next error
- M-g n : Jump to next error
- C-c ! p : Jump to previous error
- M-g p : Jump to previous error
- C-c ! l : List all errors in buffer
- C-c ! v : Verify the Flycheck setup for current buffer and display enabled checkers
- C-c ! ? : Prompt for a checker and display its documentation

#### Flycheck error list keybindings

RET : Go to current error
n : jump to next error
p : jump to previous error
g : check buffer and update error list
q : quit error list

### Magit keybindings

- C-x g : Magit status
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

### Org mode keybindings

- C-c l : Org store link
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

### Web keybindings

- C-c c : Helm for CSS, LESS and Sass selectors.

### REST keybindings

C-c C-c : run a query and pretty print response
C-c C-r : run a query and display response
C-c C-g : Helm for rest-client variables and requests

### Theme keybindings

- C-+ : Increase text scale
- C-- : Decrease text scale
