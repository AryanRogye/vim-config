vim.opt.termguicolors = true
-- If plugins is not found --
local status_ok, err = pcall(require, 'plugins')
if not status_ok then
    vim.api.nvim_err_writeln("Error: Could not load plugins.lua. Please make sure the 'plugins.lua' file exists in the correct location.")
    vim.api.nvim_err_writeln("Details: " .. err)
end

-- Load Themes Configuration
local themes_ok, err = pcall(require, 'themes')
if not themes_ok then
    vim.api.nvim_err_writeln("Error: Could not load themes.lua. Please make sure the 'themes.lua' file exists in the correct location.")
    vim.api.nvim_err_writeln("Details: " .. err)
else
    themes = require('themes')
end


-- Load Keymaps
local status_ok, keymaps = pcall(require, 'keymappings/plugin_keymaps')
if not status_ok then
    vim.api.nvim_err_writeln("Error loading keymappings/plugin_keymaps.lua: " .. keymaps)
end


local status_ok, keymaps = pcall(require, 'keymappings/lsp_keymaps')
if not status_ok then
	vim.api.nvim_err_writeln("Error loading keymappings/lsp_keymaps.lua: " .. keymaps)
end


local status_ok, keymaps = pcall(require, 'keymappings/general_keymaps')
if not status_ok then
	vim.api.nvim_err_writeln("Error loading keymappings/general_keymaps.lua: " .. keymaps)
end

-- The 3 main themes I use
----------------------------
-- themes.load_tokyonight()
themes.load_gruvbox()
-- themes.load_rose_pine()
-- I like the rose pine with black background

-- Black
-- vim.cmd([[highlight Normal guibg=#000000]])



vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.mouse = 'a'
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hidden = true
vim.opt.undofile = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.laststatus = 2
vim.cmd('syntax on')
vim.g.have_nerd_font = true
vim.opt.showmode = false
