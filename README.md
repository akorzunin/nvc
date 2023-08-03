# nvc

My neovim config:
`nvim` folder w/ all settings

- Windows
    %appdata%\..\Local\nvim
- Linux
    ~./config/nvim

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

## Plugins

### Telescope

- find in git repo - ctrl p
- grep - ps
- in folder - pf

### Harpoon

- hook file Space a
- scroll files Ctrl t / h
- list hooked files Ctrl e
Undotree
- Space u
- Ctrl w arrow
- Close - q
Others
- Show window w/ git status - Space gs

## Installation

### Windows

- install packer
<https://github.com/wbthomason/packer.nvim#quickstart>

```
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

- for telescope (use admin cmd)

```
choco install ripgrep
```

- for Treesitter (use admin cmd)

```
choco install zig
```

install fonts from [here](https://www.nerdfonts.com/font-downloadshttps://www.nerdfonts.com/font-downloads)

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

Download fonts

    git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts
    cd nerd-fonts
    git sparse-checkout add patched-fonts/JetBrainsMono
    git sparse-checkout add patched-fonts/FiraCode
    ./install

in vim commandline:

    :GuiFont FiraCode Nerd Font Mono:h12


## Install fd

to make python venv selector work need to install fd

on windows from admin shell: 
```
choco install fd
```

