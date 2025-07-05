return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",

		config = function()
			require("config.plugins.ui.git")
			require("keymaps.ui.git")
		end,
	},
}
