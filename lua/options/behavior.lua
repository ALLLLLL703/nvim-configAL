-- ==============================
--    lua/options/behavior.lua
--   Editing Behavior Options
-- ==============================

-- 缩进
vim.opt.tabstop = 4             -- Tab 键的宽度为 4 个空格
vim.opt.shiftwidth = 4          -- 自动缩进的宽度为 4 个空格
vim.opt.expandtab = false        -- 将 Tab 键转换为空格

-- 文件和缓冲区管理
vim.opt.hidden = true           -- 允许隐藏未保存的缓冲区 (在文件间切换时不会强制保存)
vim.opt.updatetime = 300        -- 自动写入交换文件/触发某些事件的间隔，单位 ms

-- 鼠标和剪贴板
vim.opt.mouse = "a"             -- 在所有模式下启用鼠标
vim.opt.clipboard = "unnamedplus" -- 同步系统剪贴板 (+ 寄存器)，需要安装 xclip 或 xsel

vim.opt.splitbelow = true
vim.opt.splitright = true
