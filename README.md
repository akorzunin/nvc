# nvc

My neovim config:
`nvim` folder w/ all settings
- Windows
    %appdata%\Local\nvim
- Linux
    ~./config/nvim

# Hotkeys

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
# Plugins

## Telescope
- find in git repo - ctrl p
- grep - ps 
- in folder - pf
## Harpoon
- hook file Space a
- scroll files Ctrl t / h
- list hooked files Ctrl e
Undotree
- Space u
- Ctrl w arrow
- Close - q
Others
- Show window w/ git status - Space gs



# Installation

## Windows

- install packer
https://github.com/wbthomason/packer.nvim#quickstart
```
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```
- for telescope
```
choco install ripgrep
```
- for Treesitter
```
choco install zig
```

