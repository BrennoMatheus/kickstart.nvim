if vim.g.vscode then
  require 'core.vscode'
else
  require 'core.options'
  require 'core.remap'
  require 'core.autocommands'
end

require 'core.lazy'
