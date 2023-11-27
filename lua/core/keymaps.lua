vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.clipboard = unnamedplus
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.lazyredraw = true
vim.opt.relativenumber = true

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.autoread = true

-- use spaces for tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', {noremap = true})

