local map = vim.keymap.set
map({'n','v'}, '<leader>ca', '<cmd>Lspsaga code_action<CR>', {desc = 'Code action'})
map({'n','v'}, '<leader>cA', '<cmd>Lspsaga show_workspace_diagnostics<CR>', {desc = 'diagnostics list of workplace'})
map({'n','v'}, '<leader>cF', '<cmd>Lspsaga show_buf_diagnostics<CR>', {desc = 'diagnostics list of file'})

