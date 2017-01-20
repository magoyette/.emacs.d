# Keybindings

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Package management keybindings](#package-management-keybindings)
- [Dired keybindings](#dired-keybindings)
  - [Dired mode](#dired-mode)
- [Windows and frames keybindings](#windows-and-frames-keybindings)
- [Helm keybindings](#helm-keybindings)
  - [Helm actions](#helm-actions)
  - [Helm features](#helm-features)
- [Edition keybindings](#edition-keybindings)
  - [Undo tree keybindings](#undo-tree-keybindings)
  - [Rectangle mark mode keybindings](#rectangle-mark-mode-keybindings)
  - [Multiple cursors keybindings](#multiple-cursors-keybindings)
- [Narrowing keybindings](#narrowing-keybindings)
- [Search and replace keybindings](#search-and-replace-keybindings)
  - [Helm swoop keybindings](#helm-swoop-keybindings)
- [Search engines keybindings](#search-engines-keybindings)
- [Navigation keybindings](#navigation-keybindings)
- [Company keybindings](#company-keybindings)
- [YASnippet keybindings](#yasnippet-keybindings)
- [Projectile keybindings](#projectile-keybindings)
- [Flycheck keybindings](#flycheck-keybindings)
  - [Flycheck error list keybindings](#flycheck-error-list-keybindings)
- [Git keybindings](#git-keybindings)
  - [Magit blame keybindings](#magit-blame-keybindings)
  - [Magit commit keybindings](#magit-commit-keybindings)
  - [Git timemachine keybindings](#git-timemachine-keybindings)
- [Org mode keybindings](#org-mode-keybindings)
- [Markdown keybindings](#markdown-keybindings)
- [Spelling keybindings](#spelling-keybindings)
- [Web keybindings](#web-keybindings)
- [REST keybindings](#rest-keybindings)
- [Clojure keybindings](#clojure-keybindings)
  - [cider general keybindings](#cider-general-keybindings)
  - [cider eval keybindings](#cider-eval-keybindings)
  - [cider documentation keybindings](#cider-documentation-keybindings)
  - [cider tests keybindings](#cider-tests-keybindings)
  - [cider-test-results keybindings](#cider-test-results-keybindings)
  - [cider tools keybindings](#cider-tools-keybindings)
  - [cider-repl-mode keybindings](#cider-repl-mode-keybindings)
  - [cider debugging keybindings](#cider-debugging-keybindings)
  - [cider-stacktrace-mode keybindings](#cider-stacktrace-mode-keybindings)
- [Haskell keybindings](#haskell-keybindings)
  - [Intero keybindings](#intero-keybindings)
- [Smartparens keybindings](#smartparens-keybindings)
  - [Smartparens navigation](#smartparens-navigation)
  - [Smartparens manipulation](#smartparens-manipulation)
- [Help keybindings](#help-keybindings)
- [Theme keybindings](#theme-keybindings)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Package management keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-x p | List packages with Paradox |

## Dired keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-x d | open dired mode |
| C-x C-j | show current file in dired |

### Dired mode

| Keybinding | Action |
| ---------- | ------ |
| j | jump to file |
| > | move to next directory |
| < | move to previous directory |
| ^ | move to the parent directory (..) |
| g | refresh |
| + | create a new file |
| s | alternate between sort by name and date |
| m | mark a file |
| % m [regex] | mark all fiels that match a regex |
| u | unmark a file |
| U | unmark all files |
| * t | invert marking of files |
| * s | mark all files |
| P | show file in another windows with peep-dired |
| C | copy file under cursor or marked files |
| R | rename file under cursor or marked files |
| D | delete file under cursor or marked files |
| C-x C-q | switch to editing mode to rename files (save buffer to save changes) |
| Q | run query-replace on marked files |
| Z | compress/decompress |
| c | compress many marked files to a single archive |
| q | exit dired |

## Windows and frames keybindings

| Keybinding | Action |
| ---------- | ------ |
| M-1, M-2, ... | move to a numbered window in the current frame or another frame |
| C-x 5 2 | create a new frame |

## Helm keybindings

### Helm actions

| Keybinding | Action |
| ---------- | ------ |
| <tab> | execute persistent action |
| C-i | execute persistent action |
| C-z | select action |

### Helm features

| Keybinding | Action |
| ---------- | ------ |
| C-x C-b | Helm mini |
| C-x b | Helm buffers list |
| C-x C-f | Helm find files |
| C-x C-r | Helm recent files |
| C-x f | Helm multi (combines buffers list, find files and recent files) |
| M-x | Helm execute command |
| M-y | Helm show kill ring |
| C-c <SPC> | Helm all mark rings |
| C-x r b | Helm filtered bookmarks |
| M-s d | Helm search inside a directory with the platinum searcher |
| M-s p | Helm search inside project root with the platinum searcher |
| C-x 8 | Helm select unicode character |

## Edition keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-RET | Add a new line below |
| C-S-RET | Add a new line above |
| M-j | Collapse lines |
| C-= | Expand region by semantic units |
| C-x u | visualize undo tree |

### Undo tree keybindings

| Keybinding | Action |
| ---------- | ------ |
| p | undo |
| n | redo |
| b | switch to previous branch |
| f | switch to next branch |
| t | toggle timestamps |
| s | toggle selection mode |
| q | quit undo tree |

### Rectangle mark mode keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-x SPC | enable rectangle-mark-mode for rectangular selection |

### Multiple cursors keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-S-c C-S-c | Edit lines in region with multiple cursors |
| C-> | Add a cursor to the next expression like the selected region |
| C-< | Add a cursor to the previous expression like the selected region |
| C-c C-< | Add a cursor to all expressions in the buffer like the selected region |

## Narrowing keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-x n | narrow or widen a region, an org block, an org subtree or a defun |
| C-u C-x n | narrow a narrowed buffer |

## Search and replace keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-s | regexp forward search |
| C-r | regexp backward search |
| C-M-s | search forward |
| C-M-r | search backward |
| M-% | Anzu query replace |
| C-M-% | Anzy query replace regexp |
| M-i | Helm swoop |
| C-c M-i | Helm multi swoop on selected buffers |
| C-x M-i | Helm multi swoop on all buffers |
| M-s d | Helm search with The Platinum Searcher in directory |
| M-s p | Helm search with The Platinum Searcher in project root |

### Helm swoop keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-r | previous line |
| C-s | next line |
| C-SPC | choose lines to edit |
| C-c C-e | enter edit mode |
| C-x C-s | apply edit mode changes |

## Search engines keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-c / d | query with DuckDuckGo |
| C-c / h | query with GitHub |
| C-c / g | query with Google |
| C-c / s | query with StackOverflow |
| C-c / w | query with Wikipedia |

## Navigation keybindings

| Keybinding | Action |
| ---------- | ------ |
| M-g M-g | Go to line number |
| C-, | Input one char, then jump to a character |
| C-' | Input 2 chars, then jump to a character |
| M-g f | Jump the beginning of a line |
| M-g w | Input one char, then jump to the beginning of a word |

## Company keybindings

| Keybinding | Action |
| ---------- | ------ |
| TAB | Company mode expand |
| C-: | Helm company |
| C-c f | Trigger expanson of a file path with company |

## YASnippet keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-TAB | Expand snippet |
| S-TAB | Insert a snippet |

## Projectile keybindings

For the commands that find files, C-u can be done before the command to first invalidate the cache of the project files.

| Keybinding | Action |
| ---------- | ------ |
| C-c p h | Helm projectile (switch to buffer, find file, switch project) |
| C-c p b | Switch to buffer |
| C-c p p | Switch project |
| C-c p f | Find file |
| C-c p F | Find file in all known projects |
| C-c p g | Find file based on context at point |
| C-c p d | Find directory |
| C-c p e | Find recent file |

## Flycheck keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-c ! n | Jump to next error |
| M-g n | Jump to next error |
| C-c ! p | Jump to previous error |
| M-g p | Jump to previous error |
| C-c ! l | List all errors in buffer |
| C-c ! h | List all errors in buffer with Helm |
| C-c ! v | Verify the Flycheck setup for current buffer and display enabled checkers |
| C-c ! ? | Prompt for a checker and display its documentation |

### Flycheck error list keybindings

| Keybinding | Action |
| ---------- | ------ |
| RET | Go to current error |
| n | jump to next error |
| p | jump to previous error |
| g | check buffer and update error list |
| q | quit error list |

## Git keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-x g | Magit status |
| C-x M-g | Magit list repositories |
| C-x G | Magit blame |
| C-c g g | open current buffer at GitHub, GitLab or BitBucket |
| C-x t | Git timemachine |
| C-c s | Hydra for smerge-mode |

### Magit blame keybindings

| Keybinding | Action |
| ---------- | ------ |
| RET | Show commit at point |
| SPC | Update commit buffer with the thing at point or scroll buffer up |
| DEL | Update commit buffer with the thing at point or scroll buffer down |
| n | move to next blame chunk |
| N | move to next blame chunk from same commit |
| p | move to previous blame chunk |
| P | move to previous blame chunk from same commit |
| M-w | copy hash of the commit from the current chunk |
| q | exit Magit blame |

### Magit commit keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-c C-c | Finish commit |
| C-c C-k | Cancel commit |

### Git timemachine keybindings

| Keybinding | Action |
| ---------- | ------ |
| p | previous version |
| n | next version |
| w | copy abbreviated hash of current version |
| q | exit Git timemachine |

## Org mode keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-c l | Org store link |
| M-o | Select a link to jump to with avy |
| C-c c | Org capture |
| C-c a | Org agenda |
| C-c o b | Search in all opened org files with helm-org-rifle |
| C-c o d | Search in the org files of a directory with helm-org-rifle |
| C-c / T | Search for a specific TODO keyword and display the results in a sparse tree |

## Markdown keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-c C-c m | preview Markdown html |
| C-c C-c p | preview Markdown file in browser |
| C-c C-c l | preview Markdown in real time in an Emacs Web Wowser buffer |
| C-c C-o | open link at point in a browser |
| M-Up | Move list item up |
| M-Down | Move list item down |
| M-Right | Increase indent of list item |
| M-LEFT | Decrease indent of list item |
| C-c C-n | Move to next heading |
| C-c C-p | Move to previous heading |
| C-c C-d | Generate a table of contents with [DocToc](https://github.com/thlorenz/doctoc) |

## Spelling keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-c d | Alternate between english and french dictionaries |
| C-c M-s | Start ispell on the region or on the buffer |

## Web keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-c c | Helm for CSS, LESS and Sass selectors. |
| C-j | Expand an Emmet snippet in web-mode, css-mode or html-mode. |

## REST keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-c C-c | run a query and pretty print response |
| C-c C-r | run a query and display response |
| C-c C-g | Helm for rest-client variables and requests |

## Clojure keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-c M-j | cider-jack-in |
| C-c C-m | clj-refactor |
| C-c C-m hh | Hydra menu for clj-refactor |
| C-c C-h | clojure cheatsheet |

### cider general keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-c C-z | switch between the REPL buffer and the Clojure(Script) buffer |
| C-c C-q | quit current nREPL connection |
| C-c M-n | switch namespace of the REPL buffer to the namespace of the current buffer |
| C-c C-. | jump to a namespace on the classpath |
| C-c C-k | load the current buffer |
| C-c C-u | undefine symbol |
| M-. | jump to definition of a symbol |
| M-, | return to pre-jump location |
| M-TAB | complete symbol at point |

### cider eval keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-c C-e | Evaluate the form preceding point and output result in echo area |
| C-c M-e | Evaluate the form preceding point and output result to the REPL buffer |
| C-c C-p | Evaluate the form preceding point and pretty print result in a popup buffer |
| C-c M-p | Load the form preceding point in the REPL buffer |
| C-c C-b | Interrupt pending evaluations |
| C-c C-x | reload all modified files in classpath |
| C-u C-c C-x | reload all files in classpath |

### cider documentation keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-c C-d d | doc string for symbol at point |
| C-c C-d j | display Javadoc in default browser for symbol at point |
| C-c C-d r | search symbol in Grimoire |

### cider tests keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-c C-t C-t | run test at point |
| C-c C-t C-n | run tests for current namespace |
| C-c C-t C-p | run tests for all project namespaces (load the additional namespaces) |
| C-c C-t C-r | re-run failed tests |
| C-c C-t C-b | show test report buffer |

### cider-test-results keybindings

| Keybinding | Action |
| ---------- | ------ |
| M-p/n | navigate through tests |
| M-. | jump to test definition |
| d | diff of actual vs expected |
| e | display cause and stacktrace of failed test |

### cider tools keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-c C-m | macroexpand-1 on the form at point |
| C-u C-c C-m | macroexpand on the form at point |
| C-c M-m | macroexpand-all on the form at point |
| C-c M-i | inspect structure of the result of an expression |
| C-c M-t v | toggle tracing of the results of a var |
| C-c M-t n | toggle tracing of the results of all the vars of a namespace |

### cider-repl-mode keybindings

| Keybinding | Action |
| ---------- | ------ |
| RET | Evaluate current input in Clojure or open a new line |
| C-RET | Close unmatched parenthesis then evaluate current input |
| C-u C-c C-o | clear REPL buffer |
| C-c M-o | switch between Clojure and ClojureScript REPLs |
| C-up/down | navigate history of inputs |
| TAB | complete symbol at point |
| C-c M-n | switch to a namespace |

### cider debugging keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-u C-c C-c | Debug the top level form under point and walk through its evaluation (defn must be evaluated to remove its instrumentation) |

### cider-stacktrace-mode keybindings

| Keybinding | Action |
| ---------- | ------ |
| M-p/n | navigate through causes |
| M-. | jump to source location for stacktrace frame |
| j | toggle display of Java frames |
| c | toggle display of Clojure frames |
| r | toggle display of REPL frames |
| t | toggle display of tooling frames |
| d | toggle display of duplicate frames |

## Haskell keybindings

### Intero keybindings

| Keybinding | Action |
| ---------- | ------ |
| M-. | Jump to definition |
| C-c C-i | Show information of identifier at point |
| C-c C-t | Show the type of thing at point, or the selection |
| C-u C-c C-t | Insert a type signature for the thing at point |
| C-c C-l | Load this module in the REPL |
| C-c C-r | Apply suggestions from GHC |
| C-c C-k | Clear REPL |
| C-c C-z | Switch to and from the REPL |

## Smartparens keybindings

### Smartparens navigation

| Keybinding | Action |
| ---------- | ------ |
| C-M-f | Jump after next balanced expression |
| C-M-b | Jump before the previous balanced expression |
| C-S-a | Jump to the end of the current balanced expression |
| C-S-d | Jump to the beginning of the currente balanced expression |
| C-M-d | Jump down one level after the opening pair of the next balanced expression |
| C-M-a | Jump down backward one level from the current balanced expression |
| C-M-e | Jump up one level from the current balanced expression |
| C-M-u | Jump up backward one level from the current balanced expression |
| C-M-n | Jump to the beginning of the following balanced expression |
| C-M-p | Jump to the end of the previous balanced expression |

### Smartparens manipulation

| Keybinding | Action |
| ---------- | ------ |
| C-M-k | Kill the next balanced expression (if there's no next expression, kill enclosing expression) |
| C-M-w | Copy the next balanced expression |
| M-<delete> | Remove the wrapping pair from the following expression |
| M-<backspace> | Remove the wrapping pair from the previous expression |
| C-M-t | Transpose the adjacent balanced expressions (swap the expressions) |
| C-<right> | Extend the current list by one element by moving the closing delimiter |
| C-<left> | Contract the current list by one element by moving the closing delimiter |
| C-M-<left> | Extend the current list by one element by moving the opening delimiter |
| C-M-<right> | Contract the current list by one element by moving the opening delimiter |
| M-D | Remove the wrapping pair from this expression |
| C-M-<delete> | Remove the wrapping pair from this expression and kill everything from the end of expression before (point) to end of this expression |
| C-M-<backspace> | Remove the wrapping pair from this expression and kill everything from the beginning of this expression to beginning of expression after (point) |
| C-S-<backspace> | Remove the wrapping pair from this expression and kill everything inside save for ARG next expressions |

## Help keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-h a | Helm apropos |
| C-h i | Helm info |
| C-h b | Helm describe bindings |

## Theme keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-+ | Increase text scale |
| C-- | Decrease text scale |
