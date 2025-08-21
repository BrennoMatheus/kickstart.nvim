local function setup_autocomplete(event, client)
  if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
    vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }

    vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })

    vim.keymap.set('i', '<C-Space>', function()
      vim.lsp.completion.get()
    end)
  end
end

local function setup_keymaps(event, client)
  local map = function(keys, func)
    vim.keymap.set('n', keys, func, { buffer = event.buf })
  end

  map('gd', '<cmd>Pick lsp scope="definition"<CR>')

  map('gr', '<cmd>Pick lsp scope="references"<CR>')

  map('gi', '<cmd>Pick lsp scope="implementation"<CR>')

  map('<leader>D', '<cmd>Pick lsp scope="type_definition"<CR>')

  map('<leader>ds', '<cmd>Pick lsp scope="document_symbol"<CR>')

  map('<leader>rn', vim.lsp.buf.rename)

  map('<leader>ca', vim.lsp.buf.code_action)

  map('K', vim.lsp.buf.hover)

  map('gD', '<cmd>Pick lsp scope="declaration"<CR>')

  map('[d', function()
    vim.diagnostic.jump { count = -1 }
  end)

  map(']d', function()
    vim.diagnostic.jump { count = 1 }
  end)

  map('<leader>gl', vim.diagnostic.open_float)

  if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
    map('<leader>th', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end)
  end
end

local function on_lsp_attach(event)
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  setup_keymaps(event, client)
  -- setup_autocomplete(event)
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = on_lsp_attach,
})

vim.diagnostic.config {
  virtual_lines = true,
}

vim.lsp.enable 'lua_ls'
vim.lsp.enable 'clangd'
vim.lsp.enable 'roslyn_ls'
