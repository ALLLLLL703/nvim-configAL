local map = vim.keymap.set
local wk = require("which-key")
wk.add({
	{ "<leader>f", group = "find and file" },
	{ "<leader>b", group = "buffers" },
	{ "<leader>c", group = "code" },
	{ "<leader>l", group = "lazy" },
	{ "<leader>g", group = "git" },
	{ "<leader>s", group = "search and split" },
	{ "<leader>u", group = "ui" },
	{ "<leader>x", group = "diagnostics" },
	{ "<leader>S", group = "sessions" },
})
