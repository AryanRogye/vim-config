return {
    "folke/which-key.nvim",
    enabled = true,
    keys = {"<leader>", "<c-r>", "<c-w>", '"', "`", "c", "v", "g"},
    event = {"InsertEnter"},

    init = function()
        -- Global timeout settings
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,

    opts = {
        -- Enable additional plugins like spelling suggestions
        plugins = {
            spelling = {
                enabled = true,  -- Enable spelling suggestions
                suggestions = 20 -- Number of suggestions to show
            },
        },
    },

    config = function()
        local wk = require("which-key")
        wk.add({
        -- Harpoon
        { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc ="Harpoon Add"},
        { "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc ="Harpoon Ui"},
        { "<leader>r", "<cmd>lua require('harpoon.mark').rm_file()<cr>", desc ="Harpoon Ui"},
        { "<leader>c", "<cmd>lua require('harpoon.mark').clear_all()<cr>", desc ="Harpoon clear"},

        -- Trouble 
        { "<leader>td", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble Toggle" },
        { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Trouble Buffer Toggle" },
        { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", hidden = true },
        { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",  hidden = true  },
        { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", hidden = true },
        { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", hidden = true },


            { "<leader>g", group = "LSP" }, -- group
            { '<leader>K', "<cmd>vim.lsp.buf.hover<cr>", desc = "Hover Docs" },
            {'<leader>gd', "<cmd>vim.lsp.buf.definition<cr>", desc = "Definition"},
            {'<leader>gD', "<cmd>vim.lsp.buf.declaration<cr>", desc = "Declaration"},
            {'<leader>gi', "<cmd>vim.lsp.buf.implementation<cr>", desc = "Implementation"},
            {'<leader>go', "<cmd>vim.lsp.buf.type_definition<cr>", hidden = "Type Definition"},
            {'<leader>gr', "<cmd>vim.lsp.buf.references<cr>", desc = "References"},

        { "<leader>f", group = "file" }, -- group
        { "<leader>fb", function() print("hello") end, desc = "Foobar" },
        { "<leader>fn", desc = "New File" },
        { "<leader>f1", hidden = true }, -- hide this keymap
        { "<leader>w", proxy = "<c-w>", group = "windows" }, 
        { "<leader>N", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },

            -- Add more custom key bindings here
        })
    end,
}
