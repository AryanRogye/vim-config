local M = {}

vim.g.mapleader = " "   -- Leader Key
-- Nvim Tree Keymaps 
-- vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { noremap = true, silent = true })

-- Harpoon Keymaps
vim.api.nvim_set_keymap('n', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>',{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>',{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':lua require("harpoon.mark").rm_file()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', ':lua require("harpoon.mark").clear_all()<CR>',{ noremap = true, silent = true })

-- Telescope Keymaps
vim.api.nvim_set_keymap('n', 'N', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'f', ':Telescope live_grep<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "H", "<C-w>", {})

-- This is the cancel the keymaps for tmux traversal
vim.api.nvim_set_keymap("n", "<C-j>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<Nop>", { noremap = true, silent = true })

-- Barber Keymaps
vim.api.nvim_set_keymap('n', '<C-[>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-]>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>o', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })

-- My Own Keymaps 
vim.api.nvim_set_keymap('n', '<leader>cp', ':lua CopyPathAndOpen()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cpp', ':lua OpenCopyPathAndOpen()<CR>', { noremap = true, silent = true })
-- Functions for the keymaps
function CopyPathAndOpen() require("Aryan.core.utils").CopyPathAndOpen() end
function OpenCopyPathAndOpen() require("Aryan.core.utils").OpenCopyPathAndOpen() end

-- Making UI Cleaner
vim.api.nvim_set_keymap('n', 'L', ':set number! relativenumber!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'W', ':set wrap! linebreak!<CR>', { noremap = true, silent = true })

-- Copilot Keymaps
vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { expr = true, silent = true })

-- Moving Lines
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "Z", ":ZenMode<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>F", "<cmd>CellularAutomaton make_it_rain<CR>", { noremap = true, silent = true })
vim.keymap.set({'n', 'v', 'o'}, ',', '%', { noremap = true, silent = true })


vim.keymap.set("n", "rr", vim.lsp.buf.references, { noremap = true, silent = true, desc = "Find all references" })

vim.keymap.set("n", ".", function()
    local word = vim.fn.expand("<cword>")  -- Get the word under cursor
    require("telescope.builtin").live_grep({ default_text = word })
end, { noremap = true, silent = true, desc = "Search selected word in project" })
-- Kinda Buggy
vim.keymap.set("v", ".", function()
    local text = vim.fn.getreg("v")  -- Get visual selection
    require("telescope.builtin").live_grep({ default_text = text })
end, { noremap = true, silent = true, desc = "Search selected text in project" })








return M
