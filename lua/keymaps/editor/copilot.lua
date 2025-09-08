local function kset(command, desc, key)
	vim.keymap.set("n", key, command, { desc = desc, silent = true })
end
kset("<cmd>CopilotChatToggle<cr>", "Open Copilot Chat", "<leader>ac")
