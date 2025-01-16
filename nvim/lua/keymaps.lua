vim.g.mapleader = " "
-- Automatically make NERDTree buffer modifiable
vim.cmd([[
  autocmd FileType nerdtree setlocal modifiable
]])


-- Smooth Scrolling
vim.api.nvim_set_keymap('n', '<C-u>', ':call smooth_scroll#up(&scroll, 0, 2)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-d>', ':call smooth_scroll#down(&scroll, 0, 2)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-b>', ':call smooth_scroll#up(&scroll*2, 0, 4)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':call smooth_scroll#down(&scroll*2, 0, 4)<CR>', { noremap = true, silent = true })

-- Harpoon (Just Testing For Now)
vim.api.nvim_set_keymap('n', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':lua require("harpoon.mark").rm_file()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', ':lua require("harpoon.mark").clear_all()<CR>', { noremap = true, silent = true })


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

wk.add({
    -- General
    { "<leader>s", "<cmd>so<cr>", desc = "Source File" },
    { "<leader>l", "<cmd>Lazy<cr>", desc = "Lazy Command" },
    { "<leader>m", "<cmd>Mason<cr>", desc = "Mason Command" },

    -- File Navigation with Telescope
    { "<leader>f", group = "Find" }, -- Group name
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },

    -- Smooth Scrolling Keybindings
    { "<C-u>", ":call smooth_scroll#up(&scroll, 0, 2)<CR>", desc = "Smooth Scroll Up" },
    { "<C-d>", ":call smooth_scroll#down(&scroll, 0, 2)<CR>", desc = "Smooth Scroll Down" },
    { "<C-b>", ":call smooth_scroll#up(&scroll*2, 0, 4)<CR>", desc = "Smooth Scroll Page Up" },
    { "<C-f>", ":call smooth_scroll#down(&scroll*2, 0, 4)<CR>", desc = "Smooth Scroll Page Down" },

    -- LSP Mappings
    { "<leader>l", group = "LSP" }, -- Group name
    { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to Definition" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "References" },
    { "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to Implementation" },
    { "<leader>lk", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover Documentation" },
    { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
    { "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename Symbol" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Actions" },

    -- VimTeX Keybindings
    { "<leader>v", group = "VimTeX" },
    { "<leader>vl", "<cmd>VimtexCompile<CR>", desc = "Compile" },
    { "<leader>vv", "<cmd>VimtexView<CR>", desc = "View PDF" },
    { "<leader>vk", "<cmd>VimtexStop<CR>", desc = "Stop Compilation" },
    { "<leader>ve", "<cmd>VimtexErrors<CR>", desc = "Show Errors" },

    -- Prettier for formatting
    { "<leader>p", "<cmd>Prettier<cr>", desc = "Prettier Format" },

    -- Utility
    { "<leader>?", function() wk.show() end, desc = "Show all mappings" },

    -- Commentary
    { "<leader>c", group = "Comment" },
    { "<leader>cc", "gcc", desc = "Toggle Line Comment" },
    { "<leader>cm", "gc", desc = "Comment Motion" },
})

-- NvimTree keymap
wk.add({
    { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
}, { mode = 'n' })

-- Mouse-based command-click like functionality
wk.add({
    { "<C-LeftMouse>", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to Definition (Click)" },
}, { mode = 'n' })

-- LSP Diagnostic Navigation
wk.add({
    { "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Previous Diagnostic" },
    { "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
    { "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Line Diagnostics" },
    { "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "Quickfix List" },
})
