vim.g.mapleader = " "  -- Set leader to space
vim.cmd([[
  autocmd FileType nerdtree setlocal modifiable
]])

-- Lazy
vim.keymap.set('n', '<leader>l', ':Lazy<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ls', ':Lazy sync<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>lu', ':Lazy update<CR>', { noremap = true, silent = true })

-- Mason
vim.keymap.set('n', '<leader>m', ':Mason<CR>', { noremap = true, silent = true })

-- Harpoon
vim.api.nvim_set_keymap('n', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':lua require("harpoon.mark").rm_file()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', ':lua require("harpoon.mark").clear_all()<CR>', { noremap = true, silent = true })

-- NVIM TREE
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Telescope Keymaps
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
