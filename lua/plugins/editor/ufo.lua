return {
	{
		"kevinhwang91/nvim-ufo",
		event = "VeryLazy",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			require("config.plugins.ui.fold")
		end,
	},
	{
		"rmagatti/auto-session",

		event = "VeryLazy",
		keys = {
			-- Will use Telescope if installed or a vim.ui.select picker otherwise
			{ "<leader>Sr", "<cmd>SessionSearch<CR>", desc = "Session search" },
			{ "<leader>Ss", "<cmd>SessionSave<CR>", desc = "Save session" },
			{ "<leader>Sa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
		},
		---enables autocomplete for opts
		---@module "auto-session"
		---@type AutoSession.Config
		opts = {
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			-- log_level = 'debug',
		},
	},
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		opts = {},
		config = function()
			require("config.plugins.lsp.format")
		end,
	},
}
