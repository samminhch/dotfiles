-- ██╗███╗  ██╗██╗████████╗   ██╗     ██╗   ██╗ █████╗ 
-- ██║████╗ ██║██║╚══██╔══╝   ██║     ██║   ██║██╔══██╗
-- ██║██╔██╗██║██║   ██║      ██║     ██║   ██║███████║
-- ██║██║╚████║██║   ██║      ██║     ██║   ██║██╔══██║
-- ██║██║ ╚███║██║   ██║   ██╗███████╗╚██████╔╝██║  ██║
-- ╚═╝╚═╝  ╚══╝╚═╝   ╚═╝   ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝
-------------------------------------------------------
-- @author Minh Nguyen
-- @github https://github.com/samminhch
-------------------------------------------------------
-------------------------------------------------------

-------------
-- Imports --
-------------
require('samminhch.plugins')
require('samminhch.settings')
require('samminhch.bindings')

-------------
-- Theming --
-------------
vim.cmd.colorscheme('everforest')

vim.g.everforest_disable_italic_comment = true
vim.g.everforest_transparent_background = true

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
