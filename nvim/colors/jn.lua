local theme = {
    Normal = { fg = "#bdb395", bg = "#042327" },
    Comment = { fg = "#31B72C", italic = true },
    Keyword = { fg = "#CCCCCC", bold = true },
    Identifier = { fg = "#A5B5BC" },
    Function = { fg = "#bdb395" },
    Statement = { fg = "#CCCCCC", bold = true },
    Constant = { fg = "#70c5bf" },
    String = { fg = "#2ca198" },
    Type = { fg = "#9DE3C0", bold = true },
    Special = { fg = "#B59E7A", bold = true },
    Operator = { fg = "#CCCCCC" },
    PreProc = { fg = "#B59E7A" },
    Underlined = { fg = "#B59E7A", underline = true },

    -- UI Elements
    Cursor = { fg = "#86E08F", bg = "#000000" },
    CursorLine = { bg = "#0000FF" },
    CursorLineNr = { fg = "#B59E7A", bold = true },
    LineNr = { fg = "#B59E7A" },
    Visual = { bg = "#0000FF", fg = "#FFFFFF" },
    Search = { bg = "#63878A", fg = "#FFFFFF" },
    IncSearch = { bg = "#B59E7A", fg = "#000000" },
    Pmenu = { fg = "#CCCCCC", bg = "#042327" },
    PmenuSel = { bg = "#B59E7A" },
    PmenuThumb = { bg = "#B59E7A" },

    -- Status Line & Tabs
    StatusLine = { fg = "#000000", bg = "#B59E7A" },
    StatusLineNC = { fg = "#bdb395", bg = "#B59E7A" },
    TabLine = { fg = "#CCCCCC", bg = "#042327" },
    TabLineSel = { fg = "#FFFFFF", bg = "#B59E7A" },
    TabLineFill = { fg = "#CCCCCC", bg = "#042327" },

    -- Sidebar & Windows
    VertSplit = { fg = "#B59E7A" },
    WinSeparator = { fg = "#B59E7A" },
    SignColumn = { bg = "#042327" },
    Folded = { fg = "#bdb395", bg = "#042327" },
    FoldColumn = { fg = "#B59E7A" },

    -- Activity Bar, SideBar, Panels
    Sidebar = { fg = "#CCCCCC", bg = "#042327" },
    ActivityBar = { fg = "#D7DAE0", bg = "#042327" },
    ActivityBarBorder = { fg = "#B59E7A", bg = "#0C141F" },
    ActivityBarBadge = { fg = "#000000", bg = "#B59E7A" },
    PanelBorder = { fg = "#B59E7A" },
    SideBarTitle = { fg = "#BBBBBB" },
    SideBarSectionHeader = { fg = "#000000", bg = "#B59E7A" },

    -- Title Bars
    TitleBarActive = { fg = "#FFFFFF", bg = "#052C31" },
    TitleBarInactive = { fg = "#CCCCCC", bg = "#0C141F" },
    TitleBarBorder = { fg = "#B59E7A" },

    -- Brackets & Matching (FIXED)
    MatchParen = { fg = "#B59E7A", bg = "#042327" }, -- Removed invalid `#B59E7A00`
    Bracket = { fg = "#B59E7A" },

    -- Diagnostics
    DiagnosticError = { fg = "#FF0000" },
    DiagnosticWarn = { fg = "#B59E7A" },
    DiagnosticInfo = { fg = "#9DE3C0" },
    DiagnosticHint = { fg = "#70C5BF" },

    -- Editor Highlights
    EditorForeground = { fg = "#BDB395" },
    EditorBackground = { bg = "#042327" },
    EditorSelection = { bg = "#0000FF", fg = "#FFFFFF" },
    EditorSelectionHighlight = { bg = "#63878A" },
    EditorLineHighlight = { bg = "#FFFFFF" }, -- Removed invalid transparency
    EditorCursor = { fg = "#86E08F" },
    EditorBracketMatch = { fg = "#B59E7A" },

    -- Treesitter
    TSFunction = { link = "Function" },
    TSMethod = { link = "Function" },
    TSKeyword = { link = "Keyword" },
    TSVariable = { link = "Identifier" },
    TSConstant = { link = "Constant" },
    TSString = { link = "String" },
    TSType = { link = "Type" },
    TSParameter = { fg = "#CBE0F5" },
}

-- Apply Theme
local function apply_theme()
    for group, settings in pairs(theme) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end

apply_theme()

return theme
