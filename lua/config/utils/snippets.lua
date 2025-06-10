-- ~/.config/nvim/lua/my_utils/wrap_snippets.lua

local M = {}

local telescope = require("telescope.builtin")
local luasnip = require("luasnip")

-- 获取所有以 '_sel' 结尾的片段，并按语言过滤
local function get_wrap_snippets()
  local current_ft = vim.bo.filetype -- 获取当前文件类型
  local all_snippets = luasnip.get_snippets(current_ft) -- 获取当前语言的所有片段

  local wrap_snippets = {}
  for _, snippet in ipairs(all_snippets) do
    -- 过滤出以 '_sel' 结尾的片段
    if string.match(snippet.trigger, "_sel$") then
      table.insert(wrap_snippets, {
        value = snippet.trigger, -- 片段的触发词作为值
        display = snippet.trigger:gsub("_sel$", ""), -- 显示的名称，去掉 _sel 后缀
        -- 可以添加更多信息，例如 snippet.description
        description = snippet.description or "",
      })
    end
  end

  -- 对结果进行排序，让常用的片段靠前
  table.sort(wrap_snippets, function(a, b)
    -- 可以根据你的偏好调整排序逻辑
    local order = {
      ["if"] = 1,
      ["for"] = 2,
      ["while"] = 3,
      ["do"] = 4,
      -- ... 其他
    }
    return (order[a.display] or 99) < (order[b.display] or 99)
  end)

  return wrap_snippets
end

-- 触发 Telescope Picker
M.wrap_with_snippet_picker = function()
  -- 确保在 Visual 模式下
  local mode = vim.fn.mode()
  if mode ~= "v" and mode ~= "V" and mode ~= "V" then
    vim.notify("请先在 Visual 模式下选择文本!", vim.log.WARN)
    return
  end

  -- 获取当前选中的文本
  -- 在 Telescope 启动后，Visual 模式会退出，所以我们需要提前保存选区
  -- 最简单的方法是利用 gv （re-select last visual selection）结合 LuaSnip
  -- 但 Telescope 的 picker 行为会干扰 gv，所以这里依赖 LuaSnip 自动获取 TM_SELECTED_TEXT
  -- 确保你的 LuaSnip 片段有 `$TM_SELECTED_TEXT` 占位符

  local snippets_to_show = get_wrap_snippets()

  if #snippets_to_show == 0 then
    vim.notify("当前语言没有找到可用的环绕片段。", vim.log.INFO)
    return
  end

  telescope.pickers
    .new({}, {
      prompt_title = "环绕选区",
      finder = require("telescope.finders").new_table({
        results = snippets_to_show,
        entry_maker = function(entry)
          return {
            value = entry.value,
            display = entry.display .. " (" .. entry.description .. ")",
            ordinal = entry.display, -- 用于模糊匹配的字符串
          }
        end,
      }),
      sorter = require("telescope.sorters").get_fzy_sorter({}),
      attach_mappings = function(prompt_bufnr, map)
        -- 当选中一个片段时，触发 LuaSnip 展开
        map("i", "<CR>", function()
          local selection = require("telescope.actions.state").get_selected_entry()
          if selection then
            require("telescope.actions").close(prompt_bufnr)
            -- 触发 LuaSnip 展开。
            -- 在 Visual 模式下执行此函数时，LuaSnip 会自动从 TM_SELECTED_TEXT 环境变量中获取选中内容
            luasnip.snip_expand(nil, selection.value)
          end
        end)
        return true
      end,
    })
    :find()
end

return M
