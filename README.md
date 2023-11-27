# nvc

My neovim config:
`nvim` folder w/ all settings

- Windows
    %appdata%\\..\Local\nvim
- Linux
    mkdir -p ~/.config/nvim && cd $_

## Install

Use scripts from this Gist
https://gist.github.com/akorzunin/4dfad794fc658502e5c62379191eb4f0

## Hotkeys

- `<leader>fk` to see keymaps
- `<leader>fc` to see commands

## Fonts

    :GuiFont FiraCode Nerd Font Mono:h12

## Copy error text from commandline

```lua
let @* = execute('messages')
```

### Substitute in selection

- go to visual and select some text
- run `:s/<string to remove>/<string to put>`

