return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cond = function()
    return not vim.g.vscode
  end,
  opts = {
    options = {
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = { 'filetype' },
      lualine_y = { 'lsp_status' },
      lualine_z = {},
    },
  },
}
