return {
  'stevearc/conform.nvim',
  lazy = false,
  cond = function()
    return not vim.g.vscode
  end,
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = {}
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      c = { name = 'clangd', timeout_ms = 500, lsp_format = 'prefer' },
      cs = { 'csharpier' },
      csproj = { 'csharpier' },
    },
    formatters = {
      csharpier = {
        command = 'csharpier',
        args = {
          'format',
          '--write-stdout',
        },
        to_stdin = true,
      },
    },
  },
}
