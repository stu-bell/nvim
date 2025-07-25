# ~/.vim config
Personal vim configuration. Clone into ~/.vim

**Use at your own risk.**

# Plugins
Using [pathogen](https://github.com/tpope/vim-pathogen) for plugins. Plugins are downloaded to ~/.vim/bundle.
This repo ignores ~/.vim/bundle but maintains a list of installed plugins in plugins.list.

Script ~/.vim/get <url> clones a plugin into ~/.vim/bundle and adds the url to plugins.list

Script ~/.vim/getlist <list> clones a list of git urls into ~/.vim/bundle. Turns out I also wrote install.sh, forgetting about getlist. They both look the same. 

# NeoVim
Create a directory symlink from ~/.vim/nvim to ~/AppData/Local/nvim
