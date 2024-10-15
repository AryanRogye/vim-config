local M = {}

local notify = require('notify')

function M.setup()
    local opts = {
        max_width = 50,
        max_height = 10,
        stages = "fade_in_slide_out",
        timeout = 3000,
        top_down = false,
        background_colour = "#000000",  -- Add this line to specify the background color.
    }

    notify.setup(opts)

    -- Set notify as the default notification provider
    vim.notify = notify
end

return M
