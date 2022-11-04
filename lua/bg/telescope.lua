local builtin = require('telescope.builtin')
local keymaps = require('bg.keymaps')

keymaps.set('n', '<leader>f', builtin.find_files,  {}, 'Find files')
keymaps.set('n', '<C-p>', builtin.find_files,  {}, 'Find files')
vim.api.nvim_create_user_command('FindFiles', builtin.find_files, {})

keymaps.set('n', '<leader>G', builtin.live_grep, {}, 'Live grep')
vim.api.nvim_create_user_command('LiveGrep', builtin.live_grep, {})

keymaps.set('n', '<leader>g', builtin.grep_string, {}, 'Grep string under cursor')
vim.api.nvim_create_user_command('GrepString', builtin.grep_string, {})

keymaps.set('n', '<leader>c', builtin.git_bcommits, {}, 'Show git commits for current buffer')
keymaps.set('n', '<leader>C', builtin.git_commits, {}, 'Show git all commits')
keymaps.set('n', '<leader>s', builtin.git_status, {}, 'Show git status')
vim.api.nvim_create_user_command('GitBufferCommits', builtin.git_bcommits, {})
vim.api.nvim_create_user_command('GitCommits', builtin.git_commits, {})
vim.api.nvim_create_user_command('GitStatus', builtin.git_status, {})

keymaps.set('n', '<leader>tr', builtin.resume, {}, 'Resume last Telescope')
vim.api.nvim_create_user_command('TelescopeResume', builtin.resume, {})

keymaps.set('n', '<leader>h', builtin.help_tags, {}, 'Show help tags')
vim.api.nvim_create_user_command('HelpTags', builtin.help_tags, {})

vim.api.nvim_create_user_command('Treesitter', builtin.treesitter, {})
vim.api.nvim_create_user_command('FuzzySearch', builtin.current_buffer_fuzzy_find, {})
vim.api.nvim_create_user_command('Buffers', builtin.buffers, {})
vim.api.nvim_create_user_command('Registers', builtin.registers, {})
vim.api.nvim_create_user_command('Marks', builtin.marks, {})
vim.api.nvim_create_user_command('Locations', builtin.loclist, {})
vim.api.nvim_create_user_command('Quickfix', builtin.quickfix, {})
vim.api.nvim_create_user_command('Commands', builtin.commands, {})
vim.api.nvim_create_user_command('CommandHistory', builtin.command_history, {})

local lspDefinitions = function()
    builtin.lsp_definitions({ jump_type = 'never' })
end
vim.api.nvim_create_user_command('LspDefinitions', lspDefinitions, {})
keymaps.set('n', '<leader>d', lspDefinitions, {}, 'Show LSP definitions')

keymaps.set('n', '<leader>r', builtin.lsp_references, {}, 'Show LSP references')
vim.api.nvim_create_user_command('LspReferences', builtin.lsp_references, {})
