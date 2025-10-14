-- **新增: nvim-tree 键位映射**
-- `<leader>e`: 切换 nvim-tree 文件树的显示/隐藏。
-- `:NvimTreeToggle`: 这是 nvim-tree.lua 插件提供的命令。
local map = vim.keymap.set

--sth
function key(keys, cmd, des)
	vim.keymap.set("n", keys, cmd, { desc = des, silent = true })
end

map({ "t", "n", "i" }, "<A-x>", "<cmd>Lspsaga term_toggle<CR>", { desc = "float term" })
map("n", "<leader>uC", "<cmd>Themery<CR>", { desc = "change theme" })
map("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "lazyvim" })
-- Show hydra mode for changing windows
map({ "n", "i", "v" }, "<c-s>", "<cmd>w!<CR>", { desc = "save file", silent = true })
--vim.keymap.del('n','<leader>e')
map({ "n", "v" }, "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "explorer" })
map({ "n", "v" }, "H", "<cmd>BufferLineCyclePrev<CR>", { desc = "buffer to prev" })
map({ "n", "v" }, "L", "<cmd>BufferLineCycleNext<CR>", { desc = "buffer to next" })
map({ "n", "v" }, "<leader>bd", function()
	vim.cmd("normal! H")
	vim.cmd("bw!")
end, { desc = "delete current(unsave)" })
--buffer lines keymap
map({ "n", "v" }, "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { desc = "delete others" })
map({ "n", "v" }, "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", { desc = "delete left" })
map({ "n", "v" }, "<leader>br", "<cmd>BufferLineCloseRight<CR>", { desc = "delete right" })
map({ "n", "v" }, "<leader>bg", "<cmd>BufferLineGroupToggle<CR>", { desc = "group init" })
map({ "n", "v" }, "<leader>bs", "<cmd>BufferLinePick<CR>", { desc = "buffer select" })
map({ "n", "v" }, "<leader>bS", "<cmd>BufferLinePickClose<CR>", { desc = "buffer select close" })
--sth
map("n", "<leader>cm", "<cmd>Mason<CR>", { desc = "Mason" })
map("n", "<leader>na", "<cmd>NoiceAll<cr>", { desc = "noice" })
local iswrap = true
local function toggle_wrap(iswrap)
	if iswrap then
		vim.cmd("set nowrap")
		iswrap = false
	else
		vim.cmd("set wrap")
		iswrap = true
	end
end
key("<leader>uw", toggle_wrap, "toggle wrap")
