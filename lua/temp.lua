local function test_kitty_image(path)
	local file = io.open(path, "rb")
	if not file then
		return vim.notify("Failed to open image", vim.log.levels.ERROR)
	end
	local image_data = file:read("*all")
	file:close()
	local base64 = vim.base64.encode(image_data)
	local cmd = string.format("\x1b]1337;File=inline=1;preserveAspectRatio=1;width=50%%:%s\x1b\\", base64)
	vim.fn.chansend(vim.v.stderr, cmd)
	vim.notify("Sent Kitty graphics command", vim.log.levels.INFO)
end
vim.api.nvim_create_user_command("TestKittyImage", function(opts)
	test_kitty_image(opts.args)
end, { nargs = 1 })
