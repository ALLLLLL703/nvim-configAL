vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.zsh",
	callback = function()
		if vim.bo.filetype == "zsh" then
			vim.bo.filetype = "sh"
		end
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "class" then
			vim.cmd("TSBufEnable highlight")
		end
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.mcfunction",
	callback = function()
		vim.cmd("setfiletype mcfunction")
	end,
})
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*xaml",
	callback = function()
		vim.cmd("setfiletype xml")
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.axaml" },
	callback = function(event)
		vim.lsp.start({
			name = "avalonia",
			cmd = { "avalonia-ls" },
			root_dir = vim.fn.getcwd(),
		})
	end,
})
vim.filetype.add({
	extension = {
		axaml = "xml",
	},
})
