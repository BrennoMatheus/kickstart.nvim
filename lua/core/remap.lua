-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }

keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)

keymap('n', '<leader>w', '<cmd>w<CR>', opts)
keymap('n', '<leader>q', '<cmd>q<CR>', opts)

keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

keymap('v', 'p', '"_dP', opts)

keymap('n', '<leader>o', ':restart<CR>', opts)
