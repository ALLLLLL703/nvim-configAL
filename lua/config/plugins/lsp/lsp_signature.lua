local cfg = {
	max_height = 12, -- max height of signature floating_window, include borders
	max_width = function()
		return vim.api.nvim_win_get_width(0) * 0.8
	end,
}
require("lsp_signature").setup(cfg)
vim.keymap.set({ "n" }, "<C-p>", function()
	require("lsp_signature").toggle_float_win()
end, { silent = true, noremap = true, desc = "toggle signature" })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc")
vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga peek_definition<CR>", { desc = "peek_defination", silent = true })
