vim.keymap.set("n", "<leader>yt", function()
  local line = vim.api.nvim_get_current_line() -- 获取当前行
  local words = vim.split(line, ", ") -- 按空格分割
  if #words >= 3 then
    words[3] = "{" .. words[3] .. "}" -- 为第四个单词加 {}
    local new_line = table.concat(words, " ") -- 重组行
    vim.api.nvim_set_current_line(new_line) -- 更新行
  else
    print("Less than 4 words in line")
  end
end, { desc = "Wrap 4th word in braces" })
