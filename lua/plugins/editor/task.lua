return {
	{
		"stevearc/overseer.nvim",
		event = "VeryLazy",
		opts = {},
		config = function()
			require("config.plugins.editor.overseer")
			require("config.custom.task.task")
			require("config.custom.task.telescope_task")
		end,
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			image = { enabled = false },
		},
		config = true,
	},
}
