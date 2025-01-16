return {
    'folke/zen-mode.nvim',
    'folke/twilight.nvim',
    opts = {
        window = {
            backdrop = 0.45,
            width = 120,
            options = {
                -- relativenumber = false, -- disable relative numbers
                -- cursorline = false, -- disable cursorline
                -- cursorcolumn = false, -- disable cursor column
                -- foldcolumn = "0", -- disable fold column
                -- list = false, -- disable whitespace characters
            },
        },
        plugins = {
            options = {
                enabled =true,
            },
            twilight = { enabled = true },
            tmux = { enabled = true },
        },
    },
}

