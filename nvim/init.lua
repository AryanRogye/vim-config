require("Aryan.core")
require("Aryan.plugin")

vim.filetype.add({
    extension = {
        m = "objc", -- Treat .m files as Objective-C
    },
})
local M = require("Aryan.core.themes")
-- Function to Load a Theme by Number
function Load(num)
    local themes = { M.lg, M.lo, M.lc }
    if themes[num] then
        themes[num]()
    else
        print("Invalid Number")
    end
end
-- Uncomment one of the themes to set it as default
-- M.lg()
-- M.lo()
-- M.lc()
