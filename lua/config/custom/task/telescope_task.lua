local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

local function get_tasks()
	local taskmod = require("config.custom.task.task")
	local tasks = taskmod.get_json and taskmod.get_json() or {}
	local items = {}
	for name, cmd in pairs(tasks) do
		table.insert(items, { name = name, cmd = cmd })
	end
	return items
end

local function task_picker(opts)
	opts = opts or {}
	local tasks = get_tasks()
	pickers
		.new(opts, {
			prompt_title = "Tasks",
			finder = finders.new_table({
				results = tasks,
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry.name,
						ordinal = entry.name,
					}
				end,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry().value
					vim.cmd("TaskRun " .. selection.name)
				end)
				return true
			end,
		})
		:find()
end

return require("telescope").register_extension({
	exports = { tasks = task_picker },
})
