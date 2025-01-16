local M = {}

vim.g.mapleader = " "
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>o', ':noh<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>',{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>',{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':lua require("harpoon.mark").rm_file()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', ':lua require("harpoon.mark").clear_all()<CR>',{ noremap = true, silent = true })


-- Telescope Keymaps
vim.api.nvim_set_keymap('n', 'N', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'f', ':Telescope live_grep<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>cc', ':HelloNvim<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ct', ':ThemeSwitch<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "H", "<C-w>", {})

vim.api.nvim_set_keymap("n", "<C-j>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<Nop>", { noremap = true, silent = true })

-- Barber Keymaps
vim.api.nvim_set_keymap('n', '<C-[>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-]>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })


-- Move selected lines down in Visual mode with J
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
-- Move selected lines up in Visual mode with K
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "Z", ":ZenMode<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>F", "<cmd>CellularAutomaton make_it_rain<CR>", { noremap = true, silent = true })

return M
