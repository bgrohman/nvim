-- TODO
-- Debugging
-- Project tree view
local packer = require('packer')
return packer.startup(function()
    local use = packer.use

    use 'wbthomason/packer.nvim'

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-telescope/telescope.nvim'
    use 'bgrohman/nvim-keymapper'

    -- Git
    use 'TimUntersberger/neogit'
    use 'lewis6991/gitsigns.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind.nvim'
    use 'simrat39/symbols-outline.nvim'
    use 'typescript-language-server/typescript-language-server'
    use 'mfussenegger/nvim-lint'

    -- Leap
    use 'ggandor/leap.nvim'

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Sessions
    use 'rmagatti/auto-session'

    -- Tabs
    use 'crispgm/nvim-tabline'

    -- Tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    -- Colorschemes
    use 'sickill/vim-monokai'
    use 'preservim/vim-colors-pencil'
    use 'sainnhe/everforest'
    use 'dracula/vim'
    use 'arcticicestudio/nord-vim'
    use 'ayu-theme/ayu-vim'
    use 'aditya-azad/candle-grey'
    use 'axvr/photon.vim'
    use 'hardselius/warlock'
    use 'gruvbox-community/gruvbox'
    use({'catppuccin/nvim', as = 'catppuccin'})
    use 'olimorris/onedarkpro.nvim'
    use 'pbrisbin/vim-colors-off'
end)
