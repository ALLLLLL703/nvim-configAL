return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- 首次安装后运行 :TSUpdate 更新parser

    -- 确保 textobjects 是 nvim-treesitter 的一个依赖或子模块
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },

    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
        },
        indent = { enable = true }, -- 推荐启用自动缩进

        -- *** 配置 textobjects 模块 ***
        textobjects = {
          select = {
            enable = true,
            -- 这些键映射是 `select` 模式下的，通常与 `v`, `V`, `gv` 等操作符配合使用
            -- 例如 `vac` 会选择整个函数调用
            lookahead = true, -- 有助于在光标位于括号内时正确选择整个结构
            keymaps = {
              -- `at` 和 `it` 是核心文本对象，分别表示 "around" 和 "inner"
              -- 这是最常用的默认映射，强烈推荐保留
              ["aa"] = "@parameter.outer", -- "around argument": 选择函数参数，包括逗号和空格
              ["ia"] = "@parameter.inner", -- "inner argument": 只选择函数参数内容
              ["af"] = "@function.outer", -- "around function": 选择整个函数定义
              ["if"] = "@function.inner", -- "inner function": 只选择函数体
              ["ac"] = "@class.outer", -- "around class": 选择整个类定义
              ["ic"] = "@class.inner", -- "inner class": 只选择类体
              ["a="] = "@assignment.outer", -- "around assignment": 选择整个赋值语句
              ["i="] = "@assignment.inner", -- "inner assignment": 只选择赋值语句的值
              ["al"] = "@loop.outer", -- "around loop": 选择整个循环结构
              ["il"] = "@loop.inner", -- "inner loop": 只选择循环体
              ["ad"] = "@conditional.outer", -- "around conditional": 选择整个条件语句 (if/else)
              ["id"] = "@conditional.inner", -- "inner conditional": 只选择条件语句体
              ["ao"] = "@call.outer", -- "around call": 选择整个函数调用（包括函数名和括号）
              ["io"] = "@call.inner", -- "inner call": 只选择函数调用的参数列表
              ["as"] = "@statement.outer", -- "around statement": 选择整个语句（以分号或换行符结束）
              ["is"] = "@statement.inner", -- "inner statement": 只选择语句内容
              -- 你可以添加更多，例如 for 循环的 body, if 条件的条件部分等
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- 移动时设置跳转列表
            -- 这些键映射是 `move` 模式下的，用于光标移动到下一个/上一个特定文本对象
            -- 例如 `]`f 会移动到下一个函数定义
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = "@class.outer",
              ["]l"] = "@loop.outer",
            },
            goto_next_end = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
              ["[l"] = "@loop.outer",
            },
            goto_previous_start = {
              ["[[f"] = "@function.outer",
              ["[[c"] = "@class.outer",
              ["[[l"] = "@loop.outer",
            },
            goto_previous_end = {
              ["][f"] = "@function.outer",
              ["][c"] = "@class.outer",
              ["][l"] = "@loop.outer",
            },
          },
        },
        -- ... 其他 treesitter 配置
      })
    end,
  },
}
