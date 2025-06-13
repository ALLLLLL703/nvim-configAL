local b = require("telescope.builtin")
local maps = vim.keymap.set
maps('n','<leader>gc',b.git_commits,{desc='git commits'})
maps('n','<leader>gb',b.git_branches,{desc='git branches'})
maps('n','<leader>gs',b.git_status,{desc='git status'})
maps('n','<leader>gC',b.git_bcommits,{desc='git bcommits'})
maps('n','<leader>gS',b.git_stash,{desc='git stash'})


