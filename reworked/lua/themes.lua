local M = {}


-- Function to load Rose Pine theme
function M.load_rose_pine()
    require('rose-pine').setup({
        dark_variant = 'moon', -- Choose between 'main' and 'moon'
        disable_background = true, -- Disable background for transparency
        disable_float_background = true, -- Disable background for floating windows
    })
    vim.cmd('colorscheme rose-pine')
end

-- Function to load Gruvbox theme
function M.load_gruvbox()
    vim.opt.termguicolors = true
    vim.g.gruvbox_contrast_light = 'hard'
    vim.cmd([[colorscheme gruvbox]])
    vim.cmd([[
        colorscheme gruvbox
        highlight Normal guibg=NONE ctermbg=NONE
    ]])
end

return M
