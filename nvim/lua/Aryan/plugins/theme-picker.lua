return {
    'AryanRogye/theme-picker.nvim',
    branch = "testing",
    config = function()
        local theme = require("Aryan.core.themes")
        require("theme-loader").setup({
            default = 3,
            themes = { -- Pass themes directly
                { name = "GruvBox", func = theme.lg },
                -- { name = "Gruv2", func = theme.g2 },
                -- { name = "GruvBox", func = function()
                --     print("GRUV")
                --     vim.cmd("colorscheme gruvbox")
                -- end },
                { name = "ayo", func = theme.au },
                -- { name = "Oxocarbon"  , func = theme.lo  },
                -- { name = "Cyberdream" , func = theme.lc  },
                { name = "Solorized",   func = theme.sol },
                { name = "Dark Flat"  , func = theme.df  },
                { name = "Rose Pine"  , func = theme.rp  },
                { name = "Sakura"     , func = theme.ls  },
                { name = "Gruber"     , func = theme.gd  },
                -- { name = "Neofusion"  , func = theme.nf  },
                { name = "vscode"     , func = theme.vsc },
                -- { name = "vscode2"     , func = theme.vv },
                -- { name = "reykjavik"  , func = theme.re  },
                { name = "comfy"      , func = theme.co  },
                { name = "tokyonight" , func = theme.tokyonight  },
                { name = "cat"    , func = theme.drac },
                { name = "nightfox"    , func = theme.fd  },
                -- { name = "zenburns1"   , func = theme.zenburns1 },
                -- { name = "zenburns2"   , func = theme.zenburns0 },
                { name = "farout"      , func = theme.farout },
                { name = "owl"         , func = theme.owl },
                { name = "dos"         , func = theme.dos },
                { name = "mine"        , func = theme.mine },
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
