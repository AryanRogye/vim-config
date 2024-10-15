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
	-- Plugins Here
	require("plenary_config"),		-- Plenary
	require("nvim_tree_config"),	-- NvimTree
	require("harpoon_config"),		-- Harpoon
	require("cmp_config"), 			-- Auto Completion
	require("lsp_zero_config"),  	-- LSP
	require("autopairs_config"),  	-- Auto Pairs
	require("treesitter_config"),   -- Treesitter
	require("colorizer_config"),    -- Colorizing Hex Colors
	require("commentary_config"),   -- For Better Comments
	require("telescope_config"), 	-- Telescope
	require("noice_config"),
	-- THEMES
	{ "rose-pine/neovim", name = "rose-pine" },
	{'morhetz/gruvbox'},
})

if lazy_bootstrap then
	require('lazy').sync()
end
