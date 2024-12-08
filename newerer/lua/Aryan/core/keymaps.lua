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
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>cc', ':HelloNvim<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ct', ':ThemeSwitch<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "H", "<C-w>", {})


-- Move selected lines down in Visual mode with J
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
-- Move selected lines up in Visual mode with K
vim.api.nvim_set_keymap('v', '<leader>K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

function M.setup_trouble()
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  -- Define key mappings for Trouble
  map("n", "<leader>td", "<cmd>Trouble diagnostics toggle<cr>", opts)
  map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", opts)
  map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", opts)
  map("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", opts)
  map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", opts)
  map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", opts)
end

return M
