return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            lsp_doc_border = true,
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",   -- Required UI component for Noice.
        {
            "rcarriga/nvim-notify",
            config = function()
                require('notify').setup({
                    max_width = 50,
                    max_height = 10,
                    background_colour = "#000000",
                    stages = "fade_in_slide_out",
                    timeout = 3000,
                    top_down = false,
                })

                -- Set notify as the default notification provider
                vim.notify = require("notify")
            end,
        },
    }
}
