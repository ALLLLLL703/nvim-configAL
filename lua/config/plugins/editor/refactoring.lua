local function refact_key()
	vim.keymap.set({ "n", "x" }, "<leader>re", function()
		return require("refactoring").refactor("Extract Function")
	end, { expr = true, desc = "Extract Function" })
	vim.keymap.set({ "n", "x" }, "<leader>rf", function()
		return require("refactoring").refactor("Extract Function To File")
	end, { expr = true, desc = "Extract Function To File" })
	vim.keymap.set({ "n", "x" }, "<leader>rv", function()
		return require("refactoring").refactor("Extract Variable")
	end, { expr = true, desc = "Extract Variable" })
	vim.keymap.set({ "n", "x" }, "<leader>rI", function()
		return require("refactoring").refactor("Inline Function")
	end, { expr = true, desc = "Inline Function" })
	vim.keymap.set({ "n", "x" }, "<leader>ri", function()
		return require("refactoring").refactor("Inline Variable")
	end, { expr = true, desc = "Inline Function" })

	vim.keymap.set({ "n", "x" }, "<leader>rbb", function()
		return require("refactoring").refactor("Extract Block")
	end, { expr = true, desc = "Inline Function" })
	vim.keymap.set({ "n", "x" }, "<leader>rbf", function()
		return require("refactoring").refactor("Extract Block To File")
	end, { expr = true, desc = "Inline Function" })
end

local M = {
	prompt_func_return_type = {
		go = true,
		cpp = true,
		c = true,
		java = true,
	},
	-- prompt for function parameters
	prompt_func_param_type = {
		go = true,
		cpp = true,
		c = true,
		java = true,
	},
}
require("refactoring").setup(M)
refact_key()
