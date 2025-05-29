vim.keymap.set("n", "glp", ":Lspsaga peek_definition<CR>", { silent = true, noremap = true, desc = "Peek Definition" })
vim.keymap.set("n", "glr", ":Lspsaga finder<CR>", { silent = true, noremap = true, desc = "Peek reference" })
vim.keymap.set("n", "<A-x>", "<cmd>Lspsaga term_toggle<CR>")
vim.keymap.set("t", "<A-x>", "<cmd>Lspsaga term_toggle<CR>")
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true, noremap = true, desc = "Hover Doc" })
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "tree_explorer" })
-- 毎日、私はご飯を食べます。
