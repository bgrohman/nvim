local packer = require('packer')
return packer.startup(function()
    local use = packer.use

    use 'wbthomason/packer.nvim'

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-telescope/telescope.nvim'

    -- Git
    use 'TimUntersberger/neogit'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind.nvim'

    -- Leap
    use 'ggandor/leap.nvim'

    -- Colorschemes
    use 'sickill/vim-monokai'
    use 'preservim/vim-colors-pencil'
    use 'sainnhe/everforest'
    use 'dracula/vim'
    use 'arcticicestudio/nord-vim'
    use 'ayu-theme/ayu-vim'
end)
