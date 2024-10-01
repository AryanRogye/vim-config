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
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)  -- Go to definition
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)  -- Find references
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- Go to implementation
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)        -- Hover information
    buf_set_keymap('n', '<C-LeftMouse>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts) -- Command-click navigation
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
lspconfig.sourcekit.setup { capabilities = capabilities }                       -- Swift
