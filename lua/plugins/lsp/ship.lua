return {
  {
    "L3MON4D3/LuaSnip",
    event = "lazy",
    dependencies = {
      "saadparwaiz1/cmp_luasnip", -- 与 nvim-cmp 集成
      "rafamadriz/friendly-snippets", -- 预定义代码片段
    },
    config = function()
      local luasnip = require("luasnip")
      local types = require("luasnip.util.types")

      -- 加载 friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- 配置 LuaSnip
      luasnip.config.set_config({
        history = true, -- 保留片段历史
        update_events = "TextChanged,TextChangedI", -- 动态更新片段
        enable_autosnippets = true, -- 自动触发片段
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { "← Choice", "Comment" } },
            },
          },
        },
      })

      -- 快捷键
      vim.keymap.set({ "i", "s" }, "<Tab>", function()
        if luasnip.expand_or_jumpable() then
          return luasnip.expand_or_jump()
        end
        return "<Tab>"
      end, { expr = true, silent = true })

      vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        if luasnip.jumpable(-1) then
          return luasnip.jump(-1)
        end
        return "<S-Tab>"
      end, { expr = true, silent = true })

      vim.keymap.set("i", "<C-E>", function()
        if luasnip.choice_active() then
          return luasnip.change_choice(1)
        end
        return "<C-E>"
      end, { silent = true })

      -- 自定义片段示例
      luasnip.add_snippets("cpp", {
        luasnip.snippet("fori", {
          luasnip.text_node("for (int "),
          luasnip.insert_node(1, "i = 0"),
          luasnip.text_node("; "),
          luasnip.insert_node(2, "i < 10"),
          luasnip.text_node("; "),
          luasnip.insert_node(3, "i++"),
          luasnip.text_node(") {"),
          luasnip.text_node({ "", "\t" }),
          luasnip.insert_node(0), -- 光标最终位置
          luasnip.text_node({ "", "}" }),
        }),
      })
    end,
  },
}
