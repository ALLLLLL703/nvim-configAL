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
}
