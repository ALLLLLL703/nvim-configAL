local mmm = vim.keymap.set
mmm("n", "<leader>ed", function()
	vim.ui.input({
		prompt = "Enter directory path:",
		default = "cd ~",
	}, function(input)
		vim.cmd(input)
	end)
end)
local function map(map, cmd, des)
	vim.keymap.set("n", map, cmd, { desc = des, silent = true })
end
