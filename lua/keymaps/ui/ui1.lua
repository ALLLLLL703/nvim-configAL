-- **新增: nvim-tree 键位映射**
-- `<leader>e`: 切换 nvim-tree 文件树的显示/隐藏。
-- `:NvimTreeToggle`: 这是 nvim-tree.lua 插件提供的命令。
local map = vim.keymap.set
-- map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle NvimTree" })

-- 如果你想在 Neovim 启动时自动打开 nvim-tree，可以添加以下映射：
-- 这会在 Neovim 启动时（VimEnter）自动调用 :NvimTreeOpen 命令。
-- 你需要确保 nvim-tree 的配置中 `event` 设置为 `VimEnter` 或更早的事件。
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     vim.cmd("NvimTreeOpen")
--   end
-- })
map({ 't', 'n', 'i' }, '<A-x>', '<cmd>Lspsaga term_toggle<CR>', { desc = 'float term' })
map('n', '<leader>uC', '<cmd>Telescope colorscheme<CR>', { desc = 'change theme' })
map('n', '<leader>ll', '<cmd>Lazy<CR>', { desc = 'lazyvim' })
-- Show hydra mode for changing windows
map({ 'n', 'i', 'v' }, '<c-s>', ':w<CR>', { desc = 'save file' })
--vim.keymap.del('n','<leader>e')
map({'n','v'}, '<leader>E', '<cmd>Neotree toggle<CR>', {desc = 'explorer'})
map({'n','v'}, 'H', '<cmd>BufferLineCyclePrev<CR>', {desc = 'buffer to prev'})
map({'n','v'}, 'L', '<cmd>BufferLineCycleNext<CR>', {desc = 'buffer to next'})
map({'n','v'}, '<leader>bd', function ()
	vim.cmd('normal! H')
	vim.cmd('bw')
end, {desc = 'delete current(unsave)'})
map({'n','v'}, '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', {desc = 'delete others'})
map({'n','v'}, '<leader>bl', '<cmd>BufferLineCloseLeft<CR>', {desc = 'delete left'})
map({'n','v'}, '<leader>br', '<cmd>BufferLineCloseRight<CR>', {desc = 'delete right'})
map({'n','v'}, '<leader>bg', '<cmd>BufferLineGroupToggle<CR>', {desc = 'group init'})
map('n', '<leader>cm','<cmd>Mason<CR>',{desc = 'Mason'})
