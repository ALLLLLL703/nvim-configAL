-- 检测是否在 tmux
local function in_tmux()
	return os.getenv("TMUX") ~= nil
end

-- 打开图片：tmux 用 viu，Ghostty 用 image.nvim
function OpenImage(path)
	if in_tmux() then
		vim.cmd("!" .. "viu " .. path)
	else
		-- 调用 image.nvim 的显示接口
		require("image").setup()
		require("image").open(path)
	end
end
