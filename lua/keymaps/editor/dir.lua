local map = vim.keymap.set
map("n", "<leader>ed", function()
	vim.ui.input({
		prompt = "Enter directory path:",
		default = "cd ~",
	}, function(input)
		vim.cmd(input)
	end)
end)
