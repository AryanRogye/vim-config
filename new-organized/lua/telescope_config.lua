local telescope = require('telescope')

-- Load Telescope with default settings
telescope.setup({
	defaults = {
		prompt_prefix = "➤ ",
		selection_caret = "➤ ",
		path_display = { "smart" },
	}
})
