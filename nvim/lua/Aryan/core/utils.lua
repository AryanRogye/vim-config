local M = {}
-- Helper Function to Update the Theme in init.lua
-- M.utif = function(active_theme, inactive_theme, inactive_theme2)
--     local filePath = vim.fn.expand("~/.config/nvim/init.lua")
--     local file = io.open(filePath, "r")
--     if not file then
--         print("Could not open init.lua for reading: " .. filePath)
--         return
--     end
--
--     local lines = {}
--     for line in file:lines() do
--         if line == "-- " .. active_theme or line == active_theme then
--             -- Ensure the active_theme line is uncommented
--             table.insert(lines, active_theme)
--         elseif line == "-- " .. inactive_theme or line == inactive_theme then
--             -- Ensure the inactive_theme line is commented
--             table.insert(lines, "-- " .. inactive_theme)
--         elseif line == "-- " .. inactive_theme2 or line == inactive_theme2 then
--             -- Ensure the inactive_theme2 line is commented
--             table.insert(lines, "-- " .. inactive_theme2)
--         else
--             -- Keep other lines unchanged
--             table.insert(lines, line)
--         end
--     end
--     file:close()
--
--     file = io.open(filePath, "w")
--     if not file then
--         print("Could not open init.lua for writing: " .. filePath)
--         return
--     end
--     for _, line in ipairs(lines) do
--         file:write(line .. "\n")
--     end
--     file:close()
--
--     print("Theme updated in init.lua")
-- end
--
-- vim.api.nvim_set_keymap("n", "<leader>ll", ":lua Lt()<CR>", { noremap = true, silent = true })
-- function Lt()
--     local str = vim.fn.input("> ")
--     local strI = tonumber(str)
--     if strI then
--         local command = ":lua Load(" .. strI .. ")"
--         vim.cmd(command)
--     end
-- end




-- Easy Function for helps
function Remember(index)
    print("\n")
    local remember = {
        {"Telescope Files", "N"},
        {"Telescope Grep", "f"},
        {"Rain Animation", "<leader>F"},
        {""},
    }
    local foundFor = false
    local str = tostring(index):lower()
    if str == " " then
        for _, value in pairs(remember) do
            print(value[1], " | ", value[2])
        end
        return
    end
    for _, value in pairs(remember) do
        local found = false
        if string.find(value[1]:lower(), str) then
            found = true
        end
        if string.find(value[2]:lower(), str) then
            found = true
        end
        if found then
            print(value[1], " | ", value[2])
            foundFor = true
            break
        end
    end
    if not foundFor then
        print("Index Doesn't Exist")
    end
end
vim.api.nvim_set_keymap("n", "R", ":lua RemFunc()<CR>", { noremap = true, silent = true })
function RemFunc()
    local str = vim.fn.input("> ")
    local command = ":lua Remember('" .. str .. "')"
    vim.cmd(command)
end


return M
