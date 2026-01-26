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

-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	pattern = "*.class",
-- 	callback = function()
-- 		if vim.bo.filetype == "class" then
-- 			vim.cmd("setfiletype java")
-- 		end
-- 	end,
-- })

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.mcfunction",
	callback = function()
		vim.cmd("setfiletype mcfunction")
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	desc = "auto chmod +x when observe shebang",
	callback = function(args)
		local file = args.file
		if file == "" then
			return
		end

		local fisrt_line = vim.fn.getline(1)
		if not vim.startswith(fisrt_line, "#!") then
			return
		end

		if vim.fn.executable(file) == 1 then
			return
		end

		vim.fn.system({ "chmod", "+x", file })
		vim.notify("Set +x permission to " .. file, vim.log.levels.INFO)
	end,
})
