---@type vim.lsp.Config
return {
	cmd = { "/home/sanae/.local/share/nvim/mason/bin/taplo", "lsp", "stdio" },
	filetypes = { "toml" },
	root_markers = { ".taplo.toml", "taplo.toml", ".git" },
}
