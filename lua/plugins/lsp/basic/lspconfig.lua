-- ======================================
--     lua/plugins/lsp/lspconfig.lua
--       (neovim/nvim-lspconfig Plugin)
-- ======================================
-- 插件仓库: https://github.com/neovim/nvim-lspconfig
-- 文档链接: https://github.com/neovim/nvim-lspconfig/blob/master/doc/lspconfig.txt
-- 支持的 LSP 服务器列表: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
return{
	{
  'junnplus/lsp-setup.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'mason-org/mason.nvim', -- optional
    'mason-org/mason-lspconfig.nvim', -- optional
  },
  ---@type LspSetup.Options
  opts = {
    servers = {
      pylsp = {},
      clangd = {}
    }
  }
}
}
