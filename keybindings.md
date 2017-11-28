# Keybindings

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Package management](#package-management)
- [Windows and frames](#windows-and-frames)
- [Helm](#helm)
  - [Helm actions](#helm-actions)
  - [Helm features](#helm-features)
- [Files and buffers](#files-and-buffers)
- [Movement](#movement)
- [Mark](#mark)
- [NeoTree](#neotree)
- [Edition](#edition)
  - [Undo tree](#undo-tree)
  - [Rectangle mark mode](#rectangle-mark-mode)
  - [Multiple cursors](#multiple-cursors)
- [Projects](#projects)
- [Search and replace](#search-and-replace)
- [Company](#company)
- [Narrowing](#narrowing)
- [Fonts](#fonts)
- [Dired](#dired)
  - [Dired](#dired-1)
  - [WDired](#wdired)
- [Terminal](#terminal)
- [Git](#git)
  - [Magit blame](#magit-blame)
  - [Magit commit](#magit-commit)
  - [Git timemachine](#git-timemachine)
- [Org mode](#org-mode)
- [Markdown](#markdown)
- [Spelling](#spelling)
- [ePub](#epub)
- [PDF](#pdf)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Package management

| Keybinding | Action        |
| ---------- | ------        |
| C-x p      | List packages |

## Windows and frames

| Keybinding    | Action                       |
| ----------    | ------                       |
| C-c w         | Hydra for windows and frames |
| M-1, M-2, ... | move to a numbered window    |

## Helm

### Helm actions

| Keybinding  | Action                    |
| ----------  | ------                    |
| &lt;tab&gt; | execute persistent action |
| C-i         | execute persistent action |
| C-z         | select action             |

### Helm features

| Keybinding      | Action                                                          |
| ----------      | ------                                                          |
| C-x C-b         | Helm mini                                                       |
| C-x b           | Helm buffers list                                               |
| C-x C-f         | Helm find files                                                 |
| C-x C-r         | Helm recent files                                               |
| C-x f           | Helm multi (combines buffers list, find files and recent files) |
| M-x             | Helm execute command                                            |
| M-y             | Helm show kill ring                                             |
| C-c &lt;SPC&gt; | Helm all mark rings                                             |
| C-x M-b         | Helm bookmarks                                                  |
| M-i             | Helm Imenu                                                      |
| C-x 8           | Helm select unicode character                                   |
| C-h a           | Helm apropos                                                    |
| C-h i           | Helm info                                                       |
| C-h b           | Helm describe bindings                                          |

## Files and buffers

| Keybinding | Action                                                    |
| ---------- | ------                                                    |
| C-c k      | Kill all open buffers except the current buffer           |
| C-c r      | Rename current buffer and its visiting file if it has one |

## Movement

| Keybinding | Action                                               |
| ---------- | ------                                               |
| M-g M-g    | Go to line number                                    |
| C-,        | Input one char, then jump to a character             |
| C-'        | Input 2 chars, then jump to a character              |
| M-g f      | Jump the beginning of a line                         |
| M-g w      | Input one char, then jump to the beginning of a word |

## Mark

| Keybinding | Action                          |
| ---------- | ------                          |
| C-«        | Set the mark                    |
| M-«        | Jump to mark                    |
| C-x C-x    | Exchange the point and the mark |

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

## Edition

| Keybinding | Action                          |
| ---------- | ------                          |
| S-RET      | Add a new line below            |
| C-S-RET    | Add a new line above            |
| M-Up       | Move line or region up          |
| M-Down     | Move line or region down        |
| M-j        | Collapse/join lines             |
| C-c d      | Duplicate line or region        |
| C-=        | Expand region by semantic units |
| C-x u      | visualize undo tree             |
| M-=        | Word count for region           |

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
| C->         | Add a cursor to the next expression like the selected region           |
| C-<         | Add a cursor to the previous expression like the selected region       |
| C-c C-<     | Add a cursor to all expressions in the buffer like the selected region |

## Projects

| Keybinding | Action                           |
| ---------- | ------                           |
| C-x x      | Helm projectile (basic commands) |
| C-x M-x    | Helm hydra (additional commands) |
| F9         | Open NeoTree on project root     |

## Search and replace

| Keybinding | Action                                                                      |
| ---------- | ------                                                                      |
| C-s        | regexp forward search                                                       |
| C-r        | regexp backward search                                                      |
| C-M-s      | search forward                                                              |
| C-M-r      | search backward                                                             |
| M-%        | Anzu query replace                                                          |
| C-M-%      | Anzy query replace regexp                                                   |
| M-s j      | Jump to definition (Clojure, Emacs Lisp, Java, JavaScript, etc.)            |
| M-s b      | Jump back to initial position after M-g j                                   |
| M-s o      | Jump to definition in another window                                        |
| M-s q      | Show tooltip about definition                                               |
| M-s x      | Jump to definition (prefer definition from other buffers                    |
| M-s z      | Jump to definition in another windows (prefer definition from other buffers |



## Company

| Keybinding | Action                                       |
| ---------- | ------                                       |
| TAB        | Company mode expand                          |
| C-:        | Helm company                                 |
| C-c f      | Trigger expanson of a file path with company |

## Narrowing

| Keybinding | Action                                                            |
| ---------- | ------                                                            |
| C-x n      | narrow or widen a region, an org block, an org subtree or a defun |
| C-u C-x n  | narrow a narrowed buffer                                          |

## Fonts

| Keybinding | Action              |
| ---------- | ------              |
| C-+        | Increase text scale |
| C--        | Decrease text scale |

## Dired

| Keybinding | Action                     |
| ---------- | ------                     |
| C-x d      | open dired mode            |
| C-x C-j    | show current file in dired |

### Dired

| Keybinding  | Action                                         |
| ----------  | ------                                         |
| j           | jump to file                                   |
| >           | move to next directory                         |
| <           | move to previous directory                     |
| ^           | move to the parent directory (..)              |
| i           | insert a subtree of the selected directory    |
| ;           | remove the selected subtree                   |
| g           | refresh                                        |
| +           | create a new file                              |
| s           | alternate between sort by name and date        |
| m           | mark a file                                    |
| % m [regex] | mark all fiels that match a regex              |
| u           | unmark a file                                  |
| U           | unmark all files                               |
| * t         | invert marking of files                        |
| * s         | mark all files                                 |
| P           | show file in another windows with peep-dired   |
| C           | copy file under cursor or marked files         |
| R           | rename file under cursor or marked files       |
| D           | delete file under cursor or marked files       |
| Q           | run query-replace on marked files              |
| Z           | compress/decompress                            |
| c           | compress many marked files to a single archive |
| q           | exit dired                                     |
| S           | sort dired buffer with dired-quick-sort        |
| C-x C-q     | switch to WDired to rename files               |

### WDired

| Keybinding | Action               |
| ---------- | ------               |
| C-c C-c    | Save WDired change   |
| C-c ESC    | Cancel WDired change |

## Terminal

| Keybinding | Action                                                      |
| ---------- | ------                                                      |
| C-c t      | Open a terminal (ansi-term)                                 |
| C-F5       | Open an external terminal                                   |
| C-F6       | Open an external terminal for the projectile or git project |

## Git

| Keybinding | Action                                             |
| ---------- | ------                                             |
| C-x g      | Magit status                                       |
| C-x M-g    | Magit list repositories                            |
| C-x G      | Magit blame                                        |
| C-x r G    | Magit blame reverse                                |
| C-x M-d    | Kill all Magit buffers                             |
| C-c g g    | open current buffer at GitHub, GitLab or BitBucket |
| C-x t      | Git timemachine                                    |
| C-c s      | Hydra for smerge-mode                              |

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
| C-c l      | Org store link                                                              |
| C-c C-o    | Org open url at point                                                       |
| M-o        | Select a link to jump to with avy                                           |
| C-c c      | Org capture                                                                 |
| C-c a      | Org agenda                                                                  |
| C-c o b    | Search in all opened org files with helm-org-rifle                          |
| C-c o d    | Search in the org files of a directory with helm-org-rifle                  |
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

## Spelling

| Keybinding | Action                                            |
| ---------- | ------                                            |
| C-c d      | Alternate between english and french dictionaries |
| C-c M-s    | Start ispell on the region or on the buffer       |

## ePub

| Keybinding | Action            |
| ---------- | ------            |
| SPC        | scroll            |
| n          | next section      |
| p          | previous section  |
| t          | table of contents |

## PDF

| Keybinding | Action                              |
| ---------- | ------                              |
| C-s / C-r  | incremental search forward/backward |
| o          | display outline                     |
| + / -      | zoom in/out                         |
