return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'Issafalcon/neotest-dotnet',
  },
  opts = {},
  config = function()
    ---@diagnostic disable-next-line: lowercase-global
    neotest = require 'neotest'

    ---@diagnostic disable-next-line: missing-fields
    neotest.setup {
      adapters = {
        require 'neotest-dotnet' {
          dap = {
            -- Extra arguments for nvim-dap configuration
            -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
            args = { justMyCode = false },
            -- Enter the name of your dap adapter, the default value is netcoredbg
            adapter_name = 'coreclr',
          },
        },
      },
    }

    vim.keymap.set('n', '<leader>rt', function()
      neotest.run.run()
    end)

    vim.keymap.set('n', '<leader>dt', function()
      neotest.run.run { strategy = 'dap' }
    end)
  end,
}
