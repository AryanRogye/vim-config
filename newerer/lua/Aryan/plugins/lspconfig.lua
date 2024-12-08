local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local on_attach = function(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
end

lspconfig.jdtls.setup({
    cmd = { "jdtls" },
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern(".git", "pom.xml", "build.gradle"),
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-17",
                        path = "/opt/homebrew/opt/openjdk@17", -- Replace with `echo $JAVA_HOME` if different
                    },
                },
            },
        },
    },
})

lspconfig.clangd.setup({
    cmd = { "clangd", "--background-index", "--clang-tidy", "--cross-file-rename" },
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "c", "cpp", "objc", "objcpp" },
    flags = {
        debounce_text_changes = 100,
    },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")
})

lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 50,
    },
})

vim.diagnostic.config({
    virtual_text = { spacing = 2, prefix = "●" },
    update_in_insert = true,
    severity_sort = true,
})
