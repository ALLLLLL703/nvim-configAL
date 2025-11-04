local function sets(ns_id, name, val)
	vim.api.nvim_set_hl(ns_id, name, val)
end
-- tree sitter playground

sets(0, "TSPlaygroundFocus", { bg = "#2e9869" })
