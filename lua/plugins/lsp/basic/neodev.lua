return {
	{
		"folke/neodev.nvim",
		event = "VimEnter",
		config = function()
			require("neodev").setup({
				library = {
					enabled = true,
					runtime = true, -- 把 $VIMRUNTIME 加入
					types = true, -- vim.api, vim.loop 等类型
					plugins = true, -- 加载 plugin 目录里的 Lua 库
				},
				lspconfig = true,
				pathStrict = false, -- 根据需要设为 true 或 false
			})
		end,
		opts = {},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
