require("neo-tree").setup({
	window = {
		mappings = {
			["e"] = function()
				vim.api.nvim_exec("Neotree focus filesystem left", true)
			end,
			["b"] = function()
				vim.api.nvim_exec("Neotree focus buffers left", true)
			end,
			["g"] = function()
				vim.api.nvim_exec("Neotree focus git_status left", true)
			end,
		},
	},
	filesystem = {
		window = {
			mappings = {
				["I"] = "run_command",
			},
		},
	},
	commands = {
		run_command = function(state)
			local node = state.tree:get_node()
			local path = node:get_id()
			vim.api.nvim_input(": " .. path .. "<Home>")
		end,
	},
})
-- bufferlint.nvim
--	~/application/植物大战僵尸融合版2.6旅行版本/【更新公告】2.6版本更新.txt
