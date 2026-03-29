-- ==============================
--      lua/plugins/init.lua
--     Plugin Manager Setup
-- ==============================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- 定义插件列表
local plugins = {
	require("plugins.editor.treesitter"),
	require("plugins.editor.ufo"),
	require("plugins.editor.copilot"),
	require("plugins.ui.nvim-tree"),
	require("plugins.ui.theme.tokyonight"),
	require("plugins.ui.lualine"),
	require("plugins.lsp.basic.mason"),
	require("plugins.lsp.basic.lspconfig"),
	require("plugins.lsp.basic.cmp"),
	require("plugins.lsp.basic.lspsaga"),
	require("plugins.ui.telescope"),
	require("plugins.ui.whichkey"),
	require("plugins.ui.git"),
	require("plugins.dap.dap"),
	require("plugins.lsp.basic.diag"),
	require("plugins.lsp.basic.cmp"),
	require("plugins.editor.hardtime"),
	require("plugins.editor.task"),
	require("plugins.editor.undo"),
	require("plugins.editor.avante"),
	require("plugins.editor.reflactoring"),
	require("plugins.ui.html_preview"),
	require("plugins.editor.leetcode"),
	require("plugins.ui.icon"),
	require("plugins.lsp.basic.lint"),
	require("plugins.custom.mc"),
	require("plugins.lsp.basic.neodev"),
	require("plugins.editor.run"),
	require("plugins.editor.leap"),
	require("plugins.editor.todo"),
	require("plugins.editor.mpv"),
	require("plugins.lsp.basic.csharp"),
	require("plugins.editor.annotation"),
	require("plugins.custom.study"),
	require("plugins.lsp.basic.cmake"),
	require("plugins.editor.maven"),
	require("plugins.editor.codesnap"),
}

require("lazy").setup(plugins, {
	ui = {
		border = "rounded",
	},
	-- debug = true, -- 如果需要调试，可以取消注释
})
