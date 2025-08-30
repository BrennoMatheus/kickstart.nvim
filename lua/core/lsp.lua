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

  local telescope_builtin = require 'telescope.builtin'

  map('gd', telescope_builtin.lsp_definitions)
  map('gr', telescope_builtin.lsp_references)
  map('gi', telescope_builtin.lsp_implementations)
  map('<leader>D', telescope_builtin.lsp_type_definitions)
  map('<leader>ds', telescope_builtin.lsp_document_symbols)
  map('<leader>rn', vim.lsp.buf.rename)
  map('<leader>ca', vim.lsp.buf.code_action)
  map('K', vim.lsp.buf.hover)
  map('gD', vim.lsp.buf.declaration)

  map('[d', function()
    vim.diagnostic.jump { count = -1 }
  end)

  map(']d', function()
    vim.diagnostic.jump { count = 1 }
  end)

  map('<leader>di', vim.diagnostic.open_float)

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
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
}

vim.lsp.enable { 'lua_ls', 'clangd', 'roslyn_ls' }
