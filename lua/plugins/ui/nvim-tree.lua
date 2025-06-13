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
  },
{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons',
	event = "VeryLazy",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		},
		opts = {
			options = {
				mode = "tabs",
				-- separator_style = "slant",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		},},
		---@type LazySpec
		{
			"mikavilpas/yazi.nvim",
			event = "VeryLazy",
			dependencies = {
				-- check the installation instructions at
				-- https://github.com/folke/snacks.nvim
				"folke/snacks.nvim"
			},
			keys = {
				-- 👇 in this section, choose your own keymappings!
				{
					"<leader>-",
					mode = { "n", "v" },
					"<cmd>Yazi<cr>",
					desc = "Open yazi at the current file",
				},
				{
					-- Open in the current working directory
					"<leader>cw",
					"<cmd>Yazi cwd<cr>",
					desc = "Open the file manager in nvim's working directory",
				},
				{
					"<c-up>",
					"<cmd>Yazi toggle<cr>",
					desc = "Resume the last yazi session",
				},
			},
			---@type YaziConfig | {}
			opts = {
				-- if you want to open yazi instead of netrw, see below for more info
				open_for_directories = false,
				keymaps = {
					show_help = "<f1>",
				},
			},
			-- 👇 if you use `open_for_directories=true`, this is recommended
			init = function()
				-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
				-- vim.g.loaded_netrw = 1
				vim.g.loaded_netrwPlugin = 1
			end,
		}
}
