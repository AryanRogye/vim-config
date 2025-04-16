require("Aryan.core")
require("Aryan.plugin")
require("Aryan.core.themes")


local cmp_enabled = true

function ToggleCmp()
    local status, cmp = pcall(require, "cmp")
    if not status then
        print("nvim-cmp not loaded!")
        return
    end

    cmp_enabled = not cmp_enabled

    if cmp_enabled then
        cmp.setup({
            completion = { autocomplete = { require("cmp.types").cmp.TriggerEvent.InsertEnter, require("cmp.types").cmp.TriggerEvent.TextChanged } }
        })
        print("Completion: Enabled")
    else
        cmp.setup({
            completion = { autocomplete = {} }
        })
        print("Completion: Disabled")
    end
end

vim.api.nvim_set_keymap("n", "<leader>tc", "<cmd>lua ToggleCmp()<CR>", { noremap = true, silent = true })

-- vim.api.nvim_create_autocmd("BufWritePost", {
--     pattern = { "*.lua" }, -- Detects any Lua file changes
--     callback = function()
--         for name, _ in pairs(package.loaded) do
--             if name:match("^Aryan") then
--                 package.loaded[name] = nil
--             end
--         end
--         dofile(vim.fn.stdpath("config") .. "/init.lua")
--         print("🔄 Neovim config reloaded!")
--     end,
-- })

