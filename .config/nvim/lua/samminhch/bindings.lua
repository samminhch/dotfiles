-- ██████╗ ██╗███╗  ██╗██████╗ ██╗███╗  ██╗ ██████╗  ██████╗   ██╗     ██╗   ██╗ █████╗
-- ██╔══██╗██║████╗ ██║██╔══██╗██║████╗ ██║██╔════╝ ██╔════╝   ██║     ██║   ██║██╔══██╗
-- ██████╦╝██║██╔██╗██║██║  ██║██║██╔██╗██║██║  ██╗ ╚█████╗    ██║     ██║   ██║███████║
-- ██╔══██╗██║██║╚████║██║  ██║██║██║╚████║██║  ╚██╗ ╚═══██╗   ██║     ██║   ██║██╔══██║
-- ██████╦╝██║██║ ╚███║██████╔╝██║██║ ╚███║╚██████╔╝██████╔╝██╗███████╗╚██████╔╝██║  ██║
-- ╚═════╝ ╚═╝╚═╝  ╚══╝╚═════╝ ╚═╝╚═╝  ╚══╝ ╚═════╝ ╚═════╝ ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝
----------------------------------------------------------------------------------------
-- @author Minh Nguyen
-- @github https://github.com/samminhch
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

local g = vim.g
local c = vim.cmd
local b = require('telescope.builtin')

g.mapleader = ' '
g.maplocalleader = ' '

local function nmap(binding, value)
    vim.keymap.set('n', binding, value, { silent = true })
end

local function nmapd(binding, value, description)
    vim.keymap.set('n', binding, value, { desc = description })
end

vim.keymap.set({ 'n', 'v' }, '<space>', '<nop>', { silent = true })
nmap('<leader>ex', c.Ex)
nmap('<leader>gs', vim.cmd.Git)
nmap('<leader>u', vim.cmd.UndotreeToggle)


------------------------
-- Telescope bindings --
------------------------
-- search
nmapd('<leader>sf', b.find_files,  '[S]earch [F]iles')
nmapd('<leader>sg', b.git_files,   '[S]earch [G]it files')
nmapd('<leader>sw', b.grep_string, '[S]earch [W]ord in file')
nmapd('<leader>sd', b.diagnostics, '[S]earch [D]iagnostics')

-- keymaps and help
nmapd('<leader>km', b.keymaps, '[K]ey[M]aps')
nmapd('<leader>h', b.help_tags, '[H]elp [T]ags')

-- lsp keybindings are found in ../../after/plugin/lsp.lua 
