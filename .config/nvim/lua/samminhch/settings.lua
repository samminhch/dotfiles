--  ██████╗███████╗████████╗████████╗██╗███╗  ██╗ ██████╗  ██████╗   ██╗     ██╗   ██╗ █████╗
-- ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗ ██║██╔════╝ ██╔════╝   ██║     ██║   ██║██╔══██╗
-- ╚█████╗ █████╗     ██║      ██║   ██║██╔██╗██║██║  ██╗ ╚█████╗    ██║     ██║   ██║███████║
--  ╚═══██╗██╔══╝     ██║      ██║   ██║██║╚████║██║  ╚██╗ ╚═══██╗   ██║     ██║   ██║██╔══██║
-- ██████╔╝███████╗   ██║      ██║   ██║██║ ╚███║╚██████╔╝██████╔╝██╗███████╗╚██████╔╝██║  ██║
-- ╚═════╝ ╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚══╝ ╚═════╝ ╚═════╝ ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝
----------------------------------------------------------------------------------------------
-- @author Minh Nguyen
-- @github https://github.com/samminhch
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------

local o = vim.o
local c = vim.cmd

-- Editor UI
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true
o.termguicolors = true

-- Editing Experience
o.expandtab = true
o.smarttab = true
o.cindent = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.wrap = true
o.breakindent = true
o.clipboard = 'unnamedplus'
o.hlsearch = false

-- Format on save
c [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- vim searching
o.ignorecase = true
o.smartcase = true
o.hlsearch = true

o.updatetime = 100
o.fileencoding = 'utf-8'

o.history = 50

-- Undo / Backup Options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = true
