# Neovim config

Config in `~\AppData\Local\nvim`

init.lua entry point. lua folder for most config

# Global config

Global keymaps, options and autocmds can be configured: https://www.lazyvim.org/configuration/general

Plugin specific keymaps can be added to the corresponding plugin spec https://www.lazyvim.org/configuration/keymaps

# Plugins

Using [lazy.nvim](https://github.com/folke/lazy.nvim)

Add plugin config to lua folder

When adding a plugin, check that it plays well with any devcontainer setup you use.


## Disable plugins

Run `nvim --clean` or `nvim --noplugin` to remove all plugins

Disable individual plugins with Lazy.nvim by setting `enabled = false` in the plugin's config lua.

# Starter configs

When changing configs, you may need to clear the nvim-data folder, or rename it to nvim-data.bak

## [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) - designed to be a starter config that you can modify yourself

    - [Dependency installation on Windows](https://github.com/nvim-lua/kickstart.nvim?tab=readme-ov-file#windows-installation) - see wsl option
    - [Modular fork of kickstart](https://github.com/dam9000/kickstart-modular.nvim) aims to maintain the same config, just separated out into different files for plugins and config

## [Lazyvim.org](https://lazyvim.org)

by the same author as lazy.nvim, is a featureful starter config, for which you can override the defaults. 

However: it loads a lot of plugins you don't necessarily know about or use yet. It's default config is hidden, and must be overridden, [as justified here](https://github.com/LazyVim/LazyVim/discussions/129)


# tree sitter

For code parsing

Disabled due to lack of C compiler

# Cheatsheets

Using `doctorfree/cheatsheet`

`:Cheatsheet` to display searchable popup help tips for installed plugins. Also can search through cheatsheets added but that don't have a plugin installed yet, if you've added the cheatsheet

