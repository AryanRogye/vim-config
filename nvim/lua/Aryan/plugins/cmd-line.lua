return {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
        require("noice").setup({
            cmdline = {
                enabled = true,  -- Enable enhanced cmdline UI
                view = "cmdline_popup",  -- Makes the cmdline float
                format = {
                    cmdline = { pattern = "^:", icon = "", lang = "vim" },
                    search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                    filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                    lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
                },
            },
            views = {
                cmdline_popup = {
                    position = {
                        row = "20%",  -- Moves it lower (increase for more bottom)
                        col = "50%",  -- Centered horizontally
                    },
                    size = {
                        width = 60,   -- Adjust width
                        height = "auto",
                    },
                    border = {
                        style = "rounded",  -- Makes it look cleaner
                        highlight = "FloatBorder",
                    },
                },
            },
            messages = { enabled = true }, -- Show messages in a floating window
            popupmenu = { enabled = true }, -- Better popup menu for cmdline suggestions
        })
    end,
}
