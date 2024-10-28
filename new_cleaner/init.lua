require("Aryan.core")
require("Aryan.plugins_setup")

local function loadArctic()
    vim.cmd("colorscheme arctic")
    vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
end
loadArctic()
-- -- Function to load Gruvbox theme
-- local function load_gruvbox()
--     vim.opt.termguicolors = true
--     vim.g.gruvbox_contrast_light = 'hard'
--     vim.cmd([[colorscheme gruvbox]])
--     vim.cmd([[
--         colorscheme gruvbox
--         highlight Normal guibg=NONE ctermbg=NONE
--     ]])
-- end
-- --
-- load_gruvbox()


-- vim.cmd([[colorscheme tokyonight]])
-- vim.cmd([[colorscheme torte]])

