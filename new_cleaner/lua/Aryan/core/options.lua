-- General Settings
vim.opt.wrap = false               -- Disable line wrapping
vim.opt.mouse = 'a'                -- Enable mouse support
vim.opt.hidden = false             -- Disallow hidden unsaved buffers
vim.opt.undofile = true            -- Enable persistent undo
vim.opt.clipboard = 'unnamedplus'  -- Use system clipboard
vim.opt.showmode = false           -- Disable mode display in command line
vim.opt.termguicolors = true       -- Enable true color support
vim.opt.laststatus = 2             -- Always show the status line

-- Tab and Indentation
vim.opt.tabstop = 4                -- Set tab width to 4 spaces
vim.opt.shiftwidth = 4             -- Set indentation width to 4 spaces
vim.opt.expandtab = true

-- Line Numbers
vim.opt.relativenumber = true      -- Show relative line numbers
vim.opt.number = true              -- Show absolute line number

-- Syntax and Fonts
vim.cmd('syntax on')               -- Enable syntax highlighting
vim.g.have_nerd_font = true        -- Enable NERD fonts

-- Search Settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"
vim.opt.backspace = "indent,eol,start"
vim.opt.swapfile = true
