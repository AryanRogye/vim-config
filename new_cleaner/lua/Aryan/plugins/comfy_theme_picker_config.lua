return {
	"ComfyCanvas",
	dir = "/Users/aryanrogye/Documents/CODE/LearningAndPractice/lua-content/ComfyCanvas/",
	config = function(_, opts)
		require("ComfyCanvas").setup(opts)
	end,
	lazy = true,
	cmd = { "HelloNvim", "ThemeSwitch" },
	keys = {
		{ "<leader>cc", "<cmd>LuiOpen<CR>", desc = "Say Hello from ComfyCanvas", noremap = true, silent = true },
		{ "<leader>ct", "<cmd>ThemeSwitch<CR>", desc = "Say Hello from ComfyCanvas", noremap = true, silent = true }
	},
}
