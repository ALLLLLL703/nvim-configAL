return {
	-- 👇 in this section, choose your own keymappings!
	{
		"<leader>-",
		mode = { "n", "v" },
		"<cmd>Yazi<cr>",
		desc = "Open yazi at the current file",
	},
	{
		-- Open in the current working directory
		"<leader>cw",
		"<cmd>Yazi cwd<cr>",
		desc = "Open the file manager in nvim's working directory",
	},
}
