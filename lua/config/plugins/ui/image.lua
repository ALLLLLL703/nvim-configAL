require("image").setup({
	backend = "kitty", -- "kitty" | "ueberzug" | "chafa" | "viu" | "w3m" | "iterm2" | "sixel" | "catimg" | "jp2a" | "chafa_cli" | "magick_cli"
	processor = "magick_rock",
	log_level = "debug",
	hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif", "*.PNG", "*.JPG" }, -- render image files as images when opened
	integrations = {
		markdown = { enabled = true, only_render_image_at_cursor_mode = "inline" },
	},
})
