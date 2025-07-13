return {
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	-- {
	-- "ray-x/lsp_signature.nvim",
	-- event = "VeryLazy",
	-- opts = {
	-- 	-- cfg options
	-- },
	-- config = function()
	-- 	require("config.plugins.lsp.lsp_signature")
	-- end,
	-- },
}
