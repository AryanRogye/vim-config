local M = {}

-- Function to load Tokyonight theme
function M.load_tokyonight()
    require('tokyonight').setup({
        style = "night", -- Choose from 'storm', 'night', 'moon', or 'day'
        transparent = true, -- Enable transparency
        terminal_colors = true, -- Apply colors to Neovim terminal
        styles = {
            sidebars = "transparent", -- Make sidebars transparent
            floats = "transparent", -- Make floating windows transparent
        },
    })
    vim.cmd[[colorscheme tokyonight]]
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

-- Function to load Rose Pine theme
function M.load_rose_pine()
    require('rose-pine').setup({
        dark_variant = 'moon', -- Choose between 'main' and 'moon'
        disable_background = true, -- Disable background for transparency
        disable_float_background = true, -- Disable background for floating windows
    })
    vim.cmd('colorscheme rose-pine')
end

function M.load_zen_bones()
    local zenbones = require('zenbones')
    if not zenbones then
        print("Zenbones module not found!")
        return
    end
    if not zenbones.setup then
        print("Zenbones does not have a setup function.")
        return
    end
    zenbones.setup({
        zenbones_darken_comments = 45,
    })
    vim.cmd[[colorscheme zenbones]]
end

return M
