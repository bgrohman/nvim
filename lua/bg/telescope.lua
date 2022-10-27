local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.api.nvim_create_user_command('FindFiles', builtin.find_files, {})

vim.keymap.set('n', '<leader>G', builtin.live_grep, {})
vim.api.nvim_create_user_command('LiveGrep', builtin.live_grep, {})

vim.keymap.set('n', '<leader>g', builtin.grep_string, {})
vim.api.nvim_create_user_command('GrepString', builtin.grep_string, {})

vim.keymap.set('n', '<leader>c', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>C', builtin.git_commits, {})
vim.keymap.set('n', '<leader>s', builtin.git_status, {})
vim.api.nvim_create_user_command('GitBufferCommits', builtin.git_bcommits, {})
vim.api.nvim_create_user_command('GitCommits', builtin.git_commits, {})
vim.api.nvim_create_user_command('GitStatus', builtin.git_status, {})

vim.keymap.set('n', '<leader>tr', builtin.resume, {})
vim.api.nvim_create_user_command('TelescopeResume', builtin.resume, {})

vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
vim.api.nvim_create_user_command('HelpTags', builtin.help_tags, {})

vim.api.nvim_create_user_command('Treesitter', builtin.treesitter, {})
vim.api.nvim_create_user_command('FuzzySearch', builtin.current_buffer_fuzzy_find, {})
vim.api.nvim_create_user_command('Buffers', builtin.buffers, {})
vim.api.nvim_create_user_command('Registers', builtin.registers, {})
vim.api.nvim_create_user_command('Marks', builtin.marks, {})
vim.api.nvim_create_user_command('Locations', builtin.loclist, {})
vim.api.nvim_create_user_command('Quickfix', builtin.quickfix, {})
vim.api.nvim_create_user_command('Keymaps', builtin.keymaps, {})
vim.api.nvim_create_user_command('Commands', builtin.commands, {})
vim.api.nvim_create_user_command('CommandHistory', builtin.command_history, {})

local lspDefinitions = function()
    builtin.lsp_definitions({ jump_type = 'never' })
end
vim.api.nvim_create_user_command('LspDefinitions', lspDefinitions, {})
vim.keymap.set('n', '<leader>d', lspDefinitions, {})

vim.keymap.set('n', '<leader>r', builtin.lsp_references, {})
vim.api.nvim_create_user_command('LspReferences', builtin.lsp_references, {})
