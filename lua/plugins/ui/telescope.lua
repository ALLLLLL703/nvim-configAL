return {
	{

		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		config = function()
			require("config.plugins.editor.telescope")
		end,
	},
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("config.plugins.ui.theme")
		end,
	},
	{
		"nvim-telescope/telescope-media-files.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
		},
		config = function() end,
	},
	{
		"ghassan0/telescope-glyph.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("glyph")
		end,
	},
}
