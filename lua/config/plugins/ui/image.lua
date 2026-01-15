require("image").setup({
	backend = "kitty", -- "kitty" | "ueberzug" | "chafa" | "viu" | "w3m" | "iterm2" | "sixel" | "catimg" | "jp2a" | "chafa_cli" | "magick_cli"
	processor = "magick_cli",
	log_level = "debug",
	hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif", "*.PNG", "*.JPG" }, -- render image files as images when opened
	integrations = {
		markdown = {
			enabled = true,
			download_remote_images = true,
			only_render_image_at_cursor_mode = "inline",
		},
		neorg = { enabled = true, filetype = { "neorg" } },
		html = {
			enabled = true,
		},
		css = {
			enabled = true,
		},
	},
	editor_only_render_when_focused = true,
	tmux_show_only_in_active_window = true,
	max_height_window_percentage = 50,
})
