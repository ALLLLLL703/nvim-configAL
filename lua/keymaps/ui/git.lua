local function map(map, cmd, des)
	vim.keymap.set("n", map, cmd, { desc = des, silent = true })
end
map("<leader>ga", "<cmd>Gitsigns blame<cr>", "toggle  blame")
map("<leader>gh", "<cmd>Gitsigns preview_hunk<cr>", "hunk")
map("<leader>gi", "<cmd>Gitsigns preview_hunk_inline<cr>", "inline hunk")
