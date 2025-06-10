return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui", -- 调试 UI
      "theHamsta/nvim-dap-virtual-text", -- 内联变量
      "nvim-neotest/nvim-nio", -- DAP UI 依赖
      "mfussenegger/nvim-dap-python", -- Python 调试
    },
  },
  {
    "CRAG666/code_runner.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      require("code_runner").setup({
        filetype = {
          c = {
            "cd $dir &&",
            "gcc $fileName -o $fileNameWithoutExt &&",
            "./$fileNameWithoutExt",
          },
          cpp = {
            "cd $dir &&",
            "g++ $fileName -o $fileNameWithoutExt &&",
            "./$fileNameWithoutExt",
          },
        },
        mode = "term", -- 在终端运行
        term = {
          position = "bot", -- 底部终端
          size = 10, -- 终端高度
        },
      })

      -- 快捷键
    end,
  },
}
