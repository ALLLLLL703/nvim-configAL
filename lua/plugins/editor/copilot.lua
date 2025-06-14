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
	{
		"CRAG667/code_runner.nvim",
		config = function()
			require('code_runner').setup({
				filetype = {
					java = {
						"cd $dir &&",
						"javac $fileName &&",
						"java $fileNameWithoutExt"
					},
					python = "python3 -u",
					typescript = "deno run",
					rust = {
						"cd $dir &&",
						"rustc $fileName &&",
						"$dir/$fileNameWithoutExt"
					},
					c = function(...)
						c_base = {
							"cd $dir &&",
							"gcc $fileName -o",
							"/tmp/$fileNameWithoutExt",
						}
						local c_exec = {
							"&& /tmp/$fileNameWithoutExt &&",
							"rm /tmp/$fileNameWithoutExt",
						}
						vim.ui.input({ prompt = "Add more args:" }, function(input)
							c_base[4] = input
							vim.print(vim.tbl_extend("force", c_base, c_exec))
							require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
						end)
					end,
				},
			})
		end,

	},
	{ 'jiangmiao/auto-pairs', config = true },
	{
		'HiPhish/rainbow-delimiters.nvim',
		config = function()
			--rainbow-delimiters.lua
			---@type rainbow_delimiters.config
			vim.g.rainbow_delimiters = {
				strategy = {
					[''] = 'rainbow-delimiters.strategy.global',
					vim = 'rainbow-delimiters.strategy.local',
				},
				query = {
					[''] = 'rainbow-delimiters',
					lua = 'rainbow-blocks',
				},
				priority = {
					[''] = 110,
					lua = 210,
				},
				highlight = {
					'RainbowDelimiterRed',
					'RainbowDelimiterYellow',
					'RainbowDelimiterBlue',
					'RainbowDelimiterOrange',
					'RainbowDelimiterGreen',
					'RainbowDelimiterViolet',
					'RainbowDelimiterCyan',
				},
			}
		end,
	},
}
