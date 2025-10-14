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
			require("keymaps.editor.ufunc")
			require("keymaps.editor.undo")
		end,
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
	{
		"m-demare/hlargs.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		event = "VeryLazy",
		config = function()
			require("hlargs").setup({})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
		config = function()
			require("config.plugins.ui.colorizer")
		end,
	},
}
