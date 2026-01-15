return {
	"rshkarin/mason-nvim-lint",
	event = "VeryLazy",
	dependencies = { "mfussenegger/nvim-lint" },
	config = function()
		require("config.plugins.editor.lint")
	end,
}
