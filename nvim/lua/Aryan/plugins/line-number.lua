return {
    "luukvbaal/statuscol.nvim",
    config = function()
        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
            setopt = true,        -- Automatically set 'statuscolumn'
            thousands = false,    -- Disable thousands separator
            relculright = true,   -- Right-align relative cursor line number
            ft_ignore = nil,      -- Keep active for all file types
            bt_ignore = nil,      -- Keep active for all buffer types
            segments = {
                -- Remove extra spaces or separators to minimize the column
                { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
            },
            clickmod = "c",       -- Modifier for click handlers
            clickhandlers = {
                -- You can keep or customize the handlers as needed
                Lnum = builtin.lnum_click,
            },
        })
        vim.opt.termguicolors = true
        vim.api.nvim_set_hl(0, "LineNr", { bg = "#1e1e2e", fg = "#cdd6f4" })          -- Background for absolute line numbers
        vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#1e1e2e", fg = "#f38ba8" })   -- Background for the current line number
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "#1e1e2e" })                     -- Background for the sign column
        vim.api.nvim_set_hl(0, "LineNrAbove", { bg = "#1e1e2e", fg = "#89dceb" })    -- Background for relative numbers above
        vim.api.nvim_set_hl(0, "LineNrBelow", { bg = "#1e1e2e", fg = "#a6e3a1" })    -- Background for relative numbers below
    end,
}
