local lspconfig = require('lspconfig')
local lspkind = require('lspkind')
local symbols_outline = require('symbols-outline')
local keymapper = require('nvim-keymapper')
local lint = require('lint')
local vale = require('lint.linters.vale')

lspkind.init()
symbols_outline.setup()

-- Lint setup
-- TODO: Better spelling dictionary management.
lint.linters_by_ft = {
    markdown = {'vale'},
    text = {'vale'}
}
table.insert(vale.args, '--config')
table.insert(vale.args, '/Users/bryan/.config/vale/vale.ini')
vim.api.nvim_create_augroup('Vale', {clear = true})
vim.api.nvim_create_autocmd({'BufRead', 'BufWritePost', 'InsertLeave', 'TextChanged'}, {
    group = 'Vale',
    pattern = {'*.md'},
    callback = function()
        lint.try_lint('vale')
    end
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
keymapper.set('n', '<leader>e', vim.diagnostic.open_float, opts, 'LSP: Open diagnostics')
keymapper.set('n', '[d', vim.diagnostic.goto_prev, opts, 'LSP: Previous diagnostic')
keymapper.set('n', ']d', vim.diagnostic.goto_next, opts, 'LSP: Next diagnostic')
keymapper.set('n', '<leader>q', vim.diagnostic.setloclist, opts, 'LSP: Set location list to diagnostics')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  keymapper.set('n', 'gD', vim.lsp.buf.declaration, bufopts, 'LSP: Go to declaration')
  keymapper.set('n', 'gd', vim.lsp.buf.definition, bufopts, 'LSP: Go to definition')
  keymapper.set('n', 'K', vim.lsp.buf.hover, bufopts, 'LSP: Hover')
  keymapper.set('n', 'gi', vim.lsp.buf.implementation, bufopts, 'LSP: Go to implementation')
  keymapper.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts, 'LSP: Signature help')
  keymapper.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts, 'LSP: Add workspace folder')
  keymapper.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts, 'LSP: Remove workspace folder')
  keymapper.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts, 'LSP: Show workspace folders')
  keymapper.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts, 'LSP: Type definition')
  keymapper.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts, 'LSP: Rename')
  keymapper.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts, 'LSP: Code action')
  keymapper.set('n', 'gr', vim.lsp.buf.references, bufopts, 'LSP: Show references')
  keymapper.set('n', '<leader>F', function() vim.lsp.buf.format { async = true } end, bufopts, 'LSP: Format')
end

lspconfig.sumneko_lua.setup{
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'}
            }
        }
    }
}

local htmlCapabilities = vim.lsp.protocol.make_client_capabilities()
htmlCapabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.html.setup{
    capabilities = htmlCapabilities,
    on_attach = on_attach,
    settings = {
        css = {
            lint = {
                validProperties = {}
            }
        }
    }
}

lspconfig.bashls.setup{on_attach = on_attach}
lspconfig.cssls.setup{on_attach = on_attach}
lspconfig.eslint.setup{on_attach = on_attach}
lspconfig.gopls.setup{on_attach = on_attach}
lspconfig.pyright.setup{on_attach = on_attach}
lspconfig.sqlls.setup{on_attach = on_attach}
lspconfig.tsserver.setup{on_attach = on_attach}
