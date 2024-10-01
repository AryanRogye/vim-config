require'nvim-treesitter.configs'.setup {
    ensure_installed = {"lua","go", "c", "rust", "css", "java", "javascript", "typescript", "zig"},
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,              -- Enable syntax highlighting
    },
    indent = {
        enable = true,              -- Enable Treesitter-based indentation
    },
    incremental_selection = {
        enable = true,
    },
}
