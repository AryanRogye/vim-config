local M = {}

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")


local state = {
  floating = {
    buf = -1,
    win = -1,
  }
}

local transparent_enabled = false


-- This 
function M.CopyPathAndOpen()
    -- Get Path and Line Number
    local filepath = vim.fn.expand('%:p')
    local linenumber = vim.fn.line('.')

    -- Get nvim command to open file at line number
    local nvim_cmd = 'nvim +' .. linenumber .. ' ' .. filepath

    -- Close The Buffer
    vim.cmd('bdelete')
    -- Open Horizontal Tmux Split
    vim.fn.system("tmux split-window -h '" .. nvim_cmd .. "'")
end
function M.OpenCopyPathAndOpen()
    -- Do The J command which is getting the definition
    vim.lsp.buf.definition()
    M.CopyPathAndOpen()
end

local function create_floating_window(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.height or math.floor(vim.o.lines * 0.8)

    -- Calculate the position to center the window
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    -- Create a buffer
    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
    end

    -- Define window configuration
    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal", -- No borders or extra UI elements
        border = "rounded",
    }

    -- Create the floating window
    local win = vim.api.nvim_open_win(buf, true, win_config)

    return { buf = buf, win = win }
end

M.toggle_terminal = function()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_floating_window { buf = state.floating.buf }
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end

-- This is to make the nvim background transparent
M.toggle_transparent_and_save = function()
    local hl = vim.api.nvim_get_hl(0, { name = "Normal" })

    if M.transparency_enabled then
        -- If transparency is enabled, reset to original colorscheme
        vim.cmd("colorscheme " .. vim.g.colors_name)
        M.transparency_enabled = false
    else
        -- Enable transparency
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", fg = hl.fg })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
        M.transparency_enabled = true
    end
end

return M
