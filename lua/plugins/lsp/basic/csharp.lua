return {
	{
		"iabdelkareem/csharp.nvim",
		dependencies = {
			"williamboman/mason.nvim", -- Required, automatically installs omnisharp
			"mfussenegger/nvim-dap",
			"Tastyep/structlog.nvim", -- Optional, but highly recommended for debugging
		},
		config = function()
			require("csharp").setup({
				lsp = {
					-- Sets if you want to use omnisharp as your LSP
					omnisharp = {
						-- When set to false, csharp.nvim won't launch omnisharp automatically.
						enable = true,
						-- When set, csharp.nvim won't install omnisharp automatically. Instead, the omnisharp instance in the cmd_path will be used.
						cmd_path = vim.fn.stdpath("data") .. "/mason/packages/omnisharp/OmniSharp",
						-- The default timeout when communicating with omnisharp
						default_timeout = 1000,
						-- Settings that'll be passed to the omnisharp server
						enable_editor_config_support = true,
						organize_imports = true,
						load_projects_on_demand = false,
						enable_analyzers_support = true,
						enable_import_completion = true,
						include_prerelease_sdks = true,
						analyze_open_documents_only = false,
						enable_package_auto_restore = true,
						-- Launches omnisharp in debug mode
						debug = false,
					},
					-- Sets if you want to use roslyn as your LSP
					roslyn = {
						-- When set to true, csharp.nvim will launch roslyn automatically.
						enable = false,
						-- Path to the roslyn LSP see 'Roslyn LSP Specific Prerequisites' above.
						cmd_path = nil,
					},
					-- The capabilities to pass to the omnisharp server
				},
				logging = {
					-- The minimum log level.
					level = "INFO",
				},
				dap = {
					-- When set, csharp.nvim won't launch install and debugger automatically. Instead, it'll use the debug adapter specified.
					--- @type string?
					adapter_name = "netcoredbg",
				},
			})
		end,
	},
	{
		"Hoffs/omnisharp-extended-lsp.nvim",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "cs",
				callback = function(ev)
					local opts = { buffer = ev.buf, noremap = true, silent = true }

					-- vim.keymap.set("n", "gr", function()
					-- 	require("omnisharp_extended").telescope_lsp_references(
					-- 		require("telescope.themes").get_ivy({ excludeDefinition = true })
					-- 	)
					-- end, opts)

					vim.keymap.set("n", "gd", require("omnisharp_extended").telescope_lsp_definition, opts)

					vim.keymap.set("n", "gr", function()
						require("omnisharp_extended").telescope_lsp_references()
					end, opts)

					vim.keymap.set("n", "gi", require("omnisharp_extended").telescope_lsp_implementation, opts)
				end,
			})
		end,
	},
}
