-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Automatically install lazy.nvim if not installed or if something goes wrong
local ensure_lazy = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/lazy/start/lazy.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/folke/lazy.nvim', install_path})
        vim.cmd [[packadd lazy.nvim]]
        return true
    end
    return false
end

local lazy_bootstrap = ensure_lazy()
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then return end

-- Installing plugins here
lazy.setup({
    -- Theme
	{ 'morhetz/gruvbox' },
    {
        "folke/tokyonight.nvim",
        terminal_colors = true,
        lazy = true,
        priority = 1000,
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },
    {
        "rockyzhang24/arctic.nvim",
        branch = "v2",
        dependencies = { "rktjmp/lush.nvim" },
        lazy = true,
    },
    {'nvim-lua/plenary.nvim'},              -- Required
    require("Aryan.plugins.nvim-tree"),     -- Nvim Tree
    require("Aryan.plugins.treesitter"),    -- Treesitter
    require("Aryan.plugins.lualine"),       -- Lualine
    require("Aryan.plugins.harpoon"),       -- Harpoon
    require("Aryan.plugins.telescope"),     -- Telescope
    require("Aryan.plugins.dressing"),      -- Dressing
    require("Aryan.plugins.autopairs"),     -- Autopairs
    require("Aryan.plugins.which-key"),     -- Which Key
    require("Aryan.plugins.java"),          -- Syntax for FXML
    require("Aryan.plugins.colorizer"),
    require("Aryan.plugins.impatient"),
    -- require("Aryan.plugins.lsplines"),
    require("Aryan.plugins.zen"),

    
    -- My Plugin
    require("Aryan.plugins.comfy_theme_picker_config"),

    -- LSP-related plugins
    require("Aryan.plugins.luasnip"),       -- Luasnip
    require("Aryan.plugins.cmp-buffer"),    -- cmp-buffer
    require("Aryan.plugins.cmp-calc"),      -- cmp-calc
    require("Aryan.plugins.cmp-cmdline"),   -- cmd-line
    require("Aryan.plugins.cmp-nvim-lsp"),  -- cmd-nvim-lsp
    require("Aryan.plugins.cmp-nvim-lua"),  -- cmd-nvim-lua
    require("Aryan.plugins.cmp-path"),      -- cmd-path
    require("Aryan.plugins.cmp-spell"),     -- cmd-spell
    require("Aryan.plugins.cmp"),           -- cmd

    -- LSP Plugins
    require("Aryan.plugins.lsp-config"),
    require("Aryan.plugins.trouble"),       -- Trouble

    -- Performance settings
    performance = {
        cache = { enabled = true },  -- Enable caching for performance
        reset_packpath = true,        -- Reset packpath on startup
        rtp = {
            disabled_plugins = {       -- Disable built-in plugins for performance
                "2html_plugin",
                "bugreport",
                "compiler",
                "ftplugin",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logipat",
                "matchit",
                "netrw",
                "netrwFileHandlers",
                "netrwPlugin",
                "netrwSettings",
                "optwin",
                "rplugin",
                "rrhelper",
                "spellfile_plugin",
                "synmenu",
                "syntax",
                "tar",
                "tarPlugin",
                "tohtml",
                "tutor",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin",
            },
        },
    },
})