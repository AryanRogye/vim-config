-- ~/.config/nvim/lua/lsp.lua

-- Mason LSPConfig Setup
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})


local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = {"gopls", "clangd", "pyright", "rust_analyzer", "jdtls"},
    automatic_installation = true,
})

local lspconfig = require("lspconfig")

-- Standard on_attach function for LSP
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

    -- LSP Keybindings
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)           -- Go to definition
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)           -- Show references to symbol
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)       -- Go to implementation
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)                 -- Show hover documentation
    vim.keymap.set('n', '<C-LeftMouse>', vim.lsp.buf.definition, opts) -- Go to definition with Ctrl + Left Click
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)       -- Rename symbol
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)  -- Show code actions
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)         -- Go to previous diagnostic
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)         -- Go to next diagnostic
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts) -- Show line diagnostics in a floating window
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts) -- Add diagnostics to quickfix list
end

-- LSP Capabilities with nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Configure LSP servers
lspconfig.rust_analyzer.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.gopls.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.clangd.setup { 
    on_attach = on_attach, 
    capabilities = capabilities,
    cmd = {
        "clangd", 
        "--header-insertion=never",
        "--compile-commands-dir=.",
        "-I/opt/homebrew/opt/glfw/include",  -- Include GLFW headers
        "-L/opt/homebrew/opt/glfw/lib",      -- GLFW library path
        "-std=c++20"                         -- C++ standard
    }
}
lspconfig.ts_ls.setup { on_attach = on_attach, capabilities = capabilities }  -- TypeScript LSP
lspconfig.pyright.setup { on_attach = on_attach, capabilities = capabilities }   -- Python
lspconfig.jdtls.setup { on_attach = on_attach, capabilities = capabilities }     -- Java
lspconfig.dartls.setup { on_attach = on_attach, capabilities = capabilities }    -- Dart

local function swift_root_dir(fname)
    local root = lspconfig.util.root_pattern('Package.swift', 'project.pbxproj', '.git')(fname)
    return root or vim.fn.getcwd()
end

lspconfig.sourcekit.setup({
    on_attach = on_attach,        
    capabilities = capabilities,  
    root_dir = swift_root_dir,    
})
