vim.o.termguicolors = true
vim.cmd.colorscheme('monokai')

-- Path
-- empty = current directory
-- ** = downward from the current directory
-- . = relative to directory of current file
vim.o.path = ',,**,.'

-- Misc
vim.cmd.filetype('plugin on')
vim.o.backup = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.history=10000
vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.showcmd = true
vim.o.scrolloff = 5

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
vim.o.foldlevel = 3
vim.o.foldignore = ''

-- Text Completion
vim.o.wildmode = 'longest,list,full'
vim.o.wildmenu = true
vim.o.wildignore = '*.o,*.class,CVS,*.pyc,.svn,.git,.gitignore,.idea,bin,target,build,node,node_modules,vendor'
vim.o.omnifunc = 'syntaxcomplete#Complete'

-- Keymaps
vim.keymap.set('n', '<leader>rc', '<ESC>:e $MYVIMRC<CR>')
vim.keymap.set('n', '<leader>cd', '<ESC>:cd %:h<CR>')
vim.keymap.set('n', '<leader>marks', '<ESC>:marks a-zA-Z<CR>')
vim.keymap.set('i', '<C-Space>', '<C-x><C-o>') -- Omni mode completion
