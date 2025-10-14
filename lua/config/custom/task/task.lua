local function get_json()
	local filename = "tasks.json"
	local path = vim.fn.glob("./" .. filename)
	if path ~= "" then
		print("Found: " .. path)
	else
		print("file didnt find")
	end

	local file = io.open(path, "r")
	if not file then
		print("Error: Cannot open file.")
		return
	end

	local content = file:read("*a")
	file:close()

	local ok, data = pcall(vim.fn.json_decode, content)
	if not ok or type(data) ~= "table" then
		print("Error: Invalid JSON format.")
		return
	end

	local result = {}
	for i, item in ipairs(data) do
		if type(item) ~= "table" or not item.name or not item.command then
			print(string.format("Error: Invalid entry at index %d.", i))
			return
		end
		result[item.name] = item.command
	end

	print(vim.inspect(result))
	return result
end
vim.api.nvim_create_user_command("TaskRun", function(opts)
	local tasks = get_json()
	if not tasks then
		print("No tasks available.")
		return
	end
	if not opts.args or not opts.fargs then
		print("Please provide a task name.")
		return
	end
	if tasks[opts.fargs[1]] and opts.fargs[2] == "t" then
		local cmd = tasks[opts.fargs[1]]
		print("Running task: " .. opts.fargs[1] .. " -> " .. cmd)
		vim.cmd("terminal" .. " " .. cmd .. "")
	else
		print("Task not found: " .. opts.fargs[1])
	end
	if tasks[opts.args] then
		local cmd = tasks[opts.args]
		print("Running task: " .. opts.args .. " -> " .. cmd)
		vim.cmd("!" .. cmd)
	else
		print("Task not found: " .. opts.args)
	end
end, { nargs = "*" })
