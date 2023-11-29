vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup()

vim.keymap.set('n', '<c-n>', ':NvimTreeOpen<CR>')
vim.keymap.set('n', '<c-f>', ':NvimTreeFocus<CR>')
vim.keymap.set('n', '<c-c>', ':NvimTreeClose<CR>')

