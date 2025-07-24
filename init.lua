vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.foldlevelstart = 99
require("keymaps")

require("custom")
require("plugins")
require("options")
vim.cmd("so ~/.config/nvim/lua/config/plugins/ui/lualine.lua")
