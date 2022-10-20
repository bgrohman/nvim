local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
vim.keymap.set('n', 'gs', builtin.grep_string, {})
vim.keymap.set('n', 'gc', builtin.git_bcommits, {})
vim.keymap.set('n', 'ts', builtin.treesitter, {})
vim.keymap.set('n', 'fz', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', 'tr', builtin.resume, {})
-- TODO What keymap for builtin.git_status?
-- TOOD consider: marks, loclist, quickfix, registers, lsp stuff
