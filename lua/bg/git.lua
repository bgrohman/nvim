local keymapper = require('nvim-keymapper')

require('neogit').setup()
require('gitsigns').setup()

local gitAutoCommit = function()
    local date = os.date('%c')
    local command = '!git add . ; git commit -m "auto commit ' .. date .. '"'
    vim.api.nvim_exec(command, false)
end

vim.api.nvim_create_user_command('GitAutoCommit', gitAutoCommit, {desc = 'Automatically commit all modified files'})
keymapper.set('n', '<leader>ac', gitAutoCommit, {}, 'Automatically commit all modified files')
