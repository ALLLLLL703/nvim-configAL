vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.foldlevelstart = 99
require("options")
require("keymaps")

require("plugins")
require("custom")
vim.cmd("so ~/.config/nvim/lua/config/plugins/ui/lualine.lua")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
