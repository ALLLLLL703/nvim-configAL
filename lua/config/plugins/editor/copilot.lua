local chatopt = {
	window = {
		layout = "float",
		width = 80, -- Fixed width in columns
		height = 20, -- Fixed height in rows
		border = "rounded", -- 'single', 'double', 'rounded', 'solid'
		title = "🤖 AI Assistant",
		zindex = 100, -- Ensure window stays on top
	},

	headers = {
		user = "👤 You",
		assistant = "🤖 Copilot",
		tool = "🔧 Tool",
	},

	separator = "━━",
	auto_fold = true, -- Automatically folds non-assistant messages
}
require("CopilotChat").setup(chatopt)
