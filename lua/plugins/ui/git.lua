return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",

		config = function()
			require("config.plugins.ui.git")
			require("keymaps.ui.git")
		end,
	},
	{
		"3rd/image.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("custom.util.u1")
			require("config.plugins.ui.image")
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"vhyrro/luarocks.nvim",
		priority = 1001, -- this plugin needs to run before anything else
		opts = {
			rocks = { "magick" },
		},
	},
}
