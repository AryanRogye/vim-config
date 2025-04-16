return  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")

        -- Define Tokyonight-inspired colors
        local tokyonight_colors = 
        {
            blue   = "#7051ff",
            cyan   = "#7dcfff",
            black  = "#1a1b26",
            white  = "#c0caf5",
            red    = "#f7768e",
            violet = "#862bff",
            yellow = "#fffe1b",
            green  = "#9ece6a",
            gray   = "#3b4261",
            pink   = "#dc51ff",
        }
        -- Tokyonight-inspired lualine theme
        local tokyonight_theme = 
        {
            normal = {
                a = { bg = tokyonight_colors.blue, fg = tokyonight_colors.black, gui = "bold" },
                b = { bg = tokyonight_colors.gray, fg = tokyonight_colors.white },
                c = { bg = tokyonight_colors.black, fg = tokyonight_colors.white },
            },
            insert = {
                a = { bg = tokyonight_colors.yellow, fg = tokyonight_colors.black, gui = "bold" },
                b = { bg = tokyonight_colors.gray, fg = tokyonight_colors.white },
                c = { bg = tokyonight_colors.black, fg = tokyonight_colors.white },
            },
            visual = {
                a = { bg = tokyonight_colors.pink, fg = tokyonight_colors.black, gui = "bold" },
                b = { bg = tokyonight_colors.gray, fg = tokyonight_colors.white },
                c = { bg = tokyonight_colors.black, fg = tokyonight_colors.white },
            },
            command = {
                a = { bg = tokyonight_colors.yellow, fg = tokyonight_colors.black, gui = "bold" },
                b = { bg = tokyonight_colors.gray, fg = tokyonight_colors.white },
                c = { bg = tokyonight_colors.black, fg = tokyonight_colors.white },
            },
            replace = {
                a = { bg = tokyonight_colors.red, fg = tokyonight_colors.black, gui = "bold" },
                b = { bg = tokyonight_colors.gray, fg = tokyonight_colors.white },
                c = { bg = tokyonight_colors.black, fg = tokyonight_colors.white },
            },
            inactive = {
                a = { bg = tokyonight_colors.black, fg = tokyonight_colors.gray, gui = "bold" },
                b = { bg = tokyonight_colors.black, fg = tokyonight_colors.gray },
                c = { bg = tokyonight_colors.black, fg = tokyonight_colors.gray },
            },
        }

        -- Define Gruvbox-inspired colors
        local gruvbox_colors = 
        {
            bg0    = "#282828",
            bg1    = "#3c3836",
            bg2    = "#504945",
            fg     = "#ebdbb2",
            red    = "#fb4934",
            green  = "#b8bb26",
            yellow = "#fabd2f",
            blue   = "#83a598",
            purple = "#d3869b",
            aqua   = "#8ec07c",
            gray   = "#928374",
            orange = "#fe8019",
        }
        -- Gruvbox-inspired lualine theme
        local gruvbox_theme = 
        {
            normal = {
                a = { bg = gruvbox_colors.blue, fg = gruvbox_colors.bg0, gui = "bold" },
                b = { bg = gruvbox_colors.bg2, fg = gruvbox_colors.fg },
                c = { bg = gruvbox_colors.bg1, fg = gruvbox_colors.fg },
            },
            insert = {
                a = { bg = gruvbox_colors.green, fg = gruvbox_colors.bg0, gui = "bold" },
                b = { bg = gruvbox_colors.bg2, fg = gruvbox_colors.fg },
                c = { bg = gruvbox_colors.bg1, fg = gruvbox_colors.fg },
            },
            visual = {
                a = { bg = gruvbox_colors.purple, fg = gruvbox_colors.bg0, gui = "bold" },
                b = { bg = gruvbox_colors.bg2, fg = gruvbox_colors.fg },
                c = { bg = gruvbox_colors.bg1, fg = gruvbox_colors.fg },
            },
            command = {
                a = { bg = gruvbox_colors.aqua, fg = gruvbox_colors.bg0, gui = "bold" },
                b = { bg = gruvbox_colors.bg2, fg = gruvbox_colors.fg },
                c = { bg = gruvbox_colors.bg1, fg = gruvbox_colors.fg },
            },
            replace = {
                a = { bg = gruvbox_colors.red, fg = gruvbox_colors.bg0, gui = "bold" },
                b = { bg = gruvbox_colors.bg2, fg = gruvbox_colors.fg },
                c = { bg = gruvbox_colors.bg1, fg = gruvbox_colors.fg },
            },
            inactive = {
                a = { bg = gruvbox_colors.bg1, fg = gruvbox_colors.gray, gui = "bold" },
                b = { bg = gruvbox_colors.bg1, fg = gruvbox_colors.gray },
                c = { bg = gruvbox_colors.bg1, fg = gruvbox_colors.gray },
            },
        }


        local reykjavik_colors = 
        {
            bg1      = "#112328",  -- Main background
            bg2      = "#243539",
            bg3      = "#37464a",  -- Darker contrast
            fg1      = "#cdd6f4",  -- Brighter, but balanced
            fg2      = "#a6adc8",
            fg3      = "#9399b2",
            fg4      = "#7f849c",
            builtin  = "#89b4fa",  -- Vibrant blue
            keyword  = "#74c7ec",  -- Soft cyan
            const    = "#a6e3a1",  -- Green
            comment  = "#5d5d5d",
            func     = "#f38ba8",  -- Warmer pink
            str      = "#f2cdcd",  -- Soft pink
            type     = "#cdd6f4",  -- Slightly off-white
            var      = "#f9e2af",  -- Warm yellow
            warning  = "#f38ba8",  -- Pink-red
            warning2 = "#fab387",  -- Orange
            inactive_bg = "#1e2b30",  -- Custom darker bg for inactive Lualine
        }

        -- Reykjavik Lualine Theme (With Clearer Contrast)
        local reykjavik_theme = 
        {
            normal = {
                a = { bg = reykjavik_colors.keyword, fg = reykjavik_colors.bg1, gui = "bold" },
                b = { bg = reykjavik_colors.bg3, fg = reykjavik_colors.fg1 },
                c = { bg = reykjavik_colors.bg2, fg = reykjavik_colors.fg3 },
            },
            insert = {
                a = { bg = reykjavik_colors.const, fg = reykjavik_colors.bg1, gui = "bold" },
                b = { bg = reykjavik_colors.bg3, fg = reykjavik_colors.fg1 },
                c = { bg = reykjavik_colors.bg2, fg = reykjavik_colors.fg3 },
            },
            visual = {
                a = { bg = reykjavik_colors.str, fg = reykjavik_colors.bg1, gui = "bold" },
                b = { bg = reykjavik_colors.bg3, fg = reykjavik_colors.fg1 },
                c = { bg = reykjavik_colors.bg2, fg = reykjavik_colors.fg3 },
            },
            command = {
                a = { bg = reykjavik_colors.builtin, fg = reykjavik_colors.bg1, gui = "bold" },
                b = { bg = reykjavik_colors.bg3, fg = reykjavik_colors.fg1 },
                c = { bg = reykjavik_colors.bg2, fg = reykjavik_colors.fg3 },
            },
            replace = {
                a = { bg = reykjavik_colors.warning, fg = reykjavik_colors.bg1, gui = "bold" },
                b = { bg = reykjavik_colors.bg3, fg = reykjavik_colors.fg1 },
                c = { bg = reykjavik_colors.bg2, fg = reykjavik_colors.fg3 },
            },
            inactive = {
                a = { bg = reykjavik_colors.inactive_bg, fg = reykjavik_colors.fg4, gui = "bold" },
                b = { bg = reykjavik_colors.inactive_bg, fg = reykjavik_colors.fg4 },
                c = { bg = reykjavik_colors.inactive_bg, fg = reykjavik_colors.fg4 },
            },
        }

        -- Function M to return either theme
        local M = {}

        function M.get_theme(theme_name)
            if theme_name == "tokyonight" then
                return tokyonight_theme
            elseif theme_name == "gruvbox" then
                return gruvbox_theme
            elseif theme_name == "reykjavik" then
                return reykjavik_theme
            else
                -- Default to Tokyonight if theme_name is unrecognized
                return tokyonight_theme
            end
        end

        local selected_theme = M.get_theme("lualine") -- Change to "tokyonight" or "gruvbox"

        -- Configure lualine with the selected theme
        lualine.setup({
            options = {
                theme = selected_theme,
                component_separators = { left = '', right = '' },
                section_separators   = { left = '', right = '' },
            },
            sections = {
                lualine_a = { { "mode", upper = true } },
                lualine_b = {},
                lualine_c = { { "filename", path = 1 } },
                lualine_x = {},
                lualine_y = {},
                lualine_z = { "branch", "diff" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
