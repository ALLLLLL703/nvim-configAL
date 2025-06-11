-- ==============================
--      lua/options/ui.lua
--       UI Related Options
-- ==============================

-- 行号
vim.opt.number = true           -- 显示绝对行号
vim.opt.relativenumber = true   -- 显示相对行号（方便使用 j/k 移动）

-- UI 元素
vim.opt.termguicolors = true    -- 启用真彩色终端支持 (如果你的终端支持，强烈推荐)
vim.opt.cmdheight = 1           -- 命令行的行数
vim.opt.showmode = false        -- 不显示模式信息 (许多插件会提供更好的状态栏，所以禁用内置的)
vim.opt.scrolloff = 8           -- 光标距离屏幕边缘的最小行数，防止光标停在边缘

-- 语法高亮
vim.opt.syntax = "on"           -- 启用内置语法高亮 (虽然 Treesitter 更好，但这个是兜底)