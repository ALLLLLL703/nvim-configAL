return {
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
			-- 'nvim-treesitter/playground',
			-- 'nvim-treesitter/nvim-treesitter-refactor',
			-- 'nvim-treesitter/nvim-treesitter-context',
			-- 'nvim-treesitter/nvim-treesitter-endwise',
			-- 'nvim-treesitter/nvim-treesitter-autotag',
		},
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
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",  -- 选中整个函数
							["if"] = "@function.inner",  -- 选中函数体
							["ac"] = "@class.outer",     -- 选中整个类
							["ic"] = "@class.inner",     -- 选中类内容
							["aa"] = "@parameter.outer", -- 选中参数
							["ia"] = "@parameter.inner", -- 选中参数内容
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = { ["]m"] = "@function.outer" },
						goto_previous_start = { ["[m"] = "@function.outer" },
					},
				},
			})
		end,

	},

}
