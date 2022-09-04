# Keybindings

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [General](#general)
- [Files and Buffers](#files-and-buffers)
- [Search and Navigation](#search-and-navigation)
- [Edition](#edition)
  - [Undo tree](#undo-tree)
  - [Rectangle mark mode](#rectangle-mark-mode)
  - [Multiple cursors](#multiple-cursors)
- [Git](#git)
  - [Magit blame](#magit-blame)
  - [Magit commit](#magit-commit)
- [Org mode](#org-mode)
- [Markdown](#markdown)
- [REST](#rest)
- [YAML](#yaml)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## General

| Keybinding | Action                                                        |
| ---------- | ------------------------------------------------------------- |
| C-c h      | Help commands prefix                                          |
| C-x p      | List packages                                                 |
| M-z        | Switch to another window                                      |
| C-c w      | Hydra for windows management                                  |
| C-c T      | Terminal commands prefix                                      |
| F5         | Alternate between the Modus Operandi and Modus Vivendi themes |
| C-+        | Increase text scale                                           |
| C--        | Decrease text scale                                           |
| C-x C-e    | evaluate the expression before point                          |
| C-M-x      | evaluate top-level expression containing or following point   |

## Files and Buffers

| Keybinding | Action                                                    |
| ---------- | --------------------------------------------------------- |
| C-x C-r    | List recent files                                         |
| C-x C-b    | List buffers                                              |
| C-x C-f    | Find files                                                |
| M-x        | Execute                                                   |
| M-X        | Execute a command useful in the current mode              |
| C-c k      | Kill all open buffers except the current buffer           |
| C-c r      | Rename current buffer and its visiting file if it has one |

## Search and Navigation

| Keybinding      | Action                                        |
| --------------- | --------------------------------------------- |
| C-c s           | Search & replace commands prefix              |
| C-s             | Search in buffer                              |
| C-M-s           | Search in all opened buffers                  |
| M-i             | imenu in buffer                               |
| C-c s r         | re-builder (C-c <tab> to change regex syntax) |
| M-s             | Hydra for dumb-jump                           |
| C-c p           | Projectile commands prefix                    |
| C-x d           | Dired (Hydra with .)                          |
| M-a             | Select or open Treemacs window                |
| C-c t           | Treemacs commands prefix                      |
| ? [in Treemacs] | Treemacs hydra                                |
| C-x M-b         | Go to a bookmark or create a bookmark         |
| M-g M-g         | Go to line number of buffer                   |
| C-,             | Input one char, then jump to a character      |
| C-'             | Input 2 chars, then jump to a character       |
| C-c a           | Hydra for avy                                 |

## Edition

| Keybinding | Action                                                            |
| ---------- | ----------------------------------------------------------------- |
| TAB        | Company mode expand                                               |
| C-c f      | Trigger expanson of a file path with company                      |
| C-c TAB    | Company mode expand                                               |
| C-c !      | Flycheck commands prefix                                          |
| C-c L      | LanguageTool commands prefix                                      |
| C-c y      | Select a snippet (yasnippet)                                      |
| C-c &      | yasnippet commands prefix                                         |
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
| C-c 8      | Typography commands prefix (with typo.el)                         |

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

## Git

| Keybinding | Action              |
| ---------- | ------------------- |
| C-c g      | Git commands prefix |

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

## Org mode

| Keybinding | Action                                                                      |
| ---------- | --------------------------------------------------------------------------- |
| C-c o      | Org commands prefix                                                         |
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

## REST

| Keybinding | Action                                |
| ---------- | ------------------------------------- |
| C-c C-c    | run a query and pretty print response |
| C-c C-r    | run a query and display response      |

## YAML

| Keybinding | Action             |
| ---------- | ------------------ |
| C-c >      | indent-tools hydra |
