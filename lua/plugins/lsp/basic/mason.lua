return {
	{
		"williamboman/mason.nvim",

		event = "VeryLazy",

		config = function()
			local registries = {
				"github:mason-org/mason-registry",

				"github:crashdummyy/mason-registry",
			}
			require("mason").setup({
				-- registries = registries,
				automatic_installation = true,

				auto_clean = true,

				log_level = vim.log.levels.INFO,

				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
				ensure_installed = {
					"vim",
					"xmlformatter",
					"csharpier",
					"bicep-lsp",
					"typescript-language-server",
					"roslyn",
					"rzls",
				},
			})
		end,
	},
}
