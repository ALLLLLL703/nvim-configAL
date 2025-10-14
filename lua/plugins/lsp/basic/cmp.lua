return {
	--mini.nvim
	{
		"echasnovski/mini.nvim",
		dependencies = {
			"echasnovski/mini.ai",
			"echasnovski/mini.surround",
		},
		config = function() end,
	},
	--luasnip
	-- {
	-- 	'L3MON4D3/LuaSnip',
	-- },
	-- cmp copilot
	--
	--blink
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"fang2hou/blink-copilot",
			"ribru17/blink-cmp-spell",
			"moyiz/blink-emoji.nvim",
			"xzbdmw/colorful-menu.nvim",
			opts = {
				max_completions = 1, -- Global default for max completions
				max_attempts = 2, -- Global default for max attempts
			},
		},
		event = "VeryLazy",
		-- version = '*',
		build = "cargo build --release",
		config = function()
			require("config.plugins.lsp.cmp")
		end,
	},
	{ "rafamadriz/friendly-snippets" },
}
