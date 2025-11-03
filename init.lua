local function vscode()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- remap leader key
  keymap('n', '<Space>', '', opts)
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  -- yank to system clipboard
  keymap({ 'n', 'v' }, '<leader>y', '"+y', opts)

  -- paste from system clipboard
  keymap({ 'n', 'v' }, '<leader>p', '"+p', opts)

  -- better indent handling
  keymap('v', '<', '<gv', opts)
  keymap('v', '>', '>gv', opts)

  -- paste preserves primal yanked piece
  keymap('v', 'p', '"_dP', opts)

  -- removes highlighting after escaping vim search
  keymap('n', '<Esc>', '<Esc>:noh<CR>', opts)

  -- general keymaps
  keymap({ 'n', 'v' }, '<leader>t', "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
  keymap({ 'n', 'v' }, '<leader>b', "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
  keymap({ 'n', 'v' }, 'K', "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
  keymap({ 'n', 'v' }, '<leader>ca', "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
  keymap({ 'n', 'v' }, '<leader>sf', "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
  keymap({ 'n', 'v' }, '<leader>cp', "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
  keymap({ 'n', 'v' }, '<leader>f', "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")

  keymap({ 'n' }, 'nd', "<cmd>lua require('vscode').action('editor.action.marker.next')<CR>")
  keymap({ 'n' }, 'pd', "<cmd>lua require('vscode').action('editor.action.marker.prev')<CR>")

  -- TODO improve file explorer navigation
  keymap({ 'n', 'v' }, '<leader>e', "<cmd>lua require('vscode').action('workbench.view.explorer')<CR>")

  -- harpoon keymaps
  keymap({ 'n', 'v' }, '<leader>ha', "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
  keymap({ 'n', 'v' }, '<leader>ho', "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
  keymap({ 'n', 'v' }, '<leader>he', "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
  keymap({ 'n', 'v' }, "<leader>'a", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
  keymap({ 'n', 'v' }, "<leader>'s", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
  keymap({ 'n', 'v' }, "<leader>'d", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
  keymap({ 'n', 'v' }, "<leader>'f", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")

  -- project manager keymaps
  keymap({ 'n', 'v' }, '<leader>pa', "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
  keymap({ 'n', 'v' }, '<leader>po', "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
  keymap({ 'n', 'v' }, '<leader>pe', "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")
end

if vim.g.vscode then
  vscode()
else
  require 'core'
end
