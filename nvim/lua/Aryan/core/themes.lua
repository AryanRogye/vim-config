local M = {}

M.vsc = function()
    require('vscode').setup({
        disable_nvimtree_bg = true,
    })
    vim.cmd.colorscheme "vscode"
end

M.nf = function ()
    require("neofusion").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
            strings = true,
            emphasis = true,
            comments = true,
            operators = false,
            folds = true,
        },
        transparent_mode = true,
    })
    vim.cmd([[ colorscheme neofusion ]])
end
M.gd = function()
    require("gruber-darker").setup({
        opts = {
            bold = false,
            italic = {
                strings = false,
            },
        },
    })
    vim.cmd([[colorscheme gruber-darker]])
    vim.cmd([[
        highlight LineNr guibg=NONE
        highlight clear CursorLineNR
        highlight Normal guibg=NONE ctermbg=NONE
        highlight SignColumn guibg=NONE ctermbg=NONE
        highlight LineNr guibg=NONE ctermbg=NONE
        highlight CursorLineNr guibg=NONE ctermbg=NONE
        highlight CursorLine guibg=NONE ctermbg=NONE
        highlight VertSplit guibg=NONE ctermbg=NONE
        highlight WinSeparator guibg=NONE ctermbg=NONE
        highlight EndOfBuffer guibg=NONE ctermbg=NONE
        highlight FoldColumn guibg=NONE ctermbg=NONE
        highlight NormalNC guibg=NONE ctermbg=NONE
        highlight MsgArea guibg=NONE ctermbg=NONE
        highlight TelescopeNormal guibg=NONE ctermbg=NONE
        highlight NvimTreeNormal guibg=NONE ctermbg=NONE
    ]])
end

-- Function to load Gruvbox theme
M.lg = function()
    vim.opt.termguicolors = true
    vim.g.gruvbox_contrast_light = 'hard'
    vim.cmd([[colorscheme gruvbox]])
    vim.cmd([[
        highlight Normal guibg=NONE ctermbg=NONE
    ]])
end

M.ls = function()
    vim.opt.background = "dark"
    vim.cmd.colorscheme("sakura");
    vim.cmd([[
        highlight Normal guibg=NONE ctermbg=NONE
    ]])
end
-- Function to load Rose Pine 
M.rp = function()
    vim.opt.termguicolors = true
    require("rose-pine").setup({
        variant = "moon", -- auto, main, moon, or dawn
        dark_variant = "moon", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
        styles = {
            bold = true,
            italic = true,
            transparency = true,
        },
        groups = {
            border = "muted",
            link = "iris",
            panel = "surface",

            error = "love",
            hint = "iris",
            info = "foam",
            note = "pine",
            todo = "rose",
            warn = "gold",

            git_add = "foam",
            git_change = "rose",
            git_delete = "love",
            git_dirty = "rose",
            git_ignore = "muted",
            git_merge = "iris",
            git_rename = "pine",
            git_stage = "iris",
            git_text = "rose",
            git_untracked = "subtle",

            h1 = "iris",
            h2 = "foam",
            h3 = "rose",
            h4 = "gold",
            h5 = "pine",
            h6 = "foam",
        },
    })
    vim.cmd.colorscheme "rose-pine"
end
M.lo = function()
    vim.opt.termguicolors = true
    local ok, oxocarbon = pcall(require, "oxocarbon")
    if not ok then
        print("Oxocarbon colorscheme is not installed!")
        return
    end
    vim.cmd([[colorscheme oxocarbon]])
    vim.cmd([[
        highlight Normal guibg=NONE ctermbg=NONE
    ]])
end

M.df = function()
    require("dark_flat").setup({
        transparent = false,
        colors = {},
        themes = function(colors)
            return {}
        end,
        italics = true,
    })
    vim.cmd.colorscheme "dark_flat"
end

M.lc = function ()
    local config = {
        lazy = false,
        priority = 1000,
        italic_comments = true,
        terminal_colors = true,
        hide_fillchars = true,
        transparent = false,
        cache = false,

        theme = {
            variant = "dark", 
            saturation = 1, 
            highlights = {
                ColorColumn = {},
            },
        },
        options = {
            theme = "auto",
        },
    }
    require("cyberdream").setup(config)
    vim.cmd("colorscheme cyberdream")
end

return M
