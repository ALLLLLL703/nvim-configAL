-- ==============================
--     lua/options/basic.lua
--    Basic General Options
-- ==============================

-- 编码
vim.opt.encoding = "utf-8"      -- Neovim 内部编码
vim.opt.fileencoding = "utf-8"  -- 文件写入时的编码

-- 备份和撤销
vim.opt.backup = false          -- 不创建备份文件
vim.opt.writebackup = false     -- 不创建写入备份文件
vim.opt.swapfile = false        -- 不创建交换文件
vim.opt.undofile = true         -- 启用永久撤销功能 (可以撤销关闭 Neovim 后的操作)
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo" -- 撤销文件目录，推荐放在 data 目录下

-- 搜索
vim.opt.ignorecase = true       -- 搜索时忽略大小写
vim.opt.smartcase = true        -- 如果搜索模式包含大写字母，则开启大小写敏感搜索
vim.opt.hlsearch = true         -- 高亮搜索结果
vim.opt.incsearch = true        -- 增量搜索（边输入边搜索）

vim.opt.cursorline = true-- **vim.opt.cursorline**: 高亮光标所在的整行。
--左侧符号显示
vim.opt.signcolumn = "yes"
-- **vim.opt.completeopt**: 自动补全菜单的选项。
--可以禁用一些提示信息
--vim.opt.shortmess:append("c")
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

