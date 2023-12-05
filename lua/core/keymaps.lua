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
vim.keymap.set('n', '<leader>o', 'o<Esc>')
vim.keymap.set('n', '<leader>O', 'O<Esc>')

vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', {noremap = true})

vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
        ['+'] = 'clip.exe',
        ['*'] = 'clip.exe',
    },
    paste = {
        ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
}

