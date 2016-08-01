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
  - [Git packages](#git-packages)
  - [Markdown packages](#markdown-packages)
- [Essential keybindings](#essential-keybindings)
  - [Helm keybindings](#helm-keybindings)
  - [Magit keybindings](#magit-keybindings)
  - [Git timemachine keybindings](#git-timemachine-keybindings)
  - [Markdown keybindings](#markdown-keybindings)

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

### Git packages

- [diff-hl](https://github.com/dgutov/diff-hl): Highlight uncommited changes.
- [git-modes](https://github.com/magit/git-modes): Modes for gitconfig, gitattributes and gitignore files.
- [git-timemachine](https://github.com/pidu/git-timemachine): Package to navigate through the versions of a file tracked with Git.
- [magit](https://github.com/magit/magit): Git porcelain for Emacs.

### Markdown packages

- [markdown-mode](http://jblevins.org/projects/markdown-mode/) : Mode for Markdown files.

## Essential keybindings

### Helm keybindings

- C-x C-b : Helm mini
- C-x b : Helm buffers list
- C-x C-f : Helm find files
- C-x C-r : Helm recent files
- M-x : Helm execute command
- M-s d : Helm search inside a directory with the platinum searcher
- M-s p : Helm search inside project root with the platinum searcher

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
