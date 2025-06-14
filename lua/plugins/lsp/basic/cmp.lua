return {
	--mini.nvim
	{
		'echasnovski/mini.nvim',
		dependencies = {
			'echasnovski/mini.ai'
		},
		config = function()

		end
	},
	--luasnip
	-- {
	-- 	'L3MON4D3/LuaSnip',
	-- },
	-- cmp copilot
	--
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    -- version = '*',
    build = "cargo build --release",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      cmdline = {
        completion = {
          menu = {
            auto_show = false,
          }
        },
        keymap = {
          preset = "none",
          ["<Tab>"] = {"accept", "show"},
          ["<C-p>"] = { "select_prev", "fallback" },
          ["<C-n>"] = { "select_next", "fallback" },
        }
      },
      keymap = {
        preset = 'none',
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        -- ['<C-e>'] = { 'hide' },
        -- fallback命令将运行下一个非闪烁键盘映射(回车键的默认换行等操作需要)
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' }, -- 更改成'select_and_accept'会选择第一项插入
        ['<C-p>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        ['<C-n>'] = { 'select_next', 'snippet_forward', 'fallback' }, -- 同时存在补全列表和snippet时，补全列表选择优先级更高

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' }, -- 同时存在补全列表和snippet时，snippet跳转优先级更高
        ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
        ['<A-1>'] = { function(cmp) cmp.accept({ index = 1 }) end },
        ['<A-2>'] = { function(cmp) cmp.accept({ index = 2 }) end },
        ['<A-3>'] = { function(cmp) cmp.accept({ index = 3 }) end },
        ['<A-4>'] = { function(cmp) cmp.accept({ index = 4 }) end },
        ['<A-5>'] = { function(cmp) cmp.accept({ index = 5 }) end },
        ['<A-6>'] = { function(cmp) cmp.accept({ index = 6 }) end },
        ['<A-7>'] = { function(cmp) cmp.accept({ index = 7 }) end },
        ['<A-8>'] = { function(cmp) cmp.accept({ index = 8 }) end },
        ['<A-9>'] = { function(cmp) cmp.accept({ index = 9 }) end },
        ['<A-0>'] = { function(cmp) cmp.accept({ index = 10 }) end },
      },
      completion = {
        -- 示例：使用'prefix'对于'foo_|_bar'单词将匹配'foo_'(光标前面的部分),使用'full'将匹配'foo__bar'(整个单词)
        keyword = { range = 'prefix' },
        -- 选择补全项目时显示文档(0.5秒延迟)
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        -- 不预选第一个项目，选中后自动插入该项目文本
        list = { selection = { preselect = false, auto_insert = true } },
      },
      -- 指定文件类型启用/禁用
      enabled = function()
        return not vim.tbl_contains({
          -- "lua",
          -- "markdown"
        }, vim.bo.filetype)
        and vim.bo.buftype ~= "prompt"
        and vim.b.completion ~= false
      end,

      appearance = {
        -- 将“Nerd Font Mono”设置为“mono”，将“Nerd Font”设置为“normal”
        -- 调整间距以确保图标对齐
        nerd_font_variant = 'mono'
      },

      -- 已定义启用的提供程序的默认列表，以便您可以扩展它
      sources = {
        default = { 'buffer', 'lsp', 'path', 'snippets', },
        providers = {
          -- score_offset设置优先级数字越大优先级越高
          buffer = { score_offset = 4 },
          path = { score_offset = 3 },
          lsp = { score_offset = 4 },
          snippets = { score_offset = 2 },
        }
      },
    },

    opts_extend = { "sources.default" }
  },
	{ 'rafamadriz/friendly-snippets' }
}
