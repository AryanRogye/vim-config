local M = {}

M.vv = function()
    vim.cmd([[colorscheme visual_studio_code]])
end

M.mine = function()
    vim.cmd [[ colorscheme mine ]]
end

M.dos = function()
    vim.cmd [[ colorscheme dos ]]
end

M.farout = function()
    vim.cmd [[colorscheme farout]]
end

M.sol = function()
    require('solarized').setup({
        palette = 'selenized', -- solarized (default) | selenized
        variant = 'summer', -- "spring" | "summer" | "autumn" | "winter" (default)
        styles = {
            enabled = true,
            comments = { italic = true, bold = true },
            functions = { italic = false },
            variables = { italic = false },
        },
    })
    vim.cmd [[ colorscheme solarized ]]
end

M.au = function()
    vim.cmd [[colorscheme ayu]]
end

M.drac = function()
    vim.cmd [[colorscheme catppuccin-latte]]
end

M.owl = function()
    vim.cmd "colorscheme blue-moon"
    -- add keybind leader qq to toggle transparency

    -- Function to toggle transparency
    vim.api.nvim_create_user_command("ToggleTransparency", function()
        vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
    end, {})

    -- Keybind to toggle transparency
    vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>ToggleTransparency<CR>", { noremap = true, silent = true })
end

M.tokyonight = function()
    local themes = {
        "tokyonight-moon",
        "tokyonight-night",
        "tokyonight-storm",
        "tokyonight-day"
    }

    local current_index = 1 -- Start with the first theme

    vim.cmd [[colorscheme tokyonight-moon]]
    function CycleTokyoNight()
        current_index = current_index % #themes + 1
        vim.cmd("colorscheme " .. themes[current_index])
        print("Switched to " .. themes[current_index])
    end

    vim.keymap.set("n", "<leader>n", CycleTokyoNight, { desc = "Cycle TokyoNight themes" })
end

M.fd = function()
    vim.cmd.colorscheme "dayfox"
end

M.re = function()
    vim.cmd.colorscheme "reykjavik"
end
M.zenburns1 = function()
    vim.g.zenburn_high_Contrast = 1
    vim.cmd.colorscheme "zenburns"
end
M.zenburns0 = function()
    vim.g.zenburn_high_Contrast = 0
    vim.cmd.colorscheme "zenburns"
end
M.co = function()
    vim.cmd.colorscheme "comfy"
    -- vim.cmd([[
    --     highlight Normal guibg=NONE ctermbg=NONE
    --     highlight StatusLine guibg=NONE ctermbg=NONE
    --     highlight VertSplit guibg=NONE ctermbg=NONE
    --     highlight LineNr guibg=NONE ctermbg=NONE
    --     highlight SignColumn guibg=NONE ctermbg=NONE
    --     "set background=dark  -- or light depending on your theme
    -- ]])
end
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
        highlight Normal guibg=NONE ctermbg=NONE
    ]])
end

-- Function to load Gruvbox theme
M.lg = function()
    vim.opt.termguicolors = true
    vim.g.gruvbox_contrast_light = 'hard'
    vim.cmd([[colorscheme gruvbox]])
    -- vim.cmd([[
    --     highlight Normal guibg=NONE ctermbg=NONE
    -- ]])
end

M.g2 = function()
    -- Use the exact name from Lazy.nvim config
    local plugin_name = "ellisonleao/gruvbox.nvim"

    -- Ensure Lazy.nvim loads it
    if require("lazy.core.config").plugins[plugin_name] then
        require("lazy").load({ plugins = { plugin_name } })
    else
        print("Plugin " .. plugin_name .. " not found in Lazy.nvim!")
        return
    end

    -- Apply colorscheme
    vim.cmd("colorscheme gruvbox")
    print("Loaded Gruvbox (ellisonleao)")
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
