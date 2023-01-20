local builtin = require('telescope.builtin')
local function map(mode, binding, value)
  vim.keymap.set(mode, binding, value, {silent = true})
end

map('n', '<leader>ff', builtin.find_files)
map('n', '<leader>fg', builtin.git_files)
map('n', '<leader>fs', function()
        builtin.grep_string( {search = vim.fn.input('Grep > ') } )
end)
