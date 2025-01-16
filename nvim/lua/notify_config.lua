-- ~/.config/nvim/lua/notify_config.lua

local M = {}

-- Require the 'notify' plugin
local notify = require('notify')

function M.setup()
    notify.setup({
        max_width = 50,
        max_height = 10,
        background_colour = "#000000",
        stages = "fade_in_slide_out",
        timeout = 3000,
        top_down = false,
    })

    -- Set notify as the default notification provider
    vim.notify = notify
end

return M
