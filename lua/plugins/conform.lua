vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

require('conform').setup {
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
}

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    if vim.g.minifiles_active then
      return nil
    end

    -- Skip formatting if triggered from my special save command.
    if vim.g.skip_formatting then
      vim.g.skip_formatting = false
      return nil
    end

    require('conform').format { bufnr = args.buf }
  end,
})

vim.keymap.set('n', '<leader>f', function()
  require('conform').format { async = true, lsp_fallback = true }
end)

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
