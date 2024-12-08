return {
    -- Ensure LuaSnip is included
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp", -- Optional if needed
    },

    -- Ensure cmp_luasnip is correctly set up
    {
        "saadparwaiz1/cmp_luasnip",
        event = {"BufReadPost", "BufNewFile"},
        dependencies = {
            "hrsh7th/nvim-cmp", -- Ensure nvim-cmp is available
            "L3MON4D3/LuaSnip", -- Ensure LuaSnip is also loaded
        },
    },
}
