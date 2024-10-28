return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                PATH = "prepend",
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "jdtls",
                    "lua_ls",
                    "rust_analyzer",
                    "cssls",
                    "ts_ls",
                    "pylsp",
                    "clangd",
                    "jsonls",
                    "zls",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")

            -- Language servers setup
            lspconfig.jdtls.setup({ capabilities = capabilities })
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.rust_analyzer.setup({ capabilities = capabilities })
            lspconfig.cssls.setup({ capabilities = capabilities })
            lspconfig.ts_ls.setup({ capabilities = capabilities })
            lspconfig.pylsp.setup({
                capabilities = capabilities,
                settings = {
                    python = {
                        pythonPath = "/usr/bin/python3",
                    },
                },
            })
            lspconfig.clangd.setup({
                cmd = {
                    "clangd",
                    "--background-index",
                    "--pch-storage=memory",
                    "--all-scopes-completion",
                    "--pretty",
                    "--header-insertion=never",
                    "-j=4",
                    "--inlay-hints",
                    "--header-insertion-decorators",
                    "--function-arg-placeholders",
                    "--completion-style=detailed",
                },
                filetypes = { "c", "cpp", "objc", "objcpp" },
                root_dir = lspconfig.util.root_pattern("src"),
                init_options = {
                    fallbackFlags = {
                        "-std=c11",
                        "-I/opt/homebrew/opt/sdl2/include/",  -- Add SDL2 include path here
                    },
                },
                capabilities = capabilities,
            })
            lspconfig.jsonls.setup({ capabilities = capabilities })
            lspconfig.zls.setup({
                capabilities = capabilities,
                cmd = { "zls" },
            })
        end,
    },
}
