local lspconfig = require('lspconfig')
local keymaps = require('bg.keymaps')

require('lspkind').init()
require('symbols-outline').setup()

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
keymaps.set('n', '<leader>e', vim.diagnostic.open_float, opts, 'LSP: Open diagnostics')
keymaps.set('n', '[d', vim.diagnostic.goto_prev, opts, 'LSP: Previous diagnostic')
keymaps.set('n', ']d', vim.diagnostic.goto_next, opts, 'LSP: Next diagnostic')
keymaps.set('n', '<leader>q', vim.diagnostic.setloclist, opts, 'LSP: Set location list to diagnostics')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  keymaps.set('n', 'gD', vim.lsp.buf.declaration, bufopts, 'LSP: Go to declaration')
  keymaps.set('n', 'gd', vim.lsp.buf.definition, bufopts, 'LSP: Go to definition')
  keymaps.set('n', 'K', vim.lsp.buf.hover, bufopts, 'LSP: Hover')
  keymaps.set('n', 'gi', vim.lsp.buf.implementation, bufopts, 'LSP: Go to implementation')
  keymaps.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts, 'LSP: Signature help')
  keymaps.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts, 'LSP: Add workspace folder')
  keymaps.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts, 'LSP: Remove workspace folder')
  keymaps.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts, 'LSP: Show workspace folders')
  keymaps.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts, 'LSP: Type definition')
  keymaps.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts, 'LSP: Rename')
  keymaps.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts, 'LSP: Code action')
  keymaps.set('n', 'gr', vim.lsp.buf.references, bufopts, 'LSP: Show references')
  keymaps.set('n', '<leader>F', function() vim.lsp.buf.format { async = true } end, bufopts, 'LSP: Format')
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
