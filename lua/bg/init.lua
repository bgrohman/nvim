-- TODO
-- Status line
require('bg.basics')
require('bg.plugins')
require('bg.telescope')
require('bg.git')
require('bg.lsp')
require('bg.leap')

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])
