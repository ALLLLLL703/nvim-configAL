local M = {}

local Source = {}
Source.__index = Source

function Source:get_trigger_characters()
	local success, chat = pcall(require, "CopilotChat")
	if not success then
		return {}
	end

	local info_success, info = pcall(chat.complete_info)
	if not info_success or not info then
		return {}
	end

	return info.triggers
end

function Source:get_completions(ctx, callback)
	local chat = require("CopilotChat")

	local line = ctx.line
	local cursor_col = ctx.cursor[2]
	local before_cursor = line:sub(1, cursor_col)

	local success, info = pcall(chat.complete_info)
	if not success or not info then
		callback({ items = {} })
		return
	end

	local prefix, _ = unpack(vim.fn.matchstrpos(before_cursor, info.pattern))

	if not prefix or prefix == "" then
		callback({ items = {} })
		return
	end

	vim.schedule(function()
		local co = coroutine.create(function()
			local _, items = pcall(chat.complete_items)
			local filtered_items = {}
			for _, item in ipairs(items) do
				if item and item.word and vim.startswith(item.word:lower(), prefix:lower()) then
					local converted_item = {
						label = item.word,
						kind = self:convert_kind(item.kind),
						detail = item.menu or "",
						documentation = item.info or "",
						data = item,
					}
					table.insert(filtered_items, converted_item)
				end
			end

			vim.schedule(function()
				callback({
					items = filtered_items,
					is_incomplete_forward = false,
					is_incomplete_backward = false,
				})
			end)
		end)

		local finish, err = coroutine.resume(co)
		if not finish then
			vim.notify("[blink-copilot] Error getting completions: " .. tostring(err), vim.log.levels.WARN)
			callback({ items = {} })
		end
	end)
end

function Source:convert_kind(kind_str)
	local kind_map = {
		["user"] = require("blink.cmp.types").CompletionItemKind.Keyword,
		["system"] = require("blink.cmp.types").CompletionItemKind.Keyword,
		["context"] = require("blink.cmp.types").CompletionItemKind.Reference,
		--- This is for the `tool` branch
		["resource"] = require("blink.cmp.types").CompletionItemKind.Reference,
		["tool"] = require("blink.cmp.types").CompletionItemKind.Function,
		["github_models"] = require("blink.cmp.types").CompletionItemKind.EnumMember,
	}

	if kind_map[kind_str] then
		return kind_map[kind_str]
	end

	return require("blink.cmp.types").CompletionItemKind.Variable
end

function Source:should_show_completion_item(item, ctx)
	return true
end

function M.new()
	return setmetatable({}, Source)
end

return M
