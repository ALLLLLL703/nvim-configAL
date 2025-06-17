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
		config = function()
			require('neo-tree').setup({
				window = {
					mappings = {
						['e'] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
						['b'] = function() vim.api.nvim_exec('Neotree focus buffers left', true) end,
						['g'] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
					},
				},
				filesystem = {
					window = {
						mappings = {
							["I"] = "run_command",
						},
					},
				},
				commands = {
					run_command = function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						vim.api.nvim_input(": " .. path .. "<Home>")
					end,
				},
			})
			-- bufferlint.nvim
		end,
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
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		event = "VeryLazy",
		keys = {
			{ "<Tab>",   "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		},
		config = function()
			require('bufferline').setup()
		end,

		opts = {
			options = {
				mode = "tabs",
				-- separator_style = "slant",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		},
	},
	---@type LazySpec
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		dependencies = {
			-- check the installation instructions at
			-- https://github.com/folke/snacks.nvim
			"folke/snacks.nvim"
		},
		keys = require('keymaps.ui.explorer'),
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
	},
	{
		'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		event = 'VeryLazy',
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		keys = {
			{
				'-',
				mode = { 'n', 'v' },
				':Oil<CR>',
				desc = 'Open Oil',
			}
		}
	}
}
