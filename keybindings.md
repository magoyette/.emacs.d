# Keybindings

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Help](#help)
- [Packages](#packages)
- [Files and buffers](#files-and-buffers)
- [Windows](#windows)
- [Edition](#edition)
  - [Undo tree](#undo-tree)
  - [Rectangle mark mode](#rectangle-mark-mode)
  - [Multiple cursors](#multiple-cursors)
- [Navigate in current buffer](#navigate-in-current-buffer)
- [Search in buffers](#search-in-buffers)
  - [Search in files](#search-in-files)
- [Terminal](#terminal)
- [Dired](#dired)
- [NeoTree](#neotree)
- [Company](#company)
- [Fonts](#fonts)
- [Git](#git)
  - [Magit blame](#magit-blame)
  - [Magit commit](#magit-commit)
  - [Git timemachine](#git-timemachine)
- [Org mode](#org-mode)
- [Markdown](#markdown)
- [Spelling and Grammar](#spelling-and-grammar)
- [Flycheck](#flycheck)
  - [Flycheck error list](#flycheck-error-list)
- [YASnippet](#yasnippet)
- [REST](#rest)
- [YAML](#yaml)
- [Emacs Lisp](#emacs-lisp)
- [Clojure](#clojure)
  - [cider](#cider)
  - [cider eval](#cider-eval)
  - [cider documentation](#cider-documentation)
  - [cider tests](#cider-tests)
  - [cider-test-results](#cider-test-results)
  - [cider tools](#cider-tools)
  - [cider-repl-mode](#cider-repl-mode)
  - [cider debugging](#cider-debugging)
  - [cider-stacktrace-mode](#cider-stacktrace-mode)
- [Smartparens](#smartparens)
  - [Smartparens navigation](#smartparens-navigation)
  - [Smartparens manipulation](#smartparens-manipulation)
- [SQL packages](#sql-packages)
- [Elfeed](#elfeed)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Help

| Keybinding | Action               |
| ---------- | ------               |
| C-c h      | Help commands prefix |

## Packages

| Keybinding | Action        |
| ---------- | ------        |
| C-x p      | List packages |

## Files and buffers

| Keybinding | Action                                                    |
| ---------- | ------                                                    |
| C-x C-r    | List recent files                                         |
| C-x C-b    | List buffers                                              |
| C-x C-f    | Find files                                                |
| C-x d      | Open dired                                                |
| C-x M-b    | Go to a bookmark or create a bookmark                     |
| M-x        | Execute                                                   |
| C-c k      | Kill all open buffers except the current buffer           |
| C-c r      | Rename current buffer and its visiting file if it has one |

## Windows

| Keybinding | Action                       |
| ---------- | ------                       |
| M-z        | Switch to another window     |
| C-c w      | Hydra for windows management |

## Edition

| Keybinding | Action                                                            |
| ---------- | ------                                                            |
| C-c e      | Edition commands prefix                                           |
| S-RET      | Add a new line below                                              |
| C-S-RET    | Add a new line above                                              |
| M-Up       | Move line or region up                                            |
| M-Down     | Move line or region down                                          |
| M-j        | Collapse/join lines                                               |
| M-y        | Yank from history                                                 |
| C-c d      | Duplicate line or region                                          |
| C-=        | Expand region by semantic units                                   |
| C-x u      | visualize undo tree                                               |
| M-=        | Word count for region                                             |
| C-«        | Set the mark                                                      |
| M-«        | Jump to mark                                                      |
| C-x C-x    | Exchange the point and the mark                                   |
| C-x n      | Narrow or widen a region, an org block, an org subtree or a defun |
| C-u C-x n  | Narrow a narrowed buffer                                          |
| C-x 8      | Unicode characters                                                |
| C-c 8      | Insert Unicode characters with typo.el                            |
| C-c 8 SPC  | Insert a non-break space with typo.el                             |

### Undo tree

| Keybinding | Action                    |
| ---------- | ------                    |
| p          | undo                      |
| n          | redo                      |
| b          | switch to previous branch |
| f          | switch to next branch     |
| t          | toggle timestamps         |
| s          | toggle selection mode     |
| q          | quit undo tree            |

### Rectangle mark mode

| Keybinding | Action                                               |
| ---------- | ------                                               |
| C-x SPC    | enable rectangle-mark-mode for rectangular selection |

### Multiple cursors

| Keybinding  | Action                                                                 |
| ----------  | ------                                                                 |
| C-S-c C-S-c | Edit lines in region with multiple cursors                             |
| C-c s c     | Select multiple cursors with a regex                                   |
| C-.         | Show only the lines with multiple cursors                              |
| C-j         | Insert a newline in multiple cursors mode                              |
| C-c C-<     | Add a cursor to all expressions in the buffer like the selected region |

## Navigate in current buffer

| Keybinding | Action                                   |
| ---------- | ------                                   |
| M-g M-g    | Go to line number of buffer              |
| C-,        | Input one char, then jump to a character |
| C-'        | Input 2 chars, then jump to a character  |
| C-c a      | Hydra for avy                            |

## Search in buffers

| Keybinding | Action                                        |
| ---------- | ------                                        |
| C-c s      | Command prefix for search                     |
| C-s        | Search in buffer                              |
| C-M-s      | Search in all opened buffers                  |
| C-c s g    | Regex replace                                 |
| C-c s q    | Regex query replace                           |
| C-c s c    | Select multiple cursors with regex            |
| M-i        | imenu in buffer                               |
| C-s s i    | imenu on all opened buffers                   |
| C-c s r    | re-builder (C-c <tab> to change regex syntax) |

### Search in files

| Keybinding | Action                               |
| ---------- | ------                               |
| C-c s d    | Search files with Ripgrep (deadgrep) |
| C-c s s    | Search files with Ripgrep (counsel)  |
| M-s        | Hydra for dumb-jump                  |
| C-c p      | Command prefix for projectile        |

## Terminal

| Keybinding | Action                   |
| ---------- | ------                   |
| C-c T      | Terminal commands prefix |

## Dired

| Keybinding  | Action                                  |
| ----------  | ------                                  |
| C-x d       | Dired (Hydra with .)                    |

## NeoTree

| Keybinding        | Action                                               |
| ----------        | ------                                               |
| F8                | Toggle NeoTree                                       |
| F9                | Toggle NeoTree on the root of the Projectile project |
| n                 | Next line                                            |
| p                 | Previous line                                        |
| SPC or RET or TAB | Fold/unfold directory or open file                   |
| g                 | Refresh                                              |
| H                 | Toggle display of hidden files                       |
| C-c C-n           | Create a file or directory if name ends with /       |
| C-c C-d           | Delete a file or directory                           |
| C-c C-r           | Rename a file or directory                           |
| C-c C-c           | Change the root directory                            |

## Company

| Keybinding | Action                                       |
| ---------- | ------                                       |
| TAB        | Company mode expand                          |
| C-c f      | Trigger expanson of a file path with company |
| C-c TAB    | Company mode expand                          |

## Fonts

| Keybinding | Action              |
| ---------- | ------              |
| C-+        | Increase text scale |
| C--        | Decrease text scale |

## Git

| Keybinding | Action                  |
| ---------- | ------                  |
| C-c g      | Prefix for Git commands |

### Magit blame

| Keybinding | Action                                                             |
| ---------- | ------                                                             |
| RET        | Show commit at point                                               |
| SPC        | Update commit buffer with the thing at point or scroll buffer up   |
| DEL        | Update commit buffer with the thing at point or scroll buffer down |
| n          | move to next blame chunk                                           |
| N          | move to next blame chunk from same commit                          |
| p          | move to previous blame chunk                                       |
| P          | move to previous blame chunk from same commit                      |
| M-w        | copy hash of the commit from the current chunk                     |
| q          | exit Magit blame                                                   |

### Magit commit

| Keybinding | Action        |
| ---------- | ------        |
| C-c C-c    | Finish commit |
| C-c C-k    | Cancel commit |

### Git timemachine

| Keybinding | Action                                    |
| ---------- | ------                                    |
| p          | previous version                          |
| n          | next version                              |
| b          | Magit blame on current revision           |
| w          | copy abbreviated hash of current revision |
| q          | exit Git timemachine                      |

## Org mode

| Keybinding | Action                                                                      |
| ---------- | ------                                                                      |
| C-c o      | Prefix for Org commands                                                     |
| C-c t      | Prefix for Org Clock commands                                               |
| M-O        | Select a link to jump to with avy                                           |
| C-c / T    | Search for a specific TODO keyword and display the results in a sparse tree |

## Markdown

| Keybinding | Action                                                      |
| ---------- | ------                                                      |
| C-c C-c m  | preview Markdown html                                       |
| C-c C-c p  | preview Markdown file in browser                            |
| C-c C-c l  | preview Markdown in real time in an Emacs Web Wowser buffer |
| C-c C-o    | open link at point in a browser                             |
| M-Up       | Move list item up                                           |
| M-Down     | Move list item down                                         |
| M-Right    | Increase indent of list item                                |
| M-LEFT     | Decrease indent of list item                                |
| C-c C-n    | Move to next heading                                        |
| C-c C-p    | Move to previous heading                                    |
| C-c C-d    | Generate a table of contents with DocToc                    |

## Spelling and Grammar

| Keybinding | Action                              |
| ---------- | ------                              |
| C-c i      | ispell prefix (spelling)            |
| C-c L      | langtool prefix (grammar and style) |

## Flycheck

| Keybinding | Action                                                                    |
| ---------- | ------                                                                    |
| C-c ! n    | Jump to next error                                                        |
| M-g n      | Jump to next error                                                        |
| C-c ! p    | Jump to previous error                                                    |
| M-g p      | Jump to previous error                                                    |
| C-c ! l    | List all errors in buffer                                                 |
| C-c ! v    | Verify the Flycheck setup for current buffer and display enabled checkers |
| C-c ! ?    | Prompt for a checker and display its documentation                        |

### Flycheck error list

| Keybinding | Action                             |
| ---------- | ------                             |
| RET        | Go to current error                |
| n          | jump to next error                 |
| p          | jump to previous error             |
| g          | check buffer and update error list |
| q          | quit error list                    |

## YASnippet

| Keybinding | Action           |
| ---------- | ------           |
| C-y        | Select a snippet |

## REST

| Keybinding | Action                                      |
| ---------- | ------                                      |
| C-c C-c    | run a query and pretty print response       |
| C-c C-r    | run a query and display response            |

## YAML

| Keybinding | Action             |
| ---------- | ------             |
| C-c >      | indent-tools hydra |

## Emacs Lisp

| Keybinding | Action                                                      |
| ---------- | ------                                                      |
| C-x C-e    | evaluate the expression before point                        |
| C-M-x      | evaluate top-level expression containing or following point |

## Clojure

| Keybinding | Action                      |
| ---------- | ------                      |
| C-c M-j    | cider-jack-in               |
| C-c C-m    | clj-refactor                |
| C-c C-m hh | Hydra menu for clj-refactor |

### cider

| Keybinding | Action                                                                     |
| ---------- | ------                                                                     |
| C-c C-z    | switch between the REPL buffer and the Clojure(Script) buffer              |
| C-c C-q    | quit current nREPL connection                                              |
| C-c M-n    | switch namespace of the REPL buffer to the namespace of the current buffer |
| C-c C-.    | jump to a namespace on the classpath                                       |
| C-c C-k    | load the current buffer                                                    |
| C-c C-u    | undefine symbol                                                            |
| M-.        | jump to definition of a symbol                                             |
| M-,        | return to pre-jump location                                                |
| M-TAB      | complete symbol at point                                                   |

### cider eval

| Keybinding  | Action                                                                      |
| ----------  | ------                                                                      |
| C-c C-e     | Evaluate the form preceding point and output result in echo area            |
| C-c M-e     | Evaluate the form preceding point and output result to the REPL buffer      |
| C-c C-p     | Evaluate the form preceding point and pretty print result in a popup buffer |
| C-c M-p     | Load the form preceding point in the REPL buffer                            |
| C-c C-b     | Interrupt pending evaluations                                               |
| C-c C-x     | reload all modified files in classpath                                      |
| C-u C-c C-x | reload all files in classpath                                               |

### cider documentation

| Keybinding | Action                                                 |
| ---------- | ------                                                 |
| C-c C-d d  | doc string for symbol at point                         |
| C-c C-d j  | display Javadoc in default browser for symbol at point |
| C-c C-d r  | search symbol in Grimoire                              |

### cider tests

| Keybinding  | Action                                                                |
| ----------  | ------                                                                |
| C-c C-t C-t | run test at point                                                     |
| C-c C-t C-n | run tests for current namespace                                       |
| C-c C-t C-p | run tests for all project namespaces (load the additional namespaces) |
| C-c C-t C-r | re-run failed tests                                                   |
| C-c C-t C-b | show test report buffer                                               |

### cider-test-results

| Keybinding | Action                                      |
| ---------- | ------                                      |
| M-p/n      | navigate through tests                      |
| M-.        | jump to test definition                     |
| d          | diff of actual vs expected                  |
| e          | display cause and stacktrace of failed test |

### cider tools

| Keybinding  | Action                                                       |
| ----------  | ------                                                       |
| C-c C-m     | macroexpand-1 on the form at point                           |
| C-u C-c C-m | macroexpand on the form at point                             |
| C-c M-m     | macroexpand-all on the form at point                         |
| C-c M-i     | inspect structure of the result of an expression             |
| C-c M-t v   | toggle tracing of the results of a var                       |
| C-c M-t n   | toggle tracing of the results of all the vars of a namespace |

### cider-repl-mode

| Keybinding  | Action                                                  |
| ----------  | ------                                                  |
| RET         | Evaluate current input in Clojure or open a new line    |
| C-RET       | Close unmatched parenthesis then evaluate current input |
| C-u C-c C-o | clear REPL buffer                                       |
| C-c M-o     | switch between Clojure and ClojureScript REPLs          |
| C-up/down   | navigate history of inputs                              |
| TAB         | complete symbol at point                                |
| C-c M-n     | switch to a namespace                                   |

### cider debugging

| Keybinding  | Action                                                               |
| ----------  | ------                                                               |
| C-u C-c C-c | Debug the top level form under point and walk through its evaluation |

### cider-stacktrace-mode

| Keybinding | Action                                       |
| ---------- | ------                                       |
| M-p/n      | navigate through causes                      |
| M-.        | jump to source location for stacktrace frame |
| j          | toggle display of Java frames                |
| c          | toggle display of Clojure frames             |
| r          | toggle display of REPL frames                |
| t          | toggle display of tooling frames             |
| d          | toggle display of duplicate frames           |

## Smartparens

### Smartparens navigation

| Keybinding | Action                                                                     |
| ---------- | ------                                                                     |
| C-M-f      | Jump after next balanced expression                                        |
| C-M-b      | Jump before the previous balanced expression                               |
| C-S-a      | Jump to the end of the current balanced expression                         |
| C-S-d      | Jump to the beginning of the currente balanced expression                  |
| C-M-d      | Jump down one level after the opening pair of the next balanced expression |
| C-M-a      | Jump down backward one level from the current balanced expression          |
| C-M-e      | Jump up one level from the current balanced expression                     |
| C-M-u      | Jump up backward one level from the current balanced expression            |
| C-M-n      | Jump to the beginning of the following balanced expression                 |
| C-M-p      | Jump to the end of the previous balanced expression                        |

### Smartparens manipulation

| Keybinding          | Action                                                             |
| ----------          | ------                                                             |
| C-M-k               | Kill the next balanced expression (or kill enclosing expression)   |
| C-M-w               | Copy the next balanced expression                                  |
| M-&lt;delete&gt;    | Remove the wrapping pair from the following expression             |
| M-&lt;backspace&gt; | Remove the wrapping pair from the previous expression              |
| C-M-t               | Transpose the adjacent balanced expressions (swap the expressions) |
| C-&lt;right&gt;     | Extend current list by 1 element by moving the closing delimiter   |
| C-&lt;left&gt;      | Contract current list by 1 element by moving the closing delimiter |
| C-M-&lt;left&gt;    | Extend current list by 1 element by moving the opening delimiter   |
| C-M-&lt;right&gt;   | Contract current list by 1 element by moving the opening delimiter |
| M-D                 | Remove the wrapping pair from this expression                      |

## SQL packages

| Keybinding | Action               |
| ---------- | ------               |
| C-c C-f    | Format SQL in region |

## Elfeed

| Keybinding | Action      |
| ---------- | ------      |
| C-x w      | Open Elfeed |
