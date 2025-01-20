return {
    'rcarriga/nvim-notify',
    config = function()
        require("notify").setup({
            max_width = 50,
            max_height = 10,
            background_colour = "#000000",
            stages = "fade_in_slide_out",
            timeout = 3000,
            top_down = false,
        })
        vim.notify = require("notify")
    end
}
