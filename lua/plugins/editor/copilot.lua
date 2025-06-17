

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
			require('config.plugins.debug.code_runner')
		end,

	},
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
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = { "saghen/blink.cmp" },   -- 确保与 blink.cmp 兼容
		config = function()
			local autopairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")

			-- 基本设置
			autopairs.setup {
				check_ts = true,                                   -- 启用 Treesitter 检查，提升语言感知
				ts_config = {
					lua = { "string", "source" },                    -- 在 Lua 的字符串和源代码中启用
					cpp = { "source" },                              -- 在 C++ 源代码中启用
				},
				disable_filetype = { "TelescopePrompt", "vim" },   -- 在这些文件类型中禁用
				fast_wrap = {
					map = "<M-e>",                                   -- Alt+e 触发快速包裹
					chars = { "{", "[", "(", "\"", "'" },            -- 可包裹的符号
					pattern = [=[[%'%"%>%]%)%}%,]]=],                -- 触发包裹的结束字符
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",             -- 选择包裹符号的快捷键
				},
			}
			autopairs.get_rule("{"):with_cr(function()
				return true   -- 按回车时自动换行并缩进
			end)
			accept = { auto_brackets = { enabled = true } }
		end,
	},

}
