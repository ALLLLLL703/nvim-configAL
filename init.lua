vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.foldlevelstart = 99
if not vim.g.vscode then
	require("plugins")
	require("custom")
	require("keymaps")
	require("keymaps.editor.tabs")
	require("options")
else
	require("custom")
	require("options")
end
