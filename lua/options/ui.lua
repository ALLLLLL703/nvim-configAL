-- ==============================
--      lua/options/ui.lua
--       UI Related Options
-- ==============================

-- 行号
vim.opt.number = true -- 显示绝对行号
vim.opt.relativenumber = true -- 显示相对行号（方便使用 j/k 移动）

vim.o.foldtext = "v:lua.custom_foldtext()"
-- UI 元素
vim.opt.termguicolors = true -- 启用真彩色终端支持 (如果你的终端支持，强烈推荐)
vim.opt.cmdheight = 1 -- 命令行的行数
vim.opt.showmode = false -- 不显示模式信息 (许多插件会提供更好的状态栏，所以禁用内置的)
vim.opt.scrolloff = 8 -- 光标距离屏幕边缘的最小行数，防止光标停在边缘
vim.opt.hlsearch = false
-- 语法高亮
vim.opt.syntax = "on" -- 启用内置语法高亮 (虽然 Treesitter 更好，但这个是兜底)
--fold
vim.o.foldmethod = "expr"
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Source: https://www.reddit.com/r/neovim/comments/1fzn1zt/custom_fold_text_function_with_treesitter_syntax/
local function fold_virt_text(result, start_text, lnum)
	local text = ""
	local hl
	for i = 1, #start_text do
		local char = start_text:sub(i, i)
		local captured_highlights = vim.treesitter.get_captures_at_pos(0, lnum, i - 1)
		local outmost_highlight = captured_highlights[#captured_highlights]
		if outmost_highlight then
			local new_hl = "@" .. outmost_highlight.capture
			if new_hl ~= hl then
				-- as soon as new hl appears, push substring with current hl to table
				table.insert(result, { text, hl })
				text = ""
				hl = nil
			end
			text = text .. char
			hl = new_hl
		else
			text = text .. char
		end
	end
	table.insert(result, { text, hl })
end
function _G.custom_foldtext()
	local start_text = vim.fn.getline(vim.v.foldstart):gsub("\t", string.rep(" ", vim.o.tabstop))
	local nline = vim.v.foldend - vim.v.foldstart
	local result = {}
	fold_virt_text(result, start_text, vim.v.foldstart - 1)
	table.insert(result, { " ", nil })
	table.insert(result, { "", "@comment.warning.gitcommit" })
	table.insert(result, { "↙ " .. nline .. " lines", "@comment.warning" })
	table.insert(result, { "", "@comment.warning.gitcommit" })
	return result
end
-- 透明背景设置
local function set_transparent_background()
	-- 主窗口背景透明
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

	-- 浮动窗口透明
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })

	-- 其他 UI 元素透明
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
	vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
	vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
	vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })

	-- 状态栏透明
	vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
	vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })

	-- 标签页透明
	vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
	vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })
	vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
end

-- 初始化时设置透明背景

-- 透明背景切换快捷键
local is_transparent = true
function toggle_transparent()
	if is_transparent then
		-- 恢复默认背景
		vim.api.nvim_set_hl(0, "Normal", { bg = "#1a1b26" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "#1a1b26" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "#1a1b26" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1a1b26" })
		print("透明背景已关闭")
	else
		-- 设置透明背景
		set_transparent_background()
		print("透明背景已开启")
	end
	is_transparent = not is_transparent
end
vim.keymap.set("n", "<leader>uo", toggle_transparent, { desc = "toggle transparent background", silent = true })
toggle_transparent()
