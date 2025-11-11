return {
  'nvim-tree/nvim-web-devicons',
  opts = {},
  cond = function()
    return not vim.g.vscode
  end,
}
