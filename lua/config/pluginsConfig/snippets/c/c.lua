-- ======================================
--  ~/.config/nvim/lua/snippets/c/my_c_snippets.lua
--   (C 语言自定义 LuaSnip 片段)
-- ======================================
-- 引入 LuaSnip 模块的常用缩写
local ls = require("luasnip")
local s = ls.snippet -- 定义一个片段 (snippet)
local t = ls.text_node -- 定义纯文本节点
local i = ls.insert_node -- 定义插入节点 (跳转点)
local d = ls.dynamic_node -- 定义动态节点 (内容根据其他节点动态生成)
local r = ls.restore_node -- 恢复节点 (如果内容被修改，可以恢复)
local c = ls.choice_node -- 定义选择节点 (在多个选项中选择)
local f = ls.function_node -- 定义函数节点 (执行 Lua 函数生成内容)
local sn = ls.snippet_node -- 嵌套片段节点
local dl = ls.delimiters -- 定义片段分隔符，默认为 {}

-- 定义一个包含 C 语言片段的表格。
-- 重要的是要将片段添加到 `ls.add_snippets()` 函数中，并指定文件类型。
ls.add_snippets("c", {
  -- ==============================
  -- 片段示例 1: `fori` - 整数循环
  -- ==============================
  s({ trig = "fori", dscr = "Integer for loop" }, {
    t("for (int "),
    i(1, "i"), -- 插入节点 1 (光标会首先跳到这里)
    t(" = 0; "),
    r(1), -- 恢复节点 1 (与插入节点 1 关联，如果修改了 i，这里也会更新)
    t(" < "),
    i(2, "count"), -- 插入节点 2
    t("; "),
    r(1),
    t("++) {"),
    t({ "", "\t" }), -- 换行并缩进
    i(0), -- 最终光标停留点
    t({ "", "}" }),
  }),

  -- ==============================
  -- 片段示例 2: `incl` - include guard
  -- ==============================
  s({ trig = "incl", dscr = "Include guard" }, {
    t("#ifndef "),
    f(function()
      return string.upper(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t:r")) .. "_H"
    end, {}),
    t({ "", "#define " }),
    f(function()
      return string.upper(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t:r")) .. "_H"
    end, {}),
    t({ "", "" }),
    i(0), -- 最终光标停留点
    t({ "", "#endif // " }),
    f(function()
      return string.upper(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t:r")) .. "_H"
    end, {}),
    t(""),
  }),

  -- ==============================
  -- 片段示例 3: `sw` - switch 语句
  -- ==============================
  s({ trig = "sw", dscr = "Switch statement" }, {
    t("switch ("),
    i(1, "variable"),
    t(") {"),
    t({ "", "\tcase " }),
    i(2, "value"),
    t(":\n\t\t"),
    i(3),
    t({ "", "\t\tbreak;" }),
    t({ "", "\tdefault:\n\t\t" }),
    i(4),
    t({ "", "\t\tbreak;" }),
    t({ "", "}" }),
    i(0), -- 最终光标停留点
  }),

  -- ==============================
  -- 片段示例 4: `ptr` - 指针定义 (带 choice)
  -- ==============================
  s({ trig = "ptr", dscr = "Pointer definition" }, {
    i(1, "type"),
    t(" *"),
    i(2, "name"),
    t(" = "),
    c(3, {
      t("NULL"), -- 选项 1
      t("malloc(sizeof("),
      i(4, "type"),
      t("))"), -- 选项 2，嵌套插入节点
    }),
    t(";"),
    i(0),
  }),
})
