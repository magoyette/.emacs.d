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
- [Treemacs](#treemacs)
- [Company](#company)
- [Fonts](#fonts)
- [Theme](#theme)
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

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Help

| Keybinding | Action               |
| ---------- | -------------------- |
| C-c h      | Help commands prefix |

## Packages

| Keybinding | Action        |
| ---------- | ------------- |
| C-x p      | List packages |

## Files and buffers

| Keybinding | Action                                                    |
| ---------- | --------------------------------------------------------- |
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
| ---------- | ---------------------------- |
| M-z        | Switch to another window     |
| C-c w      | Hydra for windows management |

## Edition

| Keybinding | Action                                                            |
| ---------- | ----------------------------------------------------------------- |
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
| M-,        | Insert a ’ character                                              |
| C-x 8      | Unicode characters                                                |
| C-c 8      | Insert Unicode characters with typo.el                            |
| C-c 8 SPC  | Insert a non-break space with typo.el                             |

### Undo tree

| Keybinding | Action                    |
| ---------- | ------------------------- |
| p          | undo                      |
| n          | redo                      |
| b          | switch to previous branch |
| f          | switch to next branch     |
| t          | toggle timestamps         |
| s          | toggle selection mode     |
| q          | quit undo tree            |

### Rectangle mark mode

| Keybinding | Action                                               |
| ---------- | ---------------------------------------------------- |
| C-x SPC    | enable rectangle-mark-mode for rectangular selection |

### Multiple cursors

| Keybinding  | Action                                                                 |
| ----------- | ---------------------------------------------------------------------- |
| C-S-c C-S-c | Edit lines in region with multiple cursors                             |
| C-c s c     | Select multiple cursors with a regex                                   |
| C-.         | Show only the lines with multiple cursors                              |
| C-j         | Insert a newline in multiple cursors mode                              |
| C-c C-<     | Add a cursor to all expressions in the buffer like the selected region |

## Navigate in current buffer

| Keybinding | Action                                   |
| ---------- | ---------------------------------------- |
| M-g M-g    | Go to line number of buffer              |
| C-,        | Input one char, then jump to a character |
| C-'        | Input 2 chars, then jump to a character  |
| C-c a      | Hydra for avy                            |

## Search in buffers

| Keybinding | Action                                        |
| ---------- | --------------------------------------------- |
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
| ---------- | ------------------------------------ |
| C-c s d    | Search files with Ripgrep (deadgrep) |
| C-c s s    | Search files with Ripgrep (counsel)  |
| M-s        | Hydra for dumb-jump                  |
| C-c p      | Command prefix for projectile        |

## Terminal

| Keybinding | Action                   |
| ---------- | ------------------------ |
| C-c T      | Terminal commands prefix |

## Dired

| Keybinding | Action               |
| ---------- | -------------------- |
| C-x d      | Dired (Hydra with .) |

## Treemacs

| Keybinding      | Action                         |
| --------------- | ------------------------------ |
| M-0             | Select or open Treemacs window |
| C-c t           | Treemacs commands prefix       |
| ? [in Treemacs] | Treemacs hydra                 |

## Company

| Keybinding | Action                                       |
| ---------- | -------------------------------------------- |
| TAB        | Company mode expand                          |
| C-c f      | Trigger expanson of a file path with company |
| C-c TAB    | Company mode expand                          |

## Fonts

| Keybinding | Action              |
| ---------- | ------------------- |
| C-+        | Increase text scale |
| C--        | Decrease text scale |

## Theme

| Keybinding | Action                                                        |
| ---------- | ------------------------------------------------------------- |
| F5         | Alternate between the Modus Operandi and Modus Vivendi themes |

## Git

| Keybinding | Action                  |
| ---------- | ----------------------- |
| C-c g      | Prefix for Git commands |

### Magit blame

| Keybinding | Action                                                             |
| ---------- | ------------------------------------------------------------------ |
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
| ---------- | ------------- |
| C-c C-c    | Finish commit |
| C-c C-k    | Cancel commit |

### Git timemachine

| Keybinding | Action                                    |
| ---------- | ----------------------------------------- |
| p          | previous version                          |
| n          | next version                              |
| b          | Magit blame on current revision           |
| w          | copy abbreviated hash of current revision |
| q          | exit Git timemachine                      |

## Org mode

| Keybinding | Action                                                                      |
| ---------- | --------------------------------------------------------------------------- |
| C-c o      | Prefix for Org commands                                                     |
| M-O        | Select a link to jump to with avy                                           |
| C-c / T    | Search for a specific TODO keyword and display the results in a sparse tree |

## Markdown

| Keybinding | Action                                                      |
| ---------- | ----------------------------------------------------------- |
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

| Keybinding | Action                                            |
| ---------- | ------------------------------------------------- |
| C-c L      | LanguageTool prefix (spelling, grammar and style) |

## Flycheck

| Keybinding | Action                                                                    |
| ---------- | ------------------------------------------------------------------------- |
| C-c ! n    | Jump to next error                                                        |
| M-g n      | Jump to next error                                                        |
| C-c ! p    | Jump to previous error                                                    |
| M-g p      | Jump to previous error                                                    |
| C-c ! l    | List all errors in buffer                                                 |
| C-c ! v    | Verify the Flycheck setup for current buffer and display enabled checkers |
| C-c ! ?    | Prompt for a checker and display its documentation                        |

### Flycheck error list

| Keybinding | Action                             |
| ---------- | ---------------------------------- |
| RET        | Go to current error                |
| n          | jump to next error                 |
| p          | jump to previous error             |
| g          | check buffer and update error list |
| q          | quit error list                    |

## YASnippet

| Keybinding | Action           |
| ---------- | ---------------- |
| C-y        | Select a snippet |

## REST

| Keybinding | Action                                |
| ---------- | ------------------------------------- |
| C-c C-c    | run a query and pretty print response |
| C-c C-r    | run a query and display response      |

## YAML

| Keybinding | Action             |
| ---------- | ------------------ |
| C-c >      | indent-tools hydra |

## Emacs Lisp

| Keybinding | Action                                                      |
| ---------- | ----------------------------------------------------------- |
| C-x C-e    | evaluate the expression before point                        |
| C-M-x      | evaluate top-level expression containing or following point |
