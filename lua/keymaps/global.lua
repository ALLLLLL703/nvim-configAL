-- ==============================
--    lua/keymaps/global.lua
--      Global Keymaps
-- ==============================

-- 常用模式缩写：
-- n: normal mode (普通模式)
-- i: insert mode (插入模式)
-- v: visual mode (可视模式)
-- x: visual block mode (可视块模式)
-- t: terminal mode (终端模式)
-- c: command-line mode (命令行模式)

-- 辅助函数，简化键位映射的定义
local map = vim.keymap.set

-- 保存/退出
map("n", "<leader>w", ":w<CR>", { desc = "Save File" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit Neovim" })
map("n", "<leader>Q", ":qa!<CR>", { desc = "Force Quit All" })

-- 缓冲区操作
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next Buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous Buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete Buffer" })

-- 分屏操作
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split Vertical" })
map("n", "<leader>sh", ":split<CR>", { desc = "Split Horizontal" })
map("n", "<leader>sc", "<C-W>c", { desc = "Close Current Split" })
map("n", "<leader>s=", "<C-W>=", { desc = "Equalize Splits" })

-- 移动光标在分屏之间 (使用 Ctrl + H/J/K/L)
map("n", "<C-h>", "<C-W>h", { desc = "Move to Left Split" })
map("n", "<C-j>", "<C-W>j", { desc = "Move to Down Split" })
map("n", "<C-k>", "<C-W>k", { desc = "Move to Up Split" })
map("n", "<C-l>", "<C-W>l", { desc = "Move to Right Split" })

-- 插入模式下的 jk 退出
map("i", "jk", "<Esc>", { desc = "Exit Insert Mode" })

-- Visual 模式下缩进选区
map("v", ">", ">gv", { desc = "Indent Selection" })
map("v", "<", "<gv", { desc = "Outdent Selection" })

-- Normal 和 Visual 模式下，J 合并下一行
map({"n", "v"}, "J", "mzJ`z", { desc = "Join Lines" })

-- 保持高亮搜索结果，在输入后立即清除
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear Highlight Search" })

-- 复制文件路径到系统剪贴板
map("n", "<leader>fP", ":let @+ = expand('%:p')<CR>", { desc = "Copy Full Path" })
vim.keymap.set('n','<leader>fp',':lua require\'telescope\'.extensions.projects.projects{}<CR>',{desc = 'find projects'})

map("n", "<leader>fd", ":let @+ = expand('%:p:h')<CR>", { desc = "Copy Directory Path" })
