return {
  -- nvim-cmp 自动补全框架
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- 在进入插入模式时加载
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP 补全源
      "hrsh7th/cmp-buffer", -- 缓冲区单词补全
      "hrsh7th/cmp-path", -- 文件路径补全
      "saadparwaiz1/cmp_luasnip", -- LuaSnip 补全源 (非常重要!)
      "L3MON4D3/LuaSnip", -- LuaSnip 核心插件
      "rafamadriz/friendly-snippets", -- 常用代码片段集合 (推荐!)
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- 加载 friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- 手动触发补全
          ["<C-e>"] = cmp.mapping.abort(), -- 取消补全
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- 确认选择的补全项

          -- Tab 和 Shift+Tab 用于在补全菜单中选择和在片段占位符之间跳转
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }), -- 'i' 插入模式, 's' 选择模式

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- LSP 补全
          { name = "luasnip" }, -- Snippet 补全 (来自 LuaSnip) { name = "buffer" }, -- 当前缓冲区单词补全 { name = "path" }, -- 文件路径补全
        }),
        -- ... 其他 cmp 配置 (可选)
      })
    end,
  },
  {

    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp", -- 确保这个构建命令在某些系统上运行
    -- 或者只是确保它没有明确阻止构建
  },
}
