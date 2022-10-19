-- TODO
-- Text completion
-- Colorschemes
-- Plugins
-- Status line
-- Language servers
-- Linters
-- GitHub repo

vim.o.termguicolors = true
vim.cmd.colorscheme('slate')

-- Path
-- empty = current directory
-- ** = downward from the current directory
-- . = relative to directory of current file
vim.o.path = ',,**,.'

-- Misc
vim.o.backup = true
vim.o.history=10000
vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.showcmd = true
vim.o.scrolloff = 3

-- Indentation
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.shiftround = true

-- Searching
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Folding
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 999
vim.o.foldignore = ''

-- Keymaps
vim.keymap.set('n', '<leader>rc', '<ESC>:e $MYVIMRC<CR>')
vim.keymap.set('n', '<leader>cd', '<ESC>:cd %:h<CR>')
vim.keymap.set('n', '<leader>marks', '<ESC>:marks a-zA-Z<CR>')
