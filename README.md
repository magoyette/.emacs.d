# .emacs.d

My personal Emacs configuration. It requires Emacs 24 or 25. Most of the configuration is compatible with Windows 7 and Linux. 

This repository should be cloned in the home folder of the current user.

***

- [External dependencies](#external-dependencies)
  - [Windows HOME variable](#windows-home-variable)
  - [Git](#git)

## External dependencies

### Windows HOME variable

An environment variable named HOME is required on a Windows OS to allow Emacs to find the .emacs.d folder. The value of HOME must be the absolute path to the home folder of the current Windows user (where the .emacs.d repo should have been cloned). Magit also needs the HOME variable to execute git push from Windows.

### Git

[Git](https://git-scm.com/) is required by [magit](https://github.com/magit/magit).
