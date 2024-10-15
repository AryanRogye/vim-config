-- lsp_mappings.lua
local M = {}

function M.setup(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Key mappings for LSP
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

    -- Hover with fallback to signature help if hover isn't available
    vim.keymap.set('n', '<C-k>', function()
        if vim.lsp.buf.hover then
            vim.lsp.buf.hover()
        else
            vim.lsp.buf.signature_help()
        end
    end, opts)

    vim.keymap.set('n', '<C-LeftMouse>', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
end

return M
