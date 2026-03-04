vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "gr", function()
	vim.fn.VSCodeNotify("editor.action.goToReferences")
end, opts)

map("n", "<leader>ca", function()
	vim.fn.VSCodeNotify("editor.action.codeAction")
end, opts)
