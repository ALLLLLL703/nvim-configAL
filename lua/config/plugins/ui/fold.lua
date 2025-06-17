local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true
}
local language_servers = vim.lsp.get_clients()    -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
	require('lspconfig')[ls].setup({
		capabilities = capabilities
		-- you can add other fields for setting up lsp server in this table
	})
end
require('ufo').setup()
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
local function toggel_fold_level_all(level)
	local cur = vim.o.foldlevel
	if cur >= level then
		vim.o.foldlevel = level - 1;
	else
		vim.o.foldlevel = 99
	end
	vim.notify('toggel fold under the level' .. vim.o.foldlevel)
end
-- vim.api.nvim_create_user_command('ToggleFoldsBelows', function(opts)
-- 	local level = tonumber(opts.args)
-- 	if level and level > 0 then
-- 		toggel_fold_level_all(level)
-- 	else
-- 		vim.notify('invalid options:\t' .. opts.args, vim.log.levels.ERROR)
-- 	end
-- end, { nargs = 1, desc = "Toggle folds below specified level" })
vim.keymap.set('n', 'zu', function()
	vim.ui.input({
		prompt = 'enter fold levels:',
		default = '2'
	}, function(input)
		local level = tonumber(input)
		if level and level > 0 then
			toggel_fold_level_all(level)
		else
			vim.notify('invalid options:\t' .. input, vim.log.levels.ERROR)
		end
	end)
end, { desc = 'folds blow the level' })
vim.cmd('set foldlevel=99')
vim.keymap.set({ 'n', 'v' }, 'zg', function()
	vim.o.foldlevel = 99
end, { desc = 'level reset' })
local resession = require("resession")
resession.setup({
	autosave = {
    enabled = true,
    interval = 60,
    notify = true,
  },
})
-- Resession does NOTHING automagically, so we have to set up some keymaps
vim.keymap.set("n", "<leader>Ss", resession.save,{desc = 'save sessions'})
vim.keymap.set("n", "<leader>Sl", resession.load,{desc = 'load  sessions'})
vim.keymap.set("n", "<leader>Sd", resession.delete,{desc = 'delete sessions'})
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Only load the session if nvim was started with no args and without reading from stdin
    if vim.fn.argc(-1) == 0 and not vim.g.using_stdin then
      -- Save these to a different directory, so our manual sessions don't get polluted
      resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
    end
  end,
  nested = true,
})
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
  end,
})
vim.api.nvim_create_autocmd('StdinReadPre', {
  callback = function()
    -- Store this for later
    vim.g.using_stdin = true
  end,
})
