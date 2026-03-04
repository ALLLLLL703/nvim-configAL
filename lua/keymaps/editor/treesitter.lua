---comment
---@param key string
---@param cmd string
---@param desc string
local function sets(key, cmd, desc)
	vim.keymap.set("n", key, cmd, { desc = desc, silent = true })
end
sets("<leader>uu", "<cmd>TSHighlightCapturesUnderCursor<cr>", "hl group under curso")

sets("<leader>ng", "<cmd>Neogen<cr>", "neogen doc")
