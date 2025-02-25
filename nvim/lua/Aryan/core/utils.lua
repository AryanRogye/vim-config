local M = {}

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

return M
