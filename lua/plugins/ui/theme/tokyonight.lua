-- ======================================
--   lua/plugins/ui/colorscheme.lua
--     (folke/tokyonight.nvim Plugin)
-- ======================================
-- 插件仓库: https://github.com/folke/tokyonight.nvim
-- 配置文档: https://github.com/folke/tokyonight.nvim#configuration

--- 插件提供的主要命令 (Command):
-- 这些命令可以在 Neovim 的命令行模式 (按 `:` 进入) 中执行。
-- 通常，你不需要在 Lua 配置中直接调用它们，而是通过键位映射来触发，
-- 或者在需要时手动执行。
--
-- :colorscheme tokyonight       - 激活 Tokyonight 颜色主题。这是最常用的命令。
-- :colorscheme tokyonight-night  - 激活 Tokyonight 的 'night' 变体 (通常是默认)。
-- :colorscheme tokyonight-storm  - 激活 Tokyonight 的 'storm' 变体 (对比度稍低)。
-- :colorscheme tokyonight-moon   - 激活 Tokyonight 的 'moon' 变体 (适合夜间)。
-- :colorscheme tokyonight-day    - 激活 Tokyonight 的 'day' 变体 (浅色主题)。
--
-- 其他高级命令 (通常与插件内部功能或调试相关，一般用户无需直接使用):
-- :TokyoNightToggleTheme       - 在配置的明暗主题之间切换。 (需要自定义主题切换配置)
-- :TokyoNightHighlight         - 查看当前光标下高亮组的信息。
--
-- 注意：上面的 `:colorscheme <theme-name>` 是 Neovim 内置命令，
-- 只要颜色主题插件安装并正确加载，就可以使用它来切换。

return {
	{
		'folke/tokyonight.nvim',
		-- tag: 推荐使用特定的 tag 来锁定版本
		tag = false, -- 你可以在 GitHub 仓库的 "releases" 页面找到最新稳定 tag。

		-- 事件驱动加载 (Lazy Loading):
		-- 颜色主题通常应该在 Neovim 启动时就加载，以确保 UI 颜色正确。
		priority = 1000,   -- 设置高优先级，确保在大多数其他插件之前加载。
		name = "tokyonight", -- 显式声明插件名称，对应 `:colorscheme tokyonight`

		-- 配置函数：当插件加载时执行
		config = function()
			-- 获取 tokyonight 模块
			local tokyonight = require('tokyonight')

			-- 设置 tokyonight 的配置选项
			-- 这是可选的。如果你不需要自定义，可以省略 tokyonight.setup({})
			tokyonight.setup({
				-- 主题样式：'night', 'storm', 'moon', 'day'
				-- 默认为 'night'。你可以根据喜好修改。
				style = 'night',

				on_colorscheme = function()
					-- 你可以在这里添加一些在颜色主题加载后需要执行的逻辑
					-- 例如，调整某些特定高亮组
					-- vim.cmd.highlight("Comment guifg=#565f89") -- 示例：将注释颜色调整为更深的紫色
				end,
			})

			-- 激活颜色主题。这行非常重要，它告诉 Neovim 使用 'tokyonight' 作为当前颜色主题。
			-- 如果你不调用 setup() 函数来自定义，可以直接使用：
			-- vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
		name = 'onedark',
		tag = false,
	}
}
