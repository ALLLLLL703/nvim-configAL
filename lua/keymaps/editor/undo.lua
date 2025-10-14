---@param desc string
---@param cmd string
---@param key string
local function map(desc, cmd, key)
	local opts = {
		desc = desc,
		silent = true,
	}
	vim.keymap.set("n", key, cmd, opts)
end
map("undotree toogle", ":UndotreeToggle<cr>", "<leader>#")
