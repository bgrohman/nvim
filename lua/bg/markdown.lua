local module = {}

module.setLocalPlainText = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.list = false
    vim.opt_local.wrapmargin = 0
    vim.opt_local.formatoptions = 'tcoqnl1j'
    vim.opt_local.autoindent = true
    vim.opt_local.smartindent = true
    vim.opt_local.indentexpr = '0'
    vim.opt_local.breakindent = true
    vim.opt_local.comments = ''
    vim.opt_local.commentstring = '> %s'

    -- Make j and k move between visible (wrapped) lines
    vim.api.nvim_buf_set_keymap(0, 'n', 'j', 'gj', {})
    vim.api.nvim_buf_set_keymap(0, 'n', 'k', 'gk', {})

    vim.opt_local.foldmethod = 'expr'
    vim.api.nvim_exec([[
        function! MarkdownFoldLevel() 
            let h = matchstr(getline(v:lnum), '^#\+') 
            if empty(h) 
                return "=" 
            else 
                return ">" . len(h) 
            endif 
        endfunction
        setlocal! foldexpr=MarkdownFoldLevel()
    ]], false)
end

vim.api.nvim_create_user_command('PlainText', module.setLocalPlainText, {desc = 'Set plaintext settings locally'})

vim.api.nvim_create_augroup('PlainText', {clear = true})
-- TODO: foldexpr stuff not working after auto command runs
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    group = 'PlainText',
    pattern = {'*.txt', '*.md'},
    callback = module.setLocalPlainText
})

return module
