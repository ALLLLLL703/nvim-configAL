-- Function to wrap selected code with for/if
local function wrap_with_structure()
  local mode = vim.fn.mode()
  if mode ~= "v" then
    print("Select text in visual mode first!")
    return
  end

  local structure = vim.fn.input("Wrap with (for/if): ")
  if structure == "for" then
    vim.cmd([[normal! Ifor i in range(10):<CR>]])
    vim.cmd([[normal! o]])
  elseif structure == "if" then
    vim.cmd([[normal! Iif condition:<CR>]])
    vim.cmd([[normal! o]])
  else
    print("Invalid input. Use 'for' or 'if'.")
  end
end

-- Keymap for wrapping
vim.keymap.set("v", "<leader>w", wrap_with_structure, { desc = "Wrap selection with for/if" })
