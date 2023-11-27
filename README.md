# NVIM Configuration

## Plugins
* packer - This is for the plugin installation
* dracula - Neovim theme
* nvim-tree - Folder searcher
* lualine - provides a status line with information about the file and system 
* nvim-web-devicons - nvim-tree icons for the folders and files
* Mason, mason-lsp, lsp-config - LSP configuration
* tree-sitter - parser generator tool for syntax highlighting and language parsing
* telescope - file, text searcher

## Special Key Commands

* :PackerInstall - Installs new plugins found in the plugins.lua 
* :PackerUpdate - Updates Plugins
* :PackerSync - Syncs Plugins
* <\leader>h - removes highlighting caused by /, ?, etc. <\leader> == spacebar.
* <\C-n> - opens nvim-tree
* <\C-f> - focuses to nvim-tree
* <\leader>fg - live grep

## Additional Things That I have had to install

* ripgrep: sudo apt install ripgrep (command rg). (Used for live grep in telescope)
* A nerd font: I used the Jet Brains Mono Regular font but up to you
* rbvenv: For colorls
* unzip: for terraformls

