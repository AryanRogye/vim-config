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

-- Command Line Behavior
vim.opt.cmdheight = 1  -- Height of the command line (increase to 2 if needed)
vim.opt.pumheight = 10 -- Maximum number of items to show in completion popup
vim.opt.shortmess:append("c")  -- Reduce command-line clutter

vim.opt.guicursor = "n-v-c-sm:block-blinkwait300-blinkon200-blinkoff150"
vim.opt.updatetime = 10  -- Lower update time makes movement feel smoother
vim.opt.cursorline = true  -- Highlight cursor line
vim.opt.signcolumn = "yes:1"  -- Prevents UI jumping
vim.opt.lazyredraw = false  -- Forces smooth UI updates
vim.opt.redrawtime = 1000  -- Makes rendering smoother




-- I feel this should be in here cuz its an setting I like
vim.api.nvim_set_keymap('c', 'W', 'w', { noremap = true, silent = true })

vim.cmd([[ autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r ]])


vim.opt.foldmethod = "manual" -- Enable manual folds
vim.opt.foldenable = true      -- Keep folds open
vim.opt.foldlevel = 99         -- Prevent folds from closing automatically
vim.opt.foldcolumn = "1"       -- Display fold column for visibility
vim.opt.viewoptions = "folds,options,cursor" -- Save folds in views

-- Auto-save & restore folds
vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "*",
    command = "silent! mkview"
})
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    command = "silent! loadview"
})


vim.opt.autoread = true
vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
    pattern = "*",
    command = "checktime"
})
