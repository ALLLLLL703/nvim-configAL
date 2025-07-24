require("image").setup({
	backend = "kitty",
	processor = "magick_cli", -- or "magick_rock"
	integrations = {
		markdown = {
			enabled = true,
			clear_in_insert_mode = false,
			download_remote_images = true,
			only_render_image_at_cursor = false,
			only_render_image_at_cursor_mode = "popup",
			floating_windows = false, -- if true, images will be rendered in floating markdown windows
			filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
		},
		neorg = {
			enabled = true,
			filetypes = { "norg" },
		},
		typst = {
			enabled = true,
			filetypes = { "typst" },
		},
		html = {
			enabled = false,
		},
		css = {
			enabled = false,
		},
	},
	window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
	hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif", "*.PNG", "*.JPG" }, -- render image files as images when opened
})
