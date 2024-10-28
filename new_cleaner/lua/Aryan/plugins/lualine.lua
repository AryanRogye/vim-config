return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    -- Define Tokyonight-inspired colors
    local colors = {
      blue = "#7051ff",
      cyan = "#7dcfff",
      black = "#1a1b26",
      white = "#c0caf5",
      red = "#f7768e",
      violet = "#862bff",
      yellow = "#fffe1b",
      green = "#9ece6a",
      gray = "#3b4261",
      pink = "#dc51ff",
    }

    -- Tokyonight-inspired lualine theme
    local tokyonight_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.black, gui = "bold" },
        b = { bg = colors.gray, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
      },
      insert = {
        a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
        b = { bg = colors.gray, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
      },
      visual = {
        a = { bg = colors.pink, fg = colors.black, gui = "bold" },
        b = { bg = colors.gray, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
        b = { bg = colors.gray, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
      },
      replace = {
        a = { bg = colors.red, fg = colors.black, gui = "bold" },
        b = { bg = colors.gray, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
      },
      inactive = {
        a = { bg = colors.black, fg = colors.gray, gui = "bold" },
        b = { bg = colors.black, fg = colors.gray },
        c = { bg = colors.black, fg = colors.gray },
      },
    }

    -- Configure lualine with the Tokyonight-inspired theme
    lualine.setup({
      options = {
        theme = tokyonight_theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
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
