local M = {}

-- 运算符映射表
local invert_ops = {
	["=="] = "!=",
	["!="] = "==",
	[">"] = "<=",
	["<"] = ">=",
	[">="] = "<",
	["<="] = ">",
}
---@param cond string
local function invert_word(cond)
	for op, inv in pairs(invert_ops) do
		local pattern = "(%S+)%s*" .. op .. "%s*(%S+)"
		local lhs, rhs = cond:match(pattern)
		if lhs and rhs then
			return lhs .. " " .. inv .. " " .. rhs
		end
	end
	return "!(" .. cond .. ")"
end

function M.flip_if()
	local line = vim.api.nvim_get_current_line()
	local new = line:gsub("^%s*if%s*%((.*)%)", function(cond)
		return "if (" .. invert_word(cond) .. ")"
	end)
	if vim.bo.filetype == "c" or vim.bo.filetype == "cpp" then
		vim.api.nvim_set_current_line(new)
	end
end
return M
