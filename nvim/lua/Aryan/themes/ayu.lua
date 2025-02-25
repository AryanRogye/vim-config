return {
  {
    "Shatur/neovim-ayu",
    priority = 1000,
    config = function()
      local colors = require("ayu.colors")
      colors.generate(true) -- Pass `true` to enable mirage

      require("ayu").setup({
        mirage = true,
        overrides = function()
          return {
            LineNr = { fg = "#7F6633" }, -- 50% luminance of #FFCC66 used in colors.accent
            BlinkCmpGhostText = { fg = colors.accent },
            LspInlayHint = { fg = colors.comment, bg = colors.bg, italic = true },
          }
        end,
      })
    end,
  },
}
