require("blink.cmp").setup({

	cmdline = {
		keymap = {
			preset = "none",
			["<Tab>"] = { "show_and_insert", "select_next" },
			["<S-Tab>"] = { "show_and_insert", "select_prev" },

			["<C-space>"] = { "show", "fallback" },

			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<Right>"] = { "select_next", "fallback" },
			["<Left>"] = { "select_prev", "fallback" },

			["<C-o>"] = { "select_and_accept" },
			["<C-e>"] = { "cancel" },
		},
		completion = { menu = { auto_show = true } },
	},

	keymap = {
		preset = "none",
		["<C-t>"] = { "show", "show_documentation", "hide_documentation" },
		-- ['<C-e>'] = { 'hide' },
		-- fallback命令将运行下一个非闪烁键盘映射(回车键的默认换行等操作需要)
		["<C-e>"] = { "hide", "fallback" },
		["<CR>"] = { "accept", "fallback" }, -- 更改成'select_and_accept'会选择第一项插入
		["<C-p>"] = { "select_prev", "snippet_backward", "fallback" },
		["<C-n>"] = { "select_next", "snippet_forward", "fallback" }, -- 同时存在补全列表和snippet时，补全列表选择优先级更高

		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },
		["<C-x>"] = { "cancel" },
		["<Tab>"] = { "snippet_forward", "select_next", "fallback" }, -- 同时存在补全列表和snippet时，snippet跳转优先级更高
		["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
		["<A-1>"] = {
			function(cmp)
				cmp.accept({ index = 1 })
			end,
		},
		["<A-2>"] = {
			function(cmp)
				cmp.accept({ index = 2 })
			end,
		},
		["<A-3>"] = {
			function(cmp)
				cmp.accept({ index = 3 })
			end,
		},
		["<A-4>"] = {
			function(cmp)
				cmp.accept({ index = 4 })
			end,
		},
		["<A-5>"] = {
			function(cmp)
				cmp.accept({ index = 5 })
			end,
		},
		["<A-6>"] = {
			function(cmp)
				cmp.accept({ index = 6 })
			end,
		},
		["<A-7>"] = {
			function(cmp)
				cmp.accept({ index = 7 })
			end,
		},
		["<A-8>"] = {
			function(cmp)
				cmp.accept({ index = 8 })
			end,
		},
		["<A-9>"] = {
			function(cmp)
				cmp.accept({ index = 9 })
			end,
		},
		["<A-0>"] = {
			function(cmp)
				cmp.accept({ index = 10 })
			end,
		},
	},

	completion = {
		-- 示例：使用'prefix'对于'foo_|_bar'单词将匹配'foo_'(光标前面的部分),使用'full'将匹配'foo__bar'(整个单词)
		keyword = { range = "prefix" },
		-- 选择补全项目时显示文档(0.5秒延迟)
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		-- 不预选第一个项目，选中后自动插入该项目文本
		list = { selection = { preselect = false, auto_insert = true } },
		ghost_text = {},
		trigger = {
			show_on_keyword = true,
			show_on_trigger_character = true,
		},
		menu = {
			draw = {
				-- We don't need label_description now because label and label_description are already
				-- combined together in label by colorful-menu.nvim.
				columns = { { "kind_icon" }, { "label", gap = 1 } },
				components = {
					label = {
						text = function(ctx)
							return require("colorful-menu").blink_components_text(ctx)
						end,
						highlight = function(ctx)
							return require("colorful-menu").blink_components_highlight(ctx)
						end,
					},
				},
			},
		},
	},
	-- 指定文件类型启用/禁用
	-- enabled = function()
	-- 	return not vim.tbl_contains({
	-- 		-- "lua",
	-- 		-- "markdown"
	-- 	}, vim.bo.filetype) and vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
	-- end,

	appearance = {
		-- 将“Nerd Font Mono”设置为“mono”，将“Nerd Font”设置为“normal”
		-- 调整间距以确保图标对齐
		nerd_font_variant = "mono",
	},
	term = {
		enabled = true,
		keymap = { preset = "inherit" }, -- Inherits from top level `keymap` config when not set
		sources = {},
		completion = {
			trigger = {
				show_on_blocked_trigger_characters = {},
				show_on_x_blocked_trigger_characters = nil, -- Inherits from top level `completion.trigger.show_on_blocked_trigger_characters` config when not set
			},
			-- Inherits from top level config options when not set
			list = {
				selection = {
					-- When `true`, will automatically select the first item in the completion list
					preselect = nil,
					-- When `true`, inserts the completion item automatically when selecting it
					auto_insert = nil,
				},
			},
			-- Whether to automatically show the window when new completion items are available
			menu = { auto_show = nil },
			-- Displays a preview of the selected item on the current line
			ghost_text = { enabled = nil },
		},
	},

	-- 已定义启用的提供程序的默认列表，以便您可以扩展它

	sources = {
		default = { "buffer", "lsp", "path", "snippets", "emoji" },
		providers = {
			-- score_offset设置优先级数字越大优先级越高
			buffer = { score_offset = 4 },
			path = { score_offset = 3 },
			lsp = { score_offset = 4 },
			snippets = { score_offset = 2 },
			-- copilot = {
			-- 	name = "copilot",
			-- 	module = "blink-copilot",
			-- 	score_offset = 100,
			-- 	async = true,
			-- 	opts = {
			-- 		-- Local options override global ones
			-- 		max_completions = 3, -- Override global max_completions
			--
			-- 		-- Final settings:
			-- 		-- * max_completions = 3
			-- 		-- * max_attempts = 2
			-- 		-- * all other options are default
			-- 	},
			-- },
			-- copilotChat = {
			-- 	module = "cmp.copilotChat",
			-- 	max_items = 10,
			-- },
			emoji = {
				module = "blink-emoji",
				name = "Emoji",
				score_offset = 15, -- Tune by preference
				opts = {
					insert = true, -- Insert emoji (default) or complete its name
					---@type string|table|fun():table
					trigger = function()
						return { ":" }
					end,
				},
				should_show_items = function()
					return vim.tbl_contains(
						-- Enable emoji completion only for git commits and markdown.
						-- By default, enabled for all file-types.
						{ "gitcommit", "markdown" },
						vim.o.filetype
					)
				end,
			},
		},
	},
})
