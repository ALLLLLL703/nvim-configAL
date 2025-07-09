vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.foldlevelstart = 99
require("options")
require("keymaps")

require("plugins")
require("custom")
vim.cmd("so ~/.config/nvim/lua/config/plugins/ui/lualine.lua")
