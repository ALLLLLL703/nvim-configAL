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
-- **重要**: 这里我们将 nvim-tree.lua 插件的配置添加到列表中。
local plugins = {
  -- 调用 lua/plugins/ui/nvim-tree.lua 文件中定义的插件配置
  require("plugins.editor.treesitter"),
  require("plugins.editor.ufo"),
  require("plugins.editor.copilot"),
  require("plugins.ui.nvim-tree"),
  require('plugins.ui.theme.tokyonight'),
  require('plugins.ui.lualine'),
  require('plugins.lsp.basic.mason'),
  require('plugins.lsp.basic.lspconfig'),
  require('plugins.lsp.basic.cmp'),
  require('plugins.lsp.basic.lspsaga'),
  require('plugins.ui.telescope'),
  require('plugins.ui.whichkey'),

  require('plugins.lsp.basic.diag'),
  require('plugins.lsp.basic.cmp'),
  



}

require("lazy").setup(plugins, {
  ui = {
    border = "rounded",
  },
  -- debug = true, -- 如果需要调试，可以取消注释
})

