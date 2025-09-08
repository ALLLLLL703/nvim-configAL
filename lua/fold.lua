local M = {}

function M.fold_virt_text(result, start_text, lnum)
	local text = ""
	local hl
	for i = 1, #start_text do
		local char = start_text:sub(i, i)
		local captured_highlights = vim.treesitter.get_captures_at_pos(0, lnum, i - 1)
		local outmost_highlight = captured_highlights[#captured_highlights]
		if outmost_highlight then
			local new_hl = "@" .. outmost_highlight.capture
			if new_hl ~= hl then
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

return M
