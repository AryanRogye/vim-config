-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Automatically install lazy.nvim if not installed or if something goes wrong
local ensure_lazy = function() local fn = vim.fn
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

if lazy_bootstrap then
    vim.notify("Lazy.nvim installed. Restart Neovim to complete setup!", "info", { title = "Bootstrap" })
    return
end

-- Installing plugins here
lazy.setup({
    { dir = "~/.config/nvim/colors" },
    { 'neovim/nvim-lspconfig', config = function() require("Aryan.plugins.lspconfig") end},
    -- Themes
    require("Aryan.themes.gruvbox"),
    require("Aryan.themes.gruv2"),
    require("Aryan.themes.gruber-darker"),
    require("Aryan.themes.iceberg"),
    require("Aryan.themes.neofusion"),
    require("Aryan.themes.oxocarbon"),
    require("Aryan.themes.rose-pine"),
    require("Aryan.themes.sakura"),
    require("Aryan.themes.vscode"),
    require("Aryan.themes.vscode2"),
    require("Aryan.themes.cyberdream"),
    require("Aryan.themes.dark_flat"),
    require("Aryan.themes.nightfox"),
    require("Aryan.themes.tokyonight"),
    require("Aryan.themes.dracula"),
    require("Aryan.themes.ayu"),
    require("Aryan.themes.solorized"),
    require("Aryan.themes.farout"),
    require("Aryan.themes.owl"),

    -- Plugins
    require("Aryan.plugins.tmux"),
    require("Aryan.plugins.nvim-tree"),
    require("Aryan.plugins.treesitter"),

    -- require("Aryan.plugins.lualine"),
    require("Aryan.plugins.harpoon"),
    require("Aryan.plugins.autopairs"),
    require("Aryan.plugins.telescope"),
    require("Aryan.plugins.snack"),
    -- require("Aryan.plugins.fugitive"),
    -- require("Aryan.plugins.zen"),
    require("Aryan.plugins.theme-picker"),
    require("Aryan.plugins.dressing"),
    require("Aryan.plugins.cell-auto"),
    -- require("Aryan.plugins.vim-surround"),
    require("Aryan.plugins.tabs"),
    require("Aryan.plugins.copilot"),
    -- require("Aryan.plugins.scroll"),
    -- require("Aryan.plugins.cmd-line"),
    require("Aryan.plugins.notifications"),
    require("Aryan.plugins.cursor"),
    -- require("Aryan.plugins.cursor-trail"),
    require("Aryan.plugins.mini-split"),
    -- require("Aryan.plugins.flash"),
    -- require("Aryan.plugins.foil"),

    -- Lsp Plugins
    require("Aryan.plugins.luasnip"),
    require("Aryan.plugins.cmp-buffer"),
    require("Aryan.plugins.cmp-calc"),
    require("Aryan.plugins.cmp-cmdline"),
    require("Aryan.plugins.cmp-nvim-lsp"),
    require("Aryan.plugins.cmp-nvim-lua"),
    require("Aryan.plugins.cmp-path"),
    require("Aryan.plugins.cmp-spell"),
    require("Aryan.plugins.cmp"),
    require("Aryan.plugins.trouble"),

    -- require("Aryan.plugins.nvim-dap"),

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
