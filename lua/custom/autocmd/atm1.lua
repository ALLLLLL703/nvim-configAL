vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*',
	callback = function()
		vim.lsp.buf.format()
	end
})
local fw = true
vim.keymap.set('n', '<leader>td', function()
	if fw then
		fw = false
		print('Diagnostic float disabled')
	else
		fw = true
		print('Diagnostic float enabled')
	end
end, { desc = 'toggle diagnostic float' })
vim.api.nvim_create_autocmd('CursorHold', {
	pattern = '*',
	callback = function()
		if fw then
			vim.diagnostic.open_float(nil, { focus = false, border = 'rounded' })
		end
	end
})
