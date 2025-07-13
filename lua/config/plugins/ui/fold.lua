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
vim.o.foldmethod = "expr"
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Source: https://www.reddit.com/r/neovim/comments/1fzn1zt/custom_fold_text_function_with_treesitter_syntax/
local function fold_virt_text(result, start_text, lnum)
	local text = ""
	local hl
	for i = 1, #start_text do
		local char = start_text:sub(i, i)
		local captured_highlights = vim.treesitter.get_captures_at_pos(0, lnum, i - 1)
		local outmost_highlight = captured_highlights[#captured_highlights]
		if outmost_highlight then
			local new_hl = "@" .. outmost_highlight.capture
			if new_hl ~= hl then
				-- as soon as new hl appears, push substring with current hl to table
				table.insert(result, { text, hl })
				text = ""
				hl = nil
			end
			text = text .. char
			hl = new_hl
		else
			text = text .. char
		end
	end
	table.insert(result, { text, hl })
end
function _G.custom_foldtext()
	local start_text = vim.fn.getline(vim.v.foldstart):gsub("\t", string.rep(" ", vim.o.tabstop))
	local nline = vim.v.foldend - vim.v.foldstart
	local result = {}
	fold_virt_text(result, start_text, vim.v.foldstart - 1)
	table.insert(result, { " ", nil })
	table.insert(result, { "", "@comment.warning.gitcommit" })
	table.insert(result, { "↙ " .. nline .. " lines", "@comment.warning" })
	table.insert(result, { "", "@comment.warning.gitcommit" })
	return result
end
vim.o.foldtext = "v:lua.custom_foldtext()"
