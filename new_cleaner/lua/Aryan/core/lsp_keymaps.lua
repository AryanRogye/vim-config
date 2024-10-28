local M = {}

M.set_lsp_keymaps = function(bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- LSP Key Mappings
    vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, opts)            -- Show hover documentation
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)      -- Go to definition
    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)     -- Go to declaration
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)  -- Go to implementation
    vim.keymap.set('n', '<leader>go', vim.lsp.buf.type_definition, opts)  -- Go to type definition
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)       -- Find references
end

return M
