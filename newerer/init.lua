require("Aryan.core")
require("Aryan.plugin")

-- Function to load Gruvbox theme
local function load_gruvbox()
    vim.opt.termguicolors = true
    vim.g.gruvbox_contrast_light = 'hard'
    vim.cmd([[colorscheme gruvbox]])
    vim.cmd([[
        colorscheme gruvbox
        highlight Normal guibg=NONE ctermbg=NONE
    ]])
end

load_gruvbox()
