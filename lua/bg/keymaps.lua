-- TODO: Move into telescope extension and separate repo?
local pickers = require('telescope.pickers')
local entry_display = require('telescope.pickers.entry_display')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local Path = require('plenary.path')

local module = {}
local mappings = {}

module.set = function(mode, lhs, rhs, opts, doc_string)
    local key = mode .. ' ' .. lhs

    mappings[key] = {
        mode = mode,
        lhs = lhs,
        rhs = rhs,
        doc_string = doc_string
    }

    vim.keymap.set(mode, lhs, rhs, opts)
end

local finder = function()
    local displayer = entry_display.create({
        separator = '│ ',
        items = {
            { width = 0.15 },
            { width = 0.35 },
            { width = 0.50 }
        }
    })

    local make_display = function(entry)
        return displayer({
            {entry.mode .. ' ' .. entry.lhs, 'TelescopeResultsIdentifier'},
            {entry.rhs, 'TelescopeResultsComment'},
            {entry.doc_string, 'TelescopeResultsFunction'}
        })
    end

    local get_results_from_mappings = function(m)
        local results = {}
        for _, v in pairs(m) do
            table.insert(results, v)
        end
        return results
    end

    local get_rhs_label = function(entry)
        local rhs = entry.rhs

        if (type(rhs) == 'function') then
            local rhs_info = debug.getinfo(rhs)
            -- Shorten path to 1 character per part except for the first and last 2 path parts.
            local function_source_path = Path.new(rhs_info['short_src']):shorten(1, {1, -1, -2})
            rhs = '[Function] ' .. function_source_path .. ' ' .. (rhs_info['name'] or rhs_info['namewhat'] or '')
        end

        return rhs
    end

    return finders.new_table({
        results = get_results_from_mappings(mappings),
        entry_maker = function(entry)
            local rhs = get_rhs_label(entry)
            return {
                value = entry.lhs,
                ordinal = entry.mode .. ' ' .. entry.lhs .. ' ' .. rhs .. ' ' .. entry.doc_string,
                mode = entry.mode,
                lhs = entry.lhs,
                rhs = rhs,
                doc_string = entry.doc_string,
                display = make_display
            }
        end
    })
end

module.keymaps_picker = function(opts)
    opts = opts or {}

    pickers.new(opts, {
        prompt_title = 'Keymaps',
        finder = finder(),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local leader = vim.g.mapleader or '\\\\'
                local keys = string.gsub(selection['lhs'], '<leader>', leader)
                keys = vim.api.nvim_replace_termcodes(keys, true, false, true)
                vim.api.nvim_input(keys)
            end)
            return true
        end,
    }):find()
end

vim.api.nvim_create_user_command('Keymaps', module.keymaps_picker, {})
module.set('n', '<leader>k', ':Keymaps<CR>', {}, 'Show keymappings')

return module
