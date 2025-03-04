
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        {"nvim-lua/plenary.nvim", cmd = "Neotree" },
        {"nvim-tree/nvim-web-devicons", cmd = "Neotree" },
        {"MunifTanjim/nui.nvim", cmd = "Neotree" },
    },
    cmd = "Neotree",
    config = function()
        require("neo-tree").setup({
            window = {
                position = "right",
                width = 35,
                mappings = { ["<space>"] = "none" }, -- Disable annoying space keybinding
            },
            filesystem = {
                filtered_items = {
                    visible = false, -- Hide dotfiles by default, toggle with `H`
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    hide_by_name = { ".DS_Store", ".vscode", "node_modules" }, -- Hide extra clutter
                },
                follow_current_file = { enabled = true }, -- Keep file tree in sync
            },
            default_component_configs = {
                indent = { padding = 0 }, -- Removes extra indent space
                icon = {
                    folder_closed = "",
                    folder_open = "",
                },
            },
        })
    end,
}
-- return {
--   "nvim-tree/nvim-tree.lua",
--   dependencies = "nvim-tree/nvim-web-devicons",
--   config = function()
--     local nvimtree = require("nvim-tree")
--
--     -- recommended settings from nvim-tree documentation
--     vim.g.loaded_netrw = 1
--     vim.g.loaded_netrwPlugin = 1
--
--     nvimtree.setup({
--       view = {
--         width = 35,
--         relativenumber = false,
--         side = "right"
--       },
--       -- change folder arrow icons
--       renderer = {
--         indent_markers = {
--           enable = false,
--         },
--         icons = {
--           glyphs = {
--             folder = {
--               arrow_closed = "", -- arrow when folder is closed
--               arrow_open = "", -- arrow when folder is open
--             },
--           },
--         },
--       },
--       actions = {
--         open_file = {
--             open_file = { quit_on_open = true, },
--           window_picker = { enable = false, },
--         },
--       },
--       filters = {
--         custom = { ".DS_Store", ".vscode" },
--       },
--       git = {
--         ignore = false,
--       },
--     })
--
--     -- set keymaps
--     local keymap = vim.keymap -- for conciseness
--   end
-- }
