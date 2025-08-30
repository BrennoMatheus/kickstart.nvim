vim.pack.add { 'https://github.com/mason-org/mason.nvim' }

require('mason').setup {
  registries = {
    -- add custom registry to install roslyn
    'github:mason-org/mason-registry',
    'github:Crashdummyy/mason-registry',
  },
}
