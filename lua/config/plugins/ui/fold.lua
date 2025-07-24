local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
require("ufo").setup()
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
local function toggel_fold_level_all(level)
	local cur = vim.o.foldlevel
	if cur >= level then
		vim.o.foldlevel = level - 1
	else
		vim.o.foldlevel = 99
	end
	vim.notify("toggel fold under the level" .. vim.o.foldlevel)
end
-- vim.api.nvim_create_user_command('ToggleFoldsBelows', function(opts)
-- 	local level = tonumber(opts.args)
-- 	if level and level > 0 then
-- 		toggel_fold_level_all(level)
-- 	else
-- 		vim.notify('invalid options:\t' .. opts.args, vim.log.levels.ERROR)
-- 	end
-- end, { nargs = 1, desc = "Toggle folds below specified level" })
vim.keymap.set("n", "zu", function()
	vim.ui.input({
		prompt = "enter fold levels:",
		default = "2",
	}, function(input)
		local level = tonumber(input)
		if level and level > 0 then
			toggel_fold_level_all(level)
		else
			vim.notify("invalid options:\t" .. input, vim.log.levels.ERROR)
		end
	end)
end, { desc = "folds blow the level" })
vim.cmd("set foldlevel=99")
vim.keymap.set({ "n", "v" }, "zg", function()
	vim.o.foldlevel = 99
end, { desc = "level reset" })
