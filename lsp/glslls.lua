---@brief
---
--- https://github.com/svenstaro/glsl-language-server
---
--- Language server implementation for GLSL
---
--- `glslls` can be compiled and installed manually, or, if your distribution has access to the AUR,
--- via the `glsl-language-server` AUR package

---@type vim.lsp.Config
return {
	cmd = { "glslls", "--stdin" },
	root_markers = { ".git" },
	capabilities = {
		textDocument = {
			completion = {
				editsNearCursor = true,
			},
		},
		offsetEncoding = { "utf-8", "utf-16" },
	},
}
