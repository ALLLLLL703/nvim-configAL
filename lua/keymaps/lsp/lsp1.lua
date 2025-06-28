local map = vim.keymap.set
map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code action" })
map(
	{ "n", "v" },
	"<leader>cA",
	"<cmd>Lspsaga show_workspace_diagnostics<CR>",
	{ desc = "diagnostics list of workplace" }
)
map({ "n", "v" }, "<leader>cF", "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "diagnostics list of file" })

-- dashboard.button("f", "📁 Find file", ":Telescope find_files <CR>"),
-- dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
-- -- dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
-- dashboard.button("t", "߷  Find text", ":Telescope live_grep <CR>"),
-- dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.vim<CR>"),
-- dashboard.button("q", "࿕ Quit Neovim", ":qa<CR>"),
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "📁 Find file" })
map("n", "<leader>fn", ":ene <BAR> startinsert <CR>", { desc = "  New file" })
map("n", "<leader>cf", ":lua require('conform').format()<CR>", { desc = "Format file", silent = true })

map("n", "<leader>cr", "<cmd>Lspsaga rename<CR>", { desc = "rename" })
