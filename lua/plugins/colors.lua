return {
  'catppuccin/nvim',
  priority = 1000,
  cond = function()
    return not vim.g.vscode
  end,
  init = function()
    require('catppuccin').setup {
      flavour = 'mocha',
      transparent_background = true,
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
