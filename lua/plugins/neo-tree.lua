return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        group_empty_dirs = true, -- 展平空目录
        nesting_rules = {
          -- 合并特定路径（如 src/com/example）
          ["src"] = { pattern = "^src/(.+)/(.+)$", replace = "src.$1.$2" },
          -- 可添加其他规则，如 test 目录
        },
      },
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
    },
  },
}
