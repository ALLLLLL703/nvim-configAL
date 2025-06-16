return {
	'nvim-treesitter/nvim-treesitter',





	build = ':TSUpdate',



	event = "VeryLazy",


	config = function()
		local configs = require('nvim-treesitter.configs')

		configs.setup({



			ensure_installed = {
				"lua",
				"vim",
				"javascript",
				"typescript",
				"html",
				"css",
				"json",
				"yaml",
				"markdown",
				"python",
				"c",
				"cpp",
				"go",
				"rust",
				"java",
			},




			auto_install = true,



			highlight = {
				enable = true,


			},
			indent = {
				enable = true,


			},
		})
	end,

}
