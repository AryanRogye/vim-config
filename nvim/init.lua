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
