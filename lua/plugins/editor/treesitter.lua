return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			-- 'nvim-treesitter/playground',
			-- 'nvim-treesitter/nvim-treesitter-refactor',
			-- 'nvim-treesitter/nvim-treesitter-context',
			-- 'nvim-treesitter/nvim-treesitter-endwise',
			-- 'nvim-treesitter/nvim-treesitter-autotag',
		},
		build = ":TSUpdate",
		event = "VeryLazy",
		config = function()
			require("config.plugins.editor.treesitter")
			require("keymaps.global")
			require("keymaps.ui")
			require("keymaps.run_and_debug")
			require("keymaps.lsp")
			require("keymaps.editor")
		end,
	},
	{
		"3rd/image.nvim",
		opts = {
			backend = "kitty",
		},
	},
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	-- {
	-- 	"folke/snacks.nvim",
	-- 	priority = 1000,
	-- 	lazy = false,
	-- 	---@type snacks.Config
	-- 	opts = {
	-- 		-- your configuration comes here
	-- 		-- or leave it empty to use the default settings
	-- 		-- refer to the configuration section below
	-- 		bigfile = { enabled = true },
	-- 		dashboard = { enabled = true },
	-- 		explorer = { enabled = false },
	-- 		indent = { enabled = true },
	-- 		input = { enabled = true },
	-- 		image = { enabled = true },
	-- 		picker = { enabled = false },
	-- 		notifier = { enabled = false },
	-- 		quickfile = { enabled = true },
	-- 		scope = { enabled = false },
	-- 		scroll = { enabled = true },
	-- 		statuscolumn = { enabled = false },
	-- 		words = { enabled = true },
	-- 	},
	-- },
}
