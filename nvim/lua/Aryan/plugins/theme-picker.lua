return {
    'AryanRogye/theme-picker.nvim',
    branch = "testing",
    config = function()
        local theme = require("Aryan.core.themes")
        require("theme-loader").setup({
            default = 3,
            themes = { -- Pass themes directly
                { name = "GruvBox", func = theme.lg },
                -- { name = "GruvBox", func = function()
                --     print("GRUV")
                --     vim.cmd("colorscheme gruvbox")
                -- end },
                { name = "Oxocarbon"  , func = theme.lo  },
                { name = "Cyberdream" , func = theme.lc  },
                { name = "Dark Flat"  , func = theme.df  },
                { name = "Rose Pine"  , func = theme.rp  },
                { name = "Sakura"     , func = theme.ls  },
                { name = "Gruber"     , func = theme.gd  },
                { name = "Neofusion"  , func = theme.nf  },
                { name = "vscode"     , func = theme.vsc },
            },
            keys = {
                {func = "ltbi",  mode = "n" , keys = "<leader>lu"},
                {func = "ltbui", mode = "n" , keys = "<leader>ll"}
            },
            config = {
                ui_col_spacing = 20,
                opening = " [",
                closing = "]",
                selection = "X",
                preview = true,
            }
        })
    end,
}
