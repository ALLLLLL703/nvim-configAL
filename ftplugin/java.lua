local config = {
	cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),

	-- Add Lombok support

	-- Add Lombok javaagent
	init_options = {
		bundles = {},
	},
}

-- Add Lombok javaagent to the command
local lombok_path = vim.fn.expand("~/.local/share/lombok.jar")
if vim.fn.filereadable(lombok_path) == 1 then
	table.insert(config.cmd, "-javaagent:" .. lombok_path)
end

require("jdtls").start_or_attach(config)
