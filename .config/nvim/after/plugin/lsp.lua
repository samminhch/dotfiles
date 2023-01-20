local function map(mode, binding, value)
  vim.keymap.set(mode, binding, value, {silent = true})
end

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

require('mason.settings').set({
  ui = {
    border = 'rounded'
  }
})

-- keybindings
map('n', '<leader>rn', vim.lsp.buf.rename)
map('n', '<leader>rr', vim.lsp.buf.references)
map('n', '<leader>ca', vim.lsp.buf.code_action)
map('n', '<leader>ws', vim.lsp.buf.workspace_symbol)
map('n', '<leader>vd', vim.diagnostic.open_float)
map('i', '<C-h>', vim.lsp.buf.signature_help)

lsp.setup()
