return {
	{
		"nvim-lualine/lualine.nvim",
		-- 依赖：lualine 也依赖 nvim-web-devicons 来显示文件类型图标
		dependencies = { "nvim-tree/nvim-web-devicons" },
		tag = "v1.4.2", -- 你可以在 GitHub 仓库的 "releases" 页面找到最新稳定 tag。

		event = "VeryLazy",

		-- 配置函数：当插件加载时执行
		config = function()
			require("config.plugins.ui.lualine")
		end,
	},
	{
		"goolord/alpha-nvim",
		lazy = true,

		event = "VimEnter",
		config = function()
			-- alpha-config.lua
			require("config.plugins.ui.alpha")
		end,
	},

	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"anuvyklack/pretty-fold.nvim",
		config = function()
			require("pretty-fold").setup()
		end,
	},
}
