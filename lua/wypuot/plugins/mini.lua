vim.pack.add { 'https://github.com/echasnovski/mini.nvim' }

-- Better Around/Inside textobjects
--
-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yinq - [Y]ank [I]nside [N]ext [']quote
--  - ci'  - [C]hange [I]nside [']quote
require('mini.ai').setup { n_lines = 500 }

-- Add/delete/replace surroundings (brackets, quotes, etc.)
--
-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
require('mini.surround').setup()

require('mini.icons').setup()
require('mini.files').setup()
require('mini.splitjoin').setup()
require('mini.pairs').setup()
require('mini.extra').setup()

local win_config = function()
  local height = math.floor(0.618 * vim.o.lines)
  local width = math.floor(0.618 * vim.o.columns)
  return {
    anchor = 'NW',
    height = height,
    width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
  }
end

require('mini.pick').setup { window = { config = win_config } }

vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open()<CR>')
vim.keymap.set('n', '<leader>sf', '<cmd>Pick files<CR>')
vim.keymap.set('n', '<leader>sg', '<cmd>Pick grep_live<CR>')
vim.keymap.set('n', '<leader>sh', '<cmd>Pick help<CR>')
