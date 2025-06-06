return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    "nvim-neorg/neorg",
    lazy = false, -- 确保 Neorg 立即加载
    version = "*", -- 使用最新稳定版本
  },
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
  },
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   dependencies = { "kevinhwang91/promise-async" },
  --   event = "BufReadPost", -- 延迟加载
  --   config = function()
  --     -- 基本折叠设置
  --     vim.o.foldcolumn = "1" -- 显示折叠列
  --     vim.o.foldlevel = 99 -- 默认展开所有折叠
  --     vim.o.foldlevelstart = 99
  --     vim.o.foldenable = true
  --
  --     -- 自定义快捷键
  --     vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
  --     vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
  --     vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Open folds except kinds" })
  --     vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, { desc = "Close folds with level" })
  --     vim.keymap.set("n", "K", function()
  --       local winid = require("ufo").peekFoldedLinesUnderCursor()
  --       if not winid then
  --         vim.lsp.buf.hover() -- 回退到 LSP 悬浮窗
  --       end
  --     end, { desc = "Preview fold or LSP hover" })
  --
  --     -- 配置 nvim-ufo
  --     require("ufo").setup({
  --       provider_selector = function(_, filetype, _)
  --         -- 优先使用 LSP， fallback 到 TreeSitter 和 indent
  --         return { "lsp", "treesitter", "indent" }
  --       end,
  --       preview = {
  --         win_config = {
  --           border = "rounded",
  --           winhighlight = "Normal:Normal",
  --           winblend = 0,
  --         },
  --         mappings = {
  --           scrollU = "<C-u>",
  --           scrollD = "<C-d>",
  --         },
  --       },
  --       -- 排除特定文件类型（如 Neorg 的某些缓冲区）
  --       filetype_exclude = { "help", "dashboard", "neo-tree", "Trouble", "lazy" },
  --     })
  --
  --     -- 自动禁用特定文件类型的折叠
  --     vim.api.nvim_create_autocmd("FileType", {
  --       group = vim.api.nvim_create_augroup("local_detach_ufo", { clear = true }),
  --       pattern = { "help", "dashboard", "neo-tree", "Trouble", "lazy" },
  --       callback = function()
  --         require("ufo").detach()
  --       end,
  --     })
  --   end,
  -- },
}
