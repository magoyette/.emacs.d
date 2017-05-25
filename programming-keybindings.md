# Programming keybindings

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Flycheck keybindings](#flycheck-keybindings)
  - [Flycheck error list keybindings](#flycheck-error-list-keybindings)
- [YASnippet keybindings](#yasnippet-keybindings)
- [Programming keybindings](#programming-keybindings)
- [Web keybindings](#web-keybindings)
- [REST keybindings](#rest-keybindings)
- [YAML keybindings](#yaml-keybindings)
- [Emacs Lisp keybindings](#emacs-lisp-keybindings)
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

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Flycheck keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-c ! n | Jump to next error |
| M-g n | Jump to next error |
| C-c ! p | Jump to previous error |
| M-g p | Jump to previous error |
| C-c ! l | List all errors in buffer |
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

## YASnippet keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-TAB | Expand snippet |
| S-TAB | Insert a snippet |

## Programming keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-c <RET> | Open url at point |

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

## YAML keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-c > | indent-tools hydra |

## Emacs Lisp keybindings

| Keybinding | Action |
| ---------- | ------ |
| C-x C-e | evaluate the expression before point |
| C-M-x | evaluate top-level expression containing or following point |

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
| M-&lt;delete&gt; | Remove the wrapping pair from the following expression |
| M-&lt;backspace&gt; | Remove the wrapping pair from the previous expression |
| C-M-t | Transpose the adjacent balanced expressions (swap the expressions) |
| C-&lt;right&gt; | Extend the current list by one element by moving the closing delimiter |
| C-&lt;left&gt; | Contract the current list by one element by moving the closing delimiter |
| C-M-&lt;left&gt; | Extend the current list by one element by moving the opening delimiter |
| C-M-&lt;right&gt; | Contract the current list by one element by moving the opening delimiter |
| M-D | Remove the wrapping pair from this expression |
| C-M-&lt;delete&gt; | Remove the wrapping pair from this expression and kill everything from the end of expression before (point) to end of this expression |
| C-M-&lt;backspace&gt; | Remove the wrapping pair from this expression and kill everything from the beginning of this expression to beginning of expression after (point) |
| C-S-&lt;backspace&gt; | Remove the wrapping pair from this expression and kill everything inside save for ARG next expressions |