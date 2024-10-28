return {
    'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-live-grep-args.nvim',
	},
	config = function ()

		local highlight = vim.api.nvim_set_hl
		highlight(0, 'FloatBorder', { link = 'WinSeparator' })  -- Match FloatBorder to window separators for consistency
		highlight(0, 'TelescopePromptCounter', { link = 'TelescopeNormal' })  -- Style prompt counter similarly to other Telescope elements
		highlight(0, 'TelescopeSelection', { link = 'TelescopePromptPrefix' })  -- Style selection

		local telescope = require('telescope')
		telescope.setup({
			defaults = {
				prompt_prefix = "➤ ",
				selection_caret = "➤ ",
				path_display = { "truncate" },  -- Truncate long paths for better readability
				sorting_strategy = 'ascending', -- Show results with newest at the bottom
				layout_strategy = 'horizontal',
				borderchars = {
                    prompt  = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
                    results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
                    preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
				},
				layout_config = {
					horizontal = {
						prompt_position = 'bottom',  -- Position prompt at the top
						preview_cutoff = 40,      -- Hide preview if screen size is below 40 columns
						height = 0.9,             -- Take up 90% of the screen height
						width = 0.9,              -- Take up 80% of the screen width
					},
					center = {
						height = 0.4,
						preview_cutoff = 40,
						prompt_position = 'top',
						width = 0.8,
					}
				},
				prompt_title = false,
                results_title = false,
                color_devicons = true,
			}
		})
        telescope.load_extension('live_grep_args')
	end
}
