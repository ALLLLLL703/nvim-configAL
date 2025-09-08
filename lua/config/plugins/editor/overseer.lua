local opt = {
	silent = true,
}
vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<cr>", { silent = true, desc = "run overseer" })
vim.keymap.set("n", "<leader>ot", "<cmd>OverseerToggle<cr>", { silent = true, desc = "toggle overseer" })
vim.keymap.set("n", "<leader>ob", "<cmd>OverseerBuild<cr>", { silent = true, desc = "build overseer" })
