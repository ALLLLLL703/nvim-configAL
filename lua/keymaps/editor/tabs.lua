---syntax sugar btw
---@param key string
---@param cmd string
---@param desc string
local function sets(key, cmd, desc)
	cmd = "<cmd>" .. cmd .. "<cr>"
	vim.keymap.set("n", key, cmd, { silent = true, desc = desc })
end
sets("<c-t>l", "tabNext", "nexttab")
sets("<c-t>h", "tabPrev", "prevtab")

sets("<c-t>n", "tabNew", "newtab")
sets("<c-t>d", "tabClose", "tabclose")
