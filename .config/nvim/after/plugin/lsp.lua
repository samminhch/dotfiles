local function map(mode, binding, value)
  vim.keymap.set(mode, binding, value, {silent = true})
end

-- lsp-zero setup
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

-- mason settings
require('mason.settings').set({
  ui = {
    border = 'rounded'
  }
})

-- keybindings
local b = require('telescope.builtin')
map('n', '<leader>rn', vim.lsp.buf.rename)
map('n', '<leader>ca', vim.lsp.buf.code_action)
map('n', '<leader>do', vim.diagnostic.open_float)
map('n', '<leader>dp', vim.diagnostic.goto_prev)
map('n', '<leader>dn', vim.diagnostic.goto_prev)
map('n', '<leader>ff', vim.lsp.buf.format)
map('i', '<C-h>', vim.lsp.buf.signature_help)
map('n', '<leader>ds', b.lsp_document_symbols)
map('n', '<leader>ws', b.lsp_dynamic_workspace_symbols)
map('n', '<leader>gr', b.lsp_references)

lsp.setup()
