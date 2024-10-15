return {
	'nvim-treesitter/nvim-treesitter',
	config = function()
		require'nvim-treesitter.configs'.setup {
			ensure_installed = { "c","cpp","java","rust","go", "zig"},

			sync_install = false,
			auto_install = true,

			indent = { enable = true },
			incremental_selection = { enable = true },

			highlight = {
				enable = true,
			}
		}
	end
}
