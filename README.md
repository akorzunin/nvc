# nvc

My neovim config:
`nvim` folder w/ all settings

- Windows
    %appdata%\..\Local\nvim
- Linux
    mkdir -p ~/.config/nvim && cd $_

## Install

### Install neovim

Use scripts from this Gist
https://gist.github.com/akorzunin/4dfad794fc658502e5c62379191eb4f0

## Hotkeys

### General

- new file %
- new folder `p`
- switch between windows ctrl w + arrow
- scroll without moving cursor Ctrl + E and Ctrl + Y
- undo redo u :u :r
- Cut-Copy-Paste from Windows clipboard:
 Cut: `"+x`
 Copy: `"+y`
 Paste: `"+gp`

- Ctrl R in nvim commandline to paste from register

LSP

- prev/next suggestion Ctrl p/n
- apply current suggestion Ctrl y
- show suggestion list Ctrl Space

### visual

- move selection `shift j / k`
-

Git (`Space gs` view)

- Discard file X
-

## nvchad

### nvimTree

a - add file/folder
_m - mark file
c p - copy paste file
r - rename file
Ctrl K - file info

### window navigation

Ctrl hjkl - move cursor
:sp slpit
:vsp vertical split
_x - close file as tab

## Fonts

in vim commandline:

    :GuiFont FiraCode Nerd Font Mono:h12

## Copy error text from commandline

```lua
let @* = execute('messages')
```

## Format whole file (F3 or A-F)

   :lua vim.lsp.buf.format()

### substitute in selection

- go t visual
- selec some text
- run `:s`
- type /`string to remove`/`string to put`


### go debugger
install delve w/:

    go install github.com/go-delve/delve/cmd/dlv@latest
