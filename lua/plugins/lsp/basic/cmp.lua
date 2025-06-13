return{
	{
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
    -- cmp 的依赖插件，它们提供了不同的补全源和片段功能
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- LSP 补全源 (从 LSP 服务器获取建议)
      "hrsh7th/cmp-buffer",       -- 缓冲区单词补全 (从当前缓冲区已有的单词中获取)
      "hrsh7th/cmp-path",         -- 文件路径补全 (补全文件系统路径)
      "saadparwaiz1/cmp_luasnip", -- LuaSnip 补全源 (将 LuaSnip 片段集成到 cmp 菜单)
      "L3MON4D3/LuaSnip",         -- LuaSnip 核心插件 (代码片段引擎)
      "rafamadriz/friendly-snippets", -- 常用代码片段集合 (为 LuaSnip 提供大量开箱即用片段)
      "hrsh7th/cmp-cmdline",      -- 命令行模式补全 (例如在 : 模式下补全命令或文件名)
      "hrsh7th/cmp-calc",         -- 计算器补全 (在代码中直接进行简单的数学计算并补全结果)
      -- 你可能还需要这些，如果你想补全 Neovim Lua API 或 VSCode/LSP 特定功能
			'hrsh7th/cmp-emoji',
      "hrsh7th/cmp-nvim-lua",     -- Neovim Lua API 补全
    },
	},
	{
		'hrsh7th/cmp-nvim-lsp',
	},
	{
		'echasnovski/mini.nvim',
	},
	{
		'L3MON4D3/LuaSnip',	
	},

}
