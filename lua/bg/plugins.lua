return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-telescope/telescope.nvim'

    -- Colorschemes
    use 'sickill/vim-monokai'
    use 'drewtempelmeyer/palenight.vim'
end)
