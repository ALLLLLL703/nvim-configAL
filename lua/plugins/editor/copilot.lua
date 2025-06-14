local config = require "config"
return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({})
		end,
	},
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	},
	{ "CRAG667/code_runner.nvim",        config = true },
	{ 'jiangmiao/auto-pairs',            config = true },
	{ 'HiPhish/rainbow-delimiters.nvim', config = true },
}
