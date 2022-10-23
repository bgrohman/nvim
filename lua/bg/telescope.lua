local builtin = require('telescope.builtin')

vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.find_files, {})
vim.api.nvim_create_user_command('FindFiles', builtin.find_files, {})

vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
vim.api.nvim_create_user_command('LiveGrep', builtin.live_grep, {})

vim.keymap.set('n', 'gs', builtin.grep_string, {})
vim.api.nvim_create_user_command('GrepString', builtin.grep_string, {})

vim.keymap.set('n', 'gc', builtin.git_bcommits, {})
vim.api.nvim_create_user_command('GitBufferCommits', builtin.git_bcommits, {})
vim.api.nvim_create_user_command('GitCommits', builtin.git_commits, {})
vim.api.nvim_create_user_command('GitStatus', builtin.git_status, {})

vim.keymap.set('n', 'tr', builtin.resume, {})
vim.api.nvim_create_user_command('TelescopeResume', builtin.resume, {})

vim.api.nvim_create_user_command('Treesitter', builtin.treesitter, {})
vim.api.nvim_create_user_command('FuzzySearch', builtin.current_buffer_fuzzy_find, {})
vim.api.nvim_create_user_command('Buffers', builtin.buffers, {})
vim.api.nvim_create_user_command('Registers', builtin.registers, {})
vim.api.nvim_create_user_command('Marks', builtin.marks, {})
vim.api.nvim_create_user_command('Locations', builtin.loclist, {})
vim.api.nvim_create_user_command('Quickfix', builtin.quickfix, {})
vim.api.nvim_create_user_command('HelpTags', builtin.help_tags, {})
vim.api.nvim_create_user_command('Keymaps', builtin.keymaps, {})
vim.api.nvim_create_user_command('Commands', builtin.commands, {})
vim.api.nvim_create_user_command('LspReferences', builtin.lsp_references, {})

local lspDefinitions = function()
    builtin.lsp_definitions({jump_type = 'never'})
end
vim.api.nvim_create_user_command('LspDefinitions', lspDefinitions, {})
