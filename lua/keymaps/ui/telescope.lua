local b = ':lua require("telescope.builtin")'
local maps = vim.keymap.set
maps('n','<leader>gc',b .. '.git_commits{}<CR>',{desc='git commits'})
maps('n','<leader>gb',b .. '.git_branches{}<CR>',{desc='git branches'})
maps('n','<leader>gs',b .. '.git_status{}<CR>',{desc='git status'})
maps('n','<leader>gS',b .. '.git_stash{}<CR>',{desc='git stash'})
maps('n','<leader>up',b .. '.planets{}<CR>',{desc='planets'})

maps('n','<leader>st',b .. '.treesitter{}<CR>',{desc='treesitter'})

