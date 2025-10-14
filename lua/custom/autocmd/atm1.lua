local fw = false
vim.keymap.set("n", "<leader>td", function()
	if fw then
		fw = false
		print("Diagnostic float disabled")
	else
		fw = true
		print("Diagnostic float enabled")
	end
end, { desc = "toggle diagnostic float" })
vim.api.nvim_create_autocmd("CursorHold", {
	pattern = "*",
	callback = function()
		if fw then
			vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
		end
	end,
})
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.zsh",
	callback = function()
		if vim.bo.filetype == "zsh" then
			vim.bo.filetype = "sh"
		end
	end,
})
