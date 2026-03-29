return {
	"oclay1st/maven.nvim",
	cmd = { "Maven", "MavenInit", "MavenExec", "MavenFavorites" },
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {}, -- options, see default configuration
}
