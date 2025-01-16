return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    -- Define Tokyonight-inspired colors
    local tokyonight_colors = {
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
    local tokyonight_theme = {
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
    local gruvbox_colors = {
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
    local gruvbox_theme = {
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

    -- Function M to return either theme
    local M = {}

    function M.get_theme(theme_name)
      if theme_name == "tokyonight" then
        return tokyonight_theme
      elseif theme_name == "gruvbox" then
        return gruvbox_theme
      else
        -- Default to Tokyonight if theme_name is unrecognized
        return tokyonight_theme
      end
    end

    -- Set the theme you want to use
    local selected_theme = M.get_theme("gruvbox") -- Change to "tokyonight" or "gruvbox"

    -- Configure lualine with the selected theme
    lualine.setup({
      options = {
        theme = selected_theme,
        component_separators = { left = '', right = '' },
        section_separators   = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { "mode", upper = true } },
        lualine_b = { "branch", "diff" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {
          { "diagnostics", sources = { "nvim_lsp" } },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
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
