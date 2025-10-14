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
		opts = {
			backend = "kitty", -- Ghostty 支持 kitty graphics protocol
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
				},
			},
			max_width = 100,
			max_height = 40,
			window_overlap_clear_enabled = true,
		},
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
}
