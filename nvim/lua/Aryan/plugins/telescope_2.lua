return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        'nvim-lua/plenary.nvim',
        {"nvim-telescope/telescope-fzf-native.nvim", build = 'make' },
    },
    config = function()
        local actions = require("telescope.actions")
        -- local action_state = require("telescope.actions.state")

        require('telescope').setup {
            defaults = {
                prompt_prefix = "➤ ",
                selection_caret = "➤ ",
                path_display = { "truncate" },  -- Truncate long paths for better readability
                sorting_strategy = 'ascending', -- Show results with newest at the bottom
                layout_strategy = 'horizontal',
                prompt_title = false,
                results_title = false,
                color_devicons = true,
                borderchars = {
                    prompt  = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
                    results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
                    preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
                },
                mappings = {
                    i = {
                        ["<C-j>"] = actions.preview_scrolling_down,
                        ["<C-k>"] = actions.preview_scrolling_up,
                    },
                    n = {
                        ["<C-j>"] = actions.preview_scrolling_down,
                        ["<C-k>"] = actions.preview_scrolling_up,
                    },
                },
            },
            pickers = {
                find_files = {
                    theme = "ivy"
                }
            },
            extensions = {
                fzf = {}
            }
        }
        require('telescope').load_extension('fzf')
    end
}
