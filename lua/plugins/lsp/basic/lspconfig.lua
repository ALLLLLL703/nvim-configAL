-- ======================================
--     lua/plugins/lsp/lspconfig.lua
--       (neovim/nvim-lspconfig Plugin)
-- ======================================
-- 插件仓库: https://github.com/neovim/nvim-lspconfig
-- 文档链接: https://github.com/neovim/nvim-lspconfig/blob/master/doc/lspconfig.txt
-- 支持的 LSP 服务器列表: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
return {
	{
		"junnplus/lsp-setup.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim", -- optional
			"mason-org/mason-lspconfig.nvim", -- optional
		},
		---@type LspSetup.Options
		opts = {
			servers = {
				pylsp = {},
				clangd = {},
			},
		},

		config = function()
			require("config.plugins.lsp.lspconfig")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("clangd")
			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("bash")
			vim.lsp.enable("asm_lsp")
			vim.lsp.enable("pyright")
			require("lspconfig").jdtls.setup({})
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
	},
}
