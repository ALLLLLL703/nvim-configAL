vim.keymap.set("n", "<leader>rp", function()
  local file = vim.fn.expand("%:p") -- Get the full path of the current file
  if vim.bo.filetype == "python" then
    vim.cmd("split | terminal python3 " .. file)
  else
    print("This is not a Python file!")
  end
end, { desc = "Run Python file" })
