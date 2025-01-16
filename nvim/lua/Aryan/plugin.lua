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
local status_ok, lazy = pcall(require, "lazy") if not status_ok then return end

-- Installing plugins here
lazy.setup({
    -- Theme
    {
        'neovim/nvim-lspconfig',
        config = function()
            require("Aryan.plugins.lspconfig")
        end
    },
    -- Themes 
    { 'morhetz/gruvbox' },
    {"sekke276/dark_flat.nvim"},
    { 'cocopon/iceberg.vim' },
    {'nyoom-engineering/oxocarbon.nvim'},
    {'scottmckendry/cyberdream.nvim'},
    { "rose-pine/neovim", name = "rose-pine"},
    { "anAcc22/sakura.nvim", name="sakura"}, { 'rktjmp/lush.nvim', },
    { "blazkowolf/gruber-darker.nvim"},
    { "diegoulloao/neofusion.nvim", priority = 1000 , config = true},
    { "Mofiqul/vscode.nvim" },

    -- END OF THEMES
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',  -- Compiles the native C implementation
        dependencies = { 'nvim-telescope/telescope.nvim' }
    },
    -- This is For Tmux
    { "christoomey/vim-tmux-navigator" },
    require("Aryan.plugins.nvim-tree"),     -- Nvim Tree
    require("Aryan.plugins.treesitter"),    -- Treesitter
    require("Aryan.plugins.lualine"),       -- Lualine
    require("Aryan.plugins.harpoon"),       -- Harpoon
    require("Aryan.plugins.autopairs"),
    require("Aryan.plugins.telescope"),
    require("Aryan.plugins.fugitive"),
    require("Aryan.plugins.zen"),
    require("Aryan.plugins.theme-picker"),
    -- Plugins Im trying out
    require("Aryan.plugins.dressing"),
    require("Aryan.plugins.cell-auto"),
    require("Aryan.plugins.vim-surround"),
    require("Aryan.plugins.line-number"),
    require("Aryan.plugins.tabs"),

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
    require("Aryan.plugins.trouble"),
    -- My Plugin To Load Themes Easier
    performance = {
        cache = { enabled = true },  -- Enable caching for performance
        reset_packpath = true,        -- Reset packpath on startup
        rtp = {
            disabled_plugins = {
                "2html_plugin", "bugreport", "compiler", "ftplugin", "getscript",
                "getscriptPlugin", "gzip", "logipat", "matchit", "netrw", "netrwFileHandlers",
                "netrwPlugin", "netrwSettings", "optwin", "rplugin", "rrhelper",
                "spellfile_plugin", "synmenu", "syntax", "tar", "tarPlugin", "tohtml",
                "tutor", "vimball", "vimballPlugin", "zip", "zipPlugin",
            },
        },
    },
})
