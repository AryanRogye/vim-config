vim.g.mapleader = " "  -- Set leader to space
vim.cmd([[
  autocmd FileType nerdtree setlocal modifiable
]])


-- REMAP FOR SOURCING
vim.api.nvim_set_keymap('n', '<leader>s', ':so<CR>', { noremap = true, silent = true })
