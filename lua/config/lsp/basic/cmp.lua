local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end
-- load VSCode-like snippets from plugins (e.g., friendly-snippets)
--icons
local lsp_kinds = {
    Class = ' ',
    Color = ' ',
    Constant = ' ',
    Constructor = ' ',
    Enum = ' ',
    EnumMember = ' ',
    Event = ' ',
    Field = ' ',
    File = ' ',
    Folder = ' ',
    Function = ' ',
    Interface = ' ',
    Keyword = ' ',
    Method = ' ',
    Module = ' ',
    Operator = ' ',
    Property = ' ',
    Reference = ' ',
    Snippet = ' ',
    Struct = ' ',
    Text = ' ',
    TypeParameter = ' ',
    Unit = ' ',
    Value = ' ',
    Variable = ' ',
  }

require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"
cmp.setup({
	experimental = {
		ghost_text = true,
	},
	snippet = {

    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<S-tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<Tab>"] = vim.schedule_wrap(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-d>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
	--format
	formatting = {
      -- See: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
      format = function(entry, vim_item)
        -- Set `kind` to "$icon $kind".
        vim_item.kind = string.format('%s %s', lsp_kinds[vim_item.kind], vim_item.kind)
        vim_item.menu = ({
          buffer = '[Buffer]',
          nvim_lsp = '[LSP]',
          luasnip = '[LuaSnip]',
          nvim_lua = '[Lua]',
          latex_symbols = '[LaTeX]',
        })[entry.source.name]
        return vim_item
      end,
    },
	
	
  -- sources for autocompletion

  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- LSP
    { name = "luasnip" }, -- snippets
    { name = "buffer" }, -- text within the current buffer
    { name = "path" }, -- file system paths
    { name = "emoji" }, -- file system paths
    { name = "calc" }, -- file system paths
		{ name = "month" }, 
		{ name = "copilot" }, 
  }),

	window = {
      completion = cmp.config.window.bordered({
        border = 'single',
        col_offset = -1,
        scrollbar = false,
        scrolloff = 3,
        -- Default for bordered() is 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None'
        -- Default for non-bordered, which we'll use here, is:
        winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
      }),
	documentation = cmp.config.window.bordered({
        border = 'solid',
        scrollbar = false,
        -- Default for bordered() is 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None'
        -- Default for non-bordered is 'FloatBorder:NormalFloat'
        -- Suggestion from: https://github.com/hrsh7th/nvim-cmp/issues/2042
        -- is to use 'NormalFloat:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None'
        -- but this also seems to suffice:
        winhighlight = 'CursorLine:Visual,Search:None',
      }),
	
	}
})

--sources
--month
  local source = {}

  ---Return whether this source is available in the current context or not (optional).
  ---@return boolean
  function source:is_available()
    return true
  end

  ---Return the debug name of this source (optional).
  ---@return string
  function source:get_debug_name()
    return 'debug name'
  end

  ---Return LSP's PositionEncodingKind.
  ---@NOTE: If this method is omitted, the default value will be `utf-16`.
  ---@return lsp.PositionEncodingKind
  function source:get_position_encoding_kind()
    return 'utf-16'
  end

  ---Return the keyword pattern for triggering completion (optional).
  ---If this is omitted, nvim-cmp will use a default keyword pattern. See |cmp-config.completion.keyword_pattern|.
  ---@return string
  function source:get_keyword_pattern()
    return [[\k\+]]
  end

  ---Return trigger characters for triggering completion (optional).
  function source:get_trigger_characters()
    return { '.' }
  end

  ---Invoke completion (required).
  ---@param params cmp.SourceCompletionApiParams
  ---@param callback fun(response: lsp.CompletionResponse|nil)
  function source:complete(params, callback)
    callback({
      { label = 'January' },
      { label = 'February' },
      { label = 'March' },
      { label = 'April' },
      { label = 'May' },
      { label = 'June' },
      { label = 'July' },
      { label = 'August' },
      { label = 'September' },
      { label = 'October' },
      { label = 'November' },
      { label = 'December' },
    })
  end

  ---Resolve completion item (optional). This is called right before the completion is about to be displayed.
  ---Useful for setting the text shown in the documentation window (`completion_item.documentation`).
  ---@param completion_item lsp.CompletionItem
  ---@param callback fun(completion_item: lsp.CompletionItem|nil)
  function source:resolve(completion_item, callback)
    callback(completion_item)
  end

  ---Executed after the item was selected.
  ---@param completion_item lsp.CompletionItem
  ---@param callback fun(completion_item: lsp.CompletionItem|nil)
  function source:execute(completion_item, callback)
    callback(completion_item)
  end
-- copilot please exit
--   ---Register your source to nvim-cmp.
require('cmp').register_source('month', source)

require('copilot_cmp').setup()
