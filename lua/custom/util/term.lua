local M = {}

M.termbuf = nil
M.termwin = nil

function M.toggle()
	if M.termbuf and vim.api.nvim_buf_is_valid(M.termbuf) then
		if M.termwin and vim.api.nvim_win_is_valid(M.termwin) then
			vim.api.nvim_win_close(M.termwin, true)
			M.termwin = nil
			return
		end

		vim.cmd("split")

		M.termwin = vim.api.nvim_get_current_win()
		if vim.api.nvim_win_get_height(M.termwin) > 15 then
			vim.api.nvim_win_set_height(M.termwin, 15)
		end
		vim.api.nvim_win_set_buf(M.termwin, M.termbuf)
		vim.cmd("startinsert")
		return
	end

	vim.cmd("split | term")
	M.termwin = vim.api.nvim_get_current_win()
	M.termbuf = vim.api.nvim_get_current_buf()
	vim.bo[M.termbuf].bufhidden = "hide"
	vim.bo[M.termbuf].buflisted = false
	vim.cmd("startinsert")
end

return M
