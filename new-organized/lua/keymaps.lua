vim.g.mapleader = " "
-- Automatically make NERDTree buffer modifiable
vim.cmd([[
  autocmd FileType nerdtree setlocal modifiable
]])

-- Telescope Keymaps
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- REMAP FOR SOURCING
vim.api.nvim_set_keymap('n', '<leader>s', ':so<CR>', { noremap = true, silent = true })

-- NVIM Tree Keymap
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- KEYMAP FOR LAZY
vim.api.nvim_set_keymap('n', '<leader>l', ':Lazy<CR>', { noremap = true, silent = true })

-- KEYMAP FOR MASON
vim.api.nvim_set_keymap('n', '<leader>m', ':Mason<CR>', { noremap = true, silent = true })

-- Set Keybindings for vimtex
vim.api.nvim_set_keymap('n', '<leader>ll', ':VimtexCompile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lv', ':VimtexView<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lk', ':VimtexStop<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lo', ':VimtexErrors<CR>', { noremap = true, silent = true })

-- Configure which-key
local wk = require("which-key")

wk.register({
    -- General
    ["<leader>s"] = { "<cmd>so<cr>", "Source File" },
    ["<leader>l"] = { "<cmd>Lazy<cr>", "Lazy Command" },
    ["<leader>m"] = { "<cmd>Mason<cr>", "Mason Command" },
    -- File Navigation with Telescope
    ["<leader>f"] = {
        name = "Find", -- Group name
        f = { "<cmd>Telescope find_files<cr>", "Find Files" },
        g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
        b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
        h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
    },
    -- LSP Mappings
    ["<leader>l"] = {
        name = "LSP",
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
        r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
        i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to Implementation" },
        k = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover Documentation" },
        s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
        n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename Symbol" },
        a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions" },
    },
    -- VimTeX Keybindings
    ["<leader>v"] = {
        name = "VimTeX",
        l = { "<cmd>VimtexCompile<CR>", "Compile" },
        v = { "<cmd>VimtexView<CR>", "View PDF" },
        k = { "<cmd>VimtexStop<CR>", "Stop Compilation" },
        e = { "<cmd>VimtexErrors<CR>", "Show Errors" },
    },
    -- Prettier for formatting
    ["<leader>p"] = { "<cmd>Prettier<cr>", "Prettier Format" },
    -- Utility
    ["<leader>?"] = { function() wk.show() end, "Show all mappings" },
	-- Commentary
	["<leader>c"] = {
		name = "Comment",
		c = { "gcc", "Toggle Line Comment" },
		m = { "gc", "Comment Motion" },
	},
})

wk.register({
    ["<C-n>"] = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
}, { mode = 'n' })

-- Mouse-based command-click like functionality
wk.register({
    ["<C-LeftMouse>"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition (Click)" }
}, { mode = 'n' })

-- LSP Diagnostic Navigation
wk.register({
    ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic" },
    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
    ["<leader>e"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
    ["<leader>q"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Quickfix List" },
})
