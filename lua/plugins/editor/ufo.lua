return {
	{
		"kevinhwang91/nvim-ufo",
		event = "VeryLazy",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function() end,
	},
	{
		"stevearc/resession.nvim",
		event = "VeryLazy",
		config = function()
			require("config.plugins.ui.fold")
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "isort", "black" },
					-- You can customize some of the format options for the filetype (:help conform.format)
					rust = { "rustfmt", lsp_format = "fallback" },
					-- Conform will run the first available formatter
					javascript = { "prettierd", "prettier", stop_after_first = true },
					format_on_save = {
						-- These options will be passed to conform.format()
						timeout_ms = 500,
						lsp_format = "fallback",
					},
					vim.api.nvim_create_autocmd("BufWritePre", {
						pattern = "*",
						callback = function(args)
							require("conform").format({ bufnr = args.buf })
						end,
					}),
				},
			})
		end,
	},
}
