local opt = {
	default_file_explorer = true,

	columns = {
		"icon",
	},
	lsp_file_methods = {
		-- Enable or disable LSP file operations
		enabled = true,
		-- Time to wait for LSP file operations to complete before skipping
		timeout_ms = 1000,
		-- Set to true to autosave buffers that are updated with LSP willRenameFiles
		-- Set to "unmodified" to only save unmodified buffers
		autosave_changes = false,
	},
	sort = {
		-- sort order can be "asc" or "desc"
		-- see :help oil-columns to see which columns are sortable
		{ "name", "asc" },
		{ "type", "asc" },
		{ "permissions", "desc" },
	},
	float = {
		-- Padding around the floating window
		padding = 2,
		-- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
		max_width = 0.5,
		max_height = 0.5,
		border = "rounded",
		win_options = {
			winblend = 0,
		},
		-- optionally override the oil buffers window title with custom function: fun(winid: integer): string
		get_win_title = nil,
		-- preview_split: Split direction: "auto", "left", "right", "above", "below".
		preview_split = "auto",
		-- This is the config that will be passed to nvim_open_win.
		-- Change values here to customize the layout
		override = function(conf)
			return conf
		end,
	},
	open_float = true,
}
require("oil").setup(opt)
vim.keymap.set("n", "-", function()
	require("oil").toggle_float()
end, { desc = "Open oil" })
