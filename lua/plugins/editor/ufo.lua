return {
	{
		"kevinhwang91/nvim-ufo",
		event = "VeryLazy",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			require("config.plugins.ui.fold")
		end,
	},
	{
		"rmagatti/auto-session",

		event = "VeryLazy",
		keys = {
			-- Will use Telescope if installed or a vim.ui.select picker otherwise
			{ "<leader>Sr", "<cmd>SessionSearch<CR>", desc = "Session search" },
			{ "<leader>Ss", "<cmd>SessionSave<CR>", desc = "Save session" },
			{ "<leader>Sa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
		},
		---enables autocomplete for opts
		---@module "auto-session"
		---@type AutoSession.Config
		opts = {
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			-- log_level = 'debug',
		},
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
