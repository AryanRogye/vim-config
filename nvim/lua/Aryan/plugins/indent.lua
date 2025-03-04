return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    config = function()
        require("ibl").setup {
            indent = { char = "¦" },  -- Small dot character
            scope = { enabled = true },
        }
    end
}
