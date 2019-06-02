# Keybindings

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Help](#help)
- [Packages](#packages)
- [Files and buffers](#files-and-buffers)
- [Edition](#edition)
  - [Undo tree](#undo-tree)
  - [Rectangle mark mode](#rectangle-mark-mode)
  - [Multiple cursors](#multiple-cursors)
- [Navigate in current buffer](#navigate-in-current-buffer)
- [Search in buffers](#search-in-buffers)
  - [Search in files](#search-in-files)
- [Terminal](#terminal)
- [Dired](#dired)
  - [Dired](#dired-1)
  - [WDired](#wdired)
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

| Keybinding | Action                             |
| ---------- | ------                             |
| C-c s      | Command prefix for search          |
| C-s        | Search in buffer                   |
| C-M-s      | Search in all opened buffers       |
| C-c s g    | Regex replace                      |
| C-c s q    | Regex query replace                |
| C-c s c    | Select multiple cursors with regex |
| M-i        | imenu in buffer                    |
| C-s s i    | imenu on all opened buffers        |

### Search in files

| Keybinding | Action                                 |
| ---------- | ------                                 |
| C-c s d    | Search files with Ripgrep (deadgrep)   |
| C-c s s    | Search files with Ripgrep (counsel)    |
| M-s        | Prefix for jump to definition commands |
| C-c p      | Command prefix for projectile          |

## Terminal

| Keybinding | Action                   |
| ---------- | ------                   |
| C-c T      | Terminal commands prefix |

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
| i           | insert a subtree of the selected directory     |
| ;           | remove the selected subtree                    |
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
| C-x C-q     | switch to WDired to rename files               |

### WDired

| Keybinding | Action               |
| ---------- | ------               |
| C-c C-c    | Save WDired change   |
| C-c ESC    | Cancel WDired change |

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
