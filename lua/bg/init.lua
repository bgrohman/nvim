-- TODO
-- Status line
-- Language servers
-- Linters
require('bg.basics')
require('bg.plugins')

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])
