local inv = require("custom.util.inv")
vim.keymap.set("n", "<leader>cu", function()
	inv.flip_if()
end, { desc = "flip_if", silent = true })
