-- TODO: Actions
-- TODO: Better description for function rhs entries
local pickers = require('telescope.pickers')
local entry_display = require('telescope.pickers.entry_display')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

local module = {}
local mappings = {}

module.set = function(mode, lhs, rhs, opts, docString)
    table.insert(mappings, {
        mode = mode,
        lhs = lhs,
        rhs = rhs,
        docString = docString
    })

    vim.keymap.set(mode, lhs, rhs, opts)
end

local finder = function()
    local displayer = entry_display.create({
        separator = ' ',
        items = {
            { width = 0.2 },
            { width = 0.2 },
            { width = 0.6 }
        }
    })

    local makeDisplay = function(entry)
        return displayer({
            entry.mode .. ' ' .. entry.lhs,
            entry.rhs,
            entry.docString
        })
    end

    return finders.new_table({
        results = mappings,
        entry_maker = function(entry)
            local rhs = entry.rhs
            if (type(rhs) == 'function') then
                rhs = 'Function'
            end
            return {
                value = entry.lhs,
                ordinal = entry.mode .. ' ' .. entry.lhs .. ' ' .. rhs .. ' ' .. entry.docString,
                mode = entry.mode,
                lhs = entry.lhs,
                rhs = rhs,
                docString = entry.docString,
                display = makeDisplay
            }
        end
    })
end

local keymapsPicker = function(opts)
    opts = opts or {}

    pickers.new(opts, {
        prompt_title = 'Keymaps',
        finder = finder(),
        sorter = conf.generic_sorter(opts)
    }):find()
end

vim.api.nvim_create_user_command('Keymaps', keymapsPicker, {})

return module
