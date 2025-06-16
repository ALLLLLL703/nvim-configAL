-- ======================================
--     lua/plugins/ui/lualine.lua
--       (lualine.nvim Plugin)
-- ======================================
-- 插件仓库: https://github.com/nvim-lualine/lualine.nvim
-- 文档链接: https://github.com/nvim-lualine/lualine.nvim/blob/master/doc/lualine.txt

return {
	{'nvim-lualine/lualine.nvim',
    -- 依赖：lualine 也依赖 nvim-web-devicons 来显示文件类型图标
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- tag: 推荐使用特定的 tag 来锁定版本
    tag = 'v1.4.2', -- 你可以在 GitHub 仓库的 "releases" 页面找到最新稳定 tag。

    -- 事件驱动加载 (Lazy Loading):
    -- 通常 lualine 都会在 Neovim 启动时就加载，因为它是一个核心的 UI 组件。
    event = "VeryLazy",

    -- 配置函数：当插件加载时执行
    config = function()
    require('lualine').setup({
        options = {
            -- 主题：这里我们使用 'auto'，它会根据你的 Neovim 颜色主题自动调整。
            -- 也可以指定其他内置主题，如 'solarized_light', 'gruvbox', 'tokyonight' 等。
            theme = 'auto',
            -- 模式文本：是否显示模式名称（NORMAL, INSERT 等）。设为 false 因为我们后面会自定义显示。
            component_separators = { left = '', right = ''}, -- 组件之间的分隔符
            section_separators = { left = '', right = ''},   -- 章节之间的分隔符
            -- disabled_filetypes = { 'NvimTree', 'packer' }, -- 在特定文件类型中禁用 lualine
            always_divide_middle = true, -- 总是将中间部分分成左右两半
        },
        -- Section A: 左侧第一个区域 (通常显示模式)
    sections = {
        lualine_a = {'mode'}, -- 模式名称（NORMAL, INSERT 等）

        -- Section B: 左侧第二个区域 (通常显示 Git 分支)
    lualine_b = {'branch', 'diff'}, -- Git 分支信息，以及文件与 Git 仓库差异 (增删改行数)

    -- Section C: 中间区域 (通常显示文件名和路径)
    lualine_c = {{
        'filename',
        file_status = true, -- 显示文件状态 (例如 '[+]' 表示已修改)
    path = 1,           -- 显示相对路径 (0: 文件名, 1: 相对路径, 2: 完整路径)
    }},

    -- Section X: 右侧第三个区域 (通常显示 LSP 状态和诊断信息)
    lualine_x = {
        'diagnostics', -- 显示 LSP 诊断信息 (错误、警告等)
    'encoding',    -- 文件编码
    'fileformat',  -- 文件格式 (unix, dos)
    'filetype',    -- 文件类型
    },

    -- Section Y: 右侧第二个区域 (通常显示行和列号)
    lualine_y = {'progress'}, -- 显示文件阅读进度百分比

    -- Section Z: 右侧第一个区域 (通常显示行和列号)
    lualine_z = {'location'}, -- 显示行号和列号 (例如 '10,20')
    },
    -- 不活动的 Lualine 状态栏（当窗口不活跃时显示）
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {{
            'filename',
            file_status = true,
            path = 1,
        }},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {},
    },
    -- Tabline (多 Tab 时的顶部栏) - 默认禁用，如果你使用 Tab，可以启用
    -- tabline = {},
    -- extensions = { 'nvim-tree', 'lazy' }, -- 启用与特定插件的集成
    })
    end,
	},
	{
        "goolord/alpha-nvim",
        lazy = true,
				
				event = 'VimEnter',
        config = function()
            -- alpha-config.lua

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {

	[[          ▀████▀▄▄              ▄█ ]],
	[[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
	[[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
	[[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
	[[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
	[[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
	[[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
	[[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
	[[   █   █  █      ▄▄           ▄▀   ]],

}

dashboard.section.buttons.val = {
	dashboard.button("f", "📁 Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "߷  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.vim<CR>"),
	dashboard.button("q", "࿕ Quit Neovim", ":qa<CR>"),
}

local function footer()
	return "Don't Stop Until You are Proud..."
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
--bufferline.lua
require('bufferline').setup({
})


            
        end,
    },

    -- Bufferline
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
    },
}
