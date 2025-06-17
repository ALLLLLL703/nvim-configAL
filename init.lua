vim.g.mapleader = " "
vim.g.maplocalleader = " "
require('options')
require('keymaps')

require('plugins')
require 'custom'
vim.cmd('colorscheme onedark_vivid')
vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable 'rust_analyzer'
