return {
    "yamatsum/nvim-cursorline",
    config = function()
        require("nvim-cursorline").setup {
            cursorline = { enable = true, timeout = 100 },  -- Enable smooth cursor
            cursorword = { enable = true, min_length = 3 }  -- Highlight words under cursor
        }
    end
}
