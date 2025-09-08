-- ==============================
--    lua/keymaps/init.lua
--     Keymaps Entry
-- ==============================

-- 引入全局键位映射
-- 引入插件相关的键位映射 (如果插件有大量键位需要在此统一管理)
-- 引入插件相关的键位映射 (如果插件有大量键位需要在此统一管理)

-- 引入插件相关的键位映射 (如果插件有大量键位需要在此统一管理)
vim.keymap.set("n", "<leader>I", function()
	vim.cmd("so ~/.config/nvim/lua/config/plugins/ui/lualine.lua")

	require("pretty-fold").setup()
end, { desc = "init nvim", silent = true })
