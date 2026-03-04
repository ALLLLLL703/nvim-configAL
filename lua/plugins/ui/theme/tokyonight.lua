return {
	{
		"folke/tokyonight.nvim",
		-- tag: 推荐使用特定的 tag 来锁定版本 tag = false, -- 你可以在 GitHub 仓库的 "releases" 页面找到最新稳定 tag。
		-- 事件驱动加载 (Lazy Loading):
		-- 颜色主题通常应该在 Neovim 启动时就加载，以确保 UI 颜色正确。
		priority = 1000, -- 设置高优先级，确保在大多数其他插件之前加载。
		name = "tokyonight", -- 显式声明插件名称，对应 `:colorscheme tokyonight`

		-- 配置函数：当插件加载时执行
		config = function()
			-- 获取 tokyonight 模块
			local tokyonight = require("tokyonight")

			-- 设置 tokyonight 的配置选项
			-- 这是可选的。如果你不需要自定义，可以省略 tokyonight.setup({})
			tokyonight.setup({
				-- 主题样式：'night', 'storm', 'moon', 'day'
				-- 默认为 'night'。你可以根据喜好修改。
				style = "night",
				-- 启用透明背景
				transparent = false,

				on_colorscheme = function()
					-- 你可以在这里添加一些在颜色主题加载后需要执行的逻辑
					-- 例如，调整某些特定高亮组
					-- vim.cmd.highlight("Comment guifg=#565f89") -- 示例：将注释颜色调整为更深的紫色
				end,
			})
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
		name = "onedark",
		tag = false,
	},
	{
		"EdenEast/nightfox.nvim",
		name = "nightfox",
		tag = false,
	},

	{ "marko-cerovac/material.nvim", name = "material", tag = false },
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		tag = false,
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				overrides = function(colors) -- add/modify highlights
					local theme = colors.theme
					local makeDiagnosticColor = function(color)
						local c = require("kanagawa.lib.color")
						return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
					end
					return {
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },

						-- Save an hlgroup with dark background and dimmed foreground
						-- so that you can use it where your still want darker windows.
						-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

						-- Popular plugins that open floats will link to NormalFloat by default;
						-- set their background accordingly if you wish to keep them dark and borderless
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptNormal = { bg = theme.ui.bg_p1 },
						TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
						TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
						TelescopePreviewNormal = { bg = theme.ui.bg_dim },
						TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
						DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
						DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
						DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
						DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
					}
				end,
				background = { -- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus",
				},
			})
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"baliestri/aura-theme",
		lazy = false,
		priority = 1000,
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
			-- vim.cmd([[colorscheme aura-dark]])
		end,
	},
}
