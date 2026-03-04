return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"jay-babu/mason-nvim-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			require("config.plugins.dap.dap")
			require("keymaps.run_and_debug.code_runner")
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^7", -- Recommended
		lazy = false, -- This plugin is already lazy
		event = "VeryLazy",
		ft = "rust",
	},
}
