return {
    "echasnovski/mini.splitjoin",
    config = function()
        require("mini.splitjoin").setup({
            mappings = {
                toggle = 'gs',
                split = '',
                join = '',
            },
            detect = {
                brackets = nil,
                separators = ',',
                exclude_regions = nil,
            },
            split = {
                hooks_pre = {},
                hooks_post = {},
            },
            join = {
                hooks_pre = {},
                hooks_post = {},
            },
        })
    end
}
