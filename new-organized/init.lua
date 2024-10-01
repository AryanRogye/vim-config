
-- If plugins is not found
local status_ok, err = pcall(require, 'plugins')
if not status_ok then
    vim.api.nvim_err_writeln("Error: Could not load plugins.lua. Please make sure the 'plugins.lua' file exists in the correct location.")
    vim.api.nvim_err_writeln("Details: " .. err)
end

local themes_ok, err = pcall(require, 'themes')
if not themes_ok then
    vim.api.nvim_err_writeln("Error: Could not load themes.lua. Please make sure the 'themes.lua' file exists in the correct location.")
    vim.api.nvim_err_writeln("Details: " .. err)
else
	themes = require('themes')
end

-- Load notify configuration
local notify_ok, notify_config = pcall(require, 'notify_config')
if notify_ok then
    notify_config.setup()
else
    vim.api.nvim_err_writeln("Error: Could not load notify_config.lua. Please make sure the file exists.")
    vim.api.nvim_err_writeln("Details: " .. err)
end

-- The 3 main themes I use
----------------------------
-- themes.load_tokyonight()
themes.load_gruvbox()
-- themes.load_rose_pine()


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
