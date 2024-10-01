-- ~/.config/nvim/lua/prettier_config.lua

-- Prettier configuration: Format specific files on save
vim.api.nvim_exec([[
  autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx PrettierAsync
]], false)
