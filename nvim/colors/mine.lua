vim.cmd("highlight clear")
vim.o.background = "dark"
vim.g.colors_name = "mytheme"

local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- Set background and text
hl("Normal", { bg = "#090919", fg = "#b6c2bc" })

-- Set comments to bright green
hl("Comment", { fg = "#00ff00", italic = true }) 

-- Adjust UI elements
hl("LineNr", { fg = "#505050" }) 
hl("CursorLineNr", { fg = "#ffffff", bold = true })
hl("VertSplit", { fg = "#505050", bg = "#052b2a" })
hl("StatusLine", { fg = "#989483", bg = "#052b2a", bold = true })
hl("StatusLineNC", { fg = "#505050", bg = "#052b2a" })

-- Syntax highlighting
hl("Keyword", { fg = "#b6c2bc", bold = true })
hl("Function", { fg = "#b6c2bc" })
hl("String", { fg = "#66ffd4" })
hl("Number", { fg = "#d19a66" })
hl("Type", { fg = "#b6c2bc" })
hl("Identifier", { fg = "#b6c2bc" })
hl("Statement", { fg = "#b6c2bc", bold = true })


hl("@type.builtin.cpp", { fg = "#b6c2bc", bold = true })
hl("@module.cpp", { fg = "#b6c2bc", bold = true })
hl("@type.cpp", { fg = "#b6c2bc", bold = true })
hl("@lsp.type.class.cpp", { fg = "#b6c2bc", bold = true })
hl("@lsp.mod.globalScope.cpp", { fg = "#b6c2bc", bold = true })
hl("@lsp.typemod.class.globalScope.cpp", { fg = "#b6c2bc", bold = true })

hl("@_parent.cpp", { fg = "#b6c2bc", bold = true })
hl("@variable.builtin.cpp", { fg = "#b6c2bc", bold = true })


-- Preprocessor
hl("PreProc", { fg = "#66ffa6", bold = true })
hl("@keyword.directive.define.cpp", { fg = "#66ffa6", bold = true })
hl("@keyword.import.cpp", { fg = "#66ffa6", bold = true })
hl("include", { fg = "#66ffa6", bold = true }) -- Specific for #include
hl("Define", { fg = "#66ffa6", bold = true }) -- For #define
hl("Macro", { fg = "#66ffa6", bold = true }) -- For macros


