return {
	{
		'kevinhwang91/nvim-ufo',
		dependencies = {
			'kevinhwang91/promise-async'
		},
		config = function()
		end,
	},
	{
		'stevearc/resession.nvim',
		event = "VeryLazy",
		config = function()
			require('config.plugins.ui.fold')
		end,
	},
}
