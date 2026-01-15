local cfg = {
	floating_window = false,
}
require("lsp_signature").setup(cfg)
-- vim.keymap.set({ "n", "i" }, "<C-a>", function()
-- 	require("lsp_signature").toggle_float_win()
-- end, { silent = true, noremap = true, desc = "toggle signature" })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>")
vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga peek_definition<CR>", { desc = "peek_defination", silent = true })
