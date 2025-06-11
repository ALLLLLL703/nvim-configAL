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
