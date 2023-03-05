-- ██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗  ██╗ ██████╗   ██╗     ██╗   ██╗ █████╗
-- ██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗ ██║██╔════╝   ██║     ██║   ██║██╔══██╗
-- ██████╔╝██║     ██║   ██║██║  ██╗ ██║██╔██╗██║╚█████╗    ██║     ██║   ██║███████║
-- ██╔═══╝ ██║     ██║   ██║██║  ╚██╗██║██║╚████║ ╚═══██╗   ██║     ██║   ██║██╔══██║
-- ██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚███║██████╔╝██╗███████╗╚██████╔╝██║  ██║
-- ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚══╝╚═════╝ ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝
-------------------------------------------------------------------------------------
-- @author Minh Nguyen
-- @github https://github.com/samminhch
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -------------
    -- Plugins --
    -------------
    use 'mbbill/undotree'
    use 'paretje/nvim-man'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-surround'
    use 'wellle/targets.vim'
    use 'rcarriga/nvim-notify'
    use 'Raimondi/delimitMate'
    use 'mfussenegger/nvim-jdtls'
    use 'lewis6991/gitsigns.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'lukas-reineke/indent-blankline.nvim'

    use {                                         -- filesystem navigation
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons' -- filesystem icons
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        cond = vim.fn.executable 'make' == 1
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use { 'neoclide/coc.nvim', branch = 'release' }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use({
        "folke/noice.nvim",
        config = function()
            require("noice").setup({
                -- add any options here
            })
        end,
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    })

    use {
        'goolord/alpha-nvim',
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    }

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    ------------
    -- Themes --
    ------------
    use {
        'sainnhe/everforest',
        as = 'everforest',
        config = function()
            vim.cmd.colorscheme('everforest')
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
