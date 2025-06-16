local b = ':lua require("telescope.builtin")'
local maps = vim.keymap.set
maps('n','<leader>gc',b .. '.git_commits{}<CR>',{desc='git commits'})
maps('n','<leader>gb',b .. '.git_branches{}<CR>',{desc='git branches'})
maps('n','<leader>gs',b .. '.git_status{}<CR>',{desc='git status'})
maps('n','<leader>gS',b .. '.git_stash{}<CR>',{desc='git stash'})
maps('n','<leader>up',b .. '.planets{}<CR>',{desc='planets'})

maps('n','<leader>st',b .. '.treesitter{}<CR>',{desc='treesitter'})
maps('n','<leader>fr','<cmd>Telescope oldfiles<CR>',{desc='treesitter'})


maps('n',"<leader>fR", ":Telescope registers<CR>", {desc = "Find Registers"})
maps('n',"<leader>fg", ":Telescope live_grep<CR>", {desc = "Live Grep"}) 
maps('n',"<leader>fb", ":Telescope buffers<CR>", {desc = "Buffers"})      
maps('n',"<leader>fq", ":Telescope quickfix<CR>", {desc = "Quickfix"})    
maps('n',"<leader>hq", ":Telescope quickfixhistory<CR>", {desc = "Quick fix"})
maps('n',"<leader>hk", ":Telescope keymaps<CR>", {desc = "keymap"})

