return {
  {

    "HiPhish/rainbow-delimiters.nvim",
    -- 确保你已经安装了 nvim-treesitter
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      -- 默认配置，可以根据需要进行调整
      require("rainbow-delimiters.setup").setup({
        -- 示例配置
        strategy = {
          [""] = "rainbow-delimiters.strategy.global", -- 全局高亮
          vim = "rainbow-delimiters.strategy.local", -- VimScript 文件只高亮局部
        },
        query = {
          [""] = "rainbow-delimiters", -- 默认查询，通常用于括号
          lua = "rainbow-blocks", -- Lua 文件可能匹配 begin/end 块
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterGreen",
          "RainbowDelimiterCyan",
          "RainbowDelimiterMagenta",
          "RainbowDelimiterViolet",
        },
      })
    end,
  },
}
