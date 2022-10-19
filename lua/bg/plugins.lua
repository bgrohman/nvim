return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-telescope/telescope.nvim'

    -- Git
    use 'TimUntersberger/neogit'

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Colorschemes
    use 'sickill/vim-monokai'
end)
