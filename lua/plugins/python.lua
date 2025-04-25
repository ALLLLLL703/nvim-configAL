return {
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp", -- 推荐使用 regexp 分支，修复 bug
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python", -- 可选，调试支持
    },
    ft = { "python" }, -- 仅 Python 文件加载
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<CR>", desc = "Select Virtual Env" },
    },
    opts = {
      search = true, -- 搜索所有 venv
      parents = 2, -- 向上搜索 2 级父目录
      auto_refresh = true, -- 自动刷新 venv 列表
      lsp_servers = { "pyright", "basedpyright" }, -- 支持 LSP
    },
  },
}
