local M = {}

function M.setup()
  require('ide.lsp').setup()
  require('ide.cmp').setup()
  require('ide.dap').setup()
end

return M
