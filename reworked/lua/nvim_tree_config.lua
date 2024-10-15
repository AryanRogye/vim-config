return {
	'kyazdani42/nvim-tree.lua',
	requires = {
		'kyazdani42/nvim-web-devicons',
	},
	config = function()
		require'nvim-tree'.setup {
			renderer = {
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
				},
			},
			view = {
				width = 30,
				side = 'right'
			},
		}
	end,
}
