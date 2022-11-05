-- TODO: Actions
-- TODO: Move into telescope extension and separate repo?
local pickers = require('telescope.pickers')
local entry_display = require('telescope.pickers.entry_display')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local Path = require('plenary.path')

local module = {}
local mappings = {}

module.set = function(mode, lhs, rhs, opts, docString)
    local key = mode .. ' ' .. lhs

    mappings[key] = {
        mode = mode,
        lhs = lhs,
        rhs = rhs,
        docString = docString
    }

    vim.keymap.set(mode, lhs, rhs, opts)
end

local finder = function()
    local displayer = entry_display.create({
        separator = ' ',
        items = {
            { width = 0.15 },
            { width = 0.35 },
            { width = 0.50 }
        }
    })

    local makeDisplay = function(entry)
        return displayer({
            entry.mode .. ' ' .. entry.lhs,
            entry.rhs,
            entry.docString
        })
    end

    local getResultsFromMappings = function(m)
        local results = {}
        for _, v in pairs(m) do
            table.insert(results, v)
        end
        return results
    end

    local getRhsLabel = function(entry)
        local rhs = entry.rhs

        if (type(rhs) == 'function') then
            local rhsInfo = debug.getinfo(rhs)
            -- Shorten path to 1 character per part except for the first and last 2 path parts.
            local functionSourcePath = Path.new(rhsInfo['short_src']):shorten(1, {1, -1, -2})
            rhs = '[Function] ' .. functionSourcePath .. ' ' .. (rhsInfo['name'] or rhsInfo['namewhat'] or '')
        end

        return rhs
    end

    return finders.new_table({
        results = getResultsFromMappings(mappings),
        entry_maker = function(entry)
            local rhs = getRhsLabel(entry)
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
module.set('n', '<leader>k', ':Keymaps<CR>', {}, 'Show keymappings')

return module
