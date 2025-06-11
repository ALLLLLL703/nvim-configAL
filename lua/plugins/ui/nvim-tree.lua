--- ======================================
--     lua/plugins/ui/neo-tree.lua
--       (neo-tree.nvim Plugin)
-- ======================================
-- 插件仓库: https://github.com/nvim-neo-tree/neo-tree.nvim
-- 文档链接: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/doc/neo-tree.txt

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      -- fill any relevant options here
    },
	keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            source = "buffers",
            position = "left",
          })
        end,
        desc = "Buffers (root dir)",
      },
    },
  }
}
