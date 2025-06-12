-- lua/plugins/lsp/mason.lua (仅作参考，下面才是实际代码)

require('mason').setup({
  -- 自动安装缺失的工具 (LSP, DAP, Linter, Formatter)。
  -- 如果设置为 true，当你在 ensure_installed 列表中添加了工具但未安装时，Mason 会在启动时自动安装。
  -- 默认为 true。
  automatic_installation = true,

  -- 安装完成后自动清理下载的压缩包和安装脚本。
  -- 默认为 true。
  auto_clean = true,

  -- Mason 包的安装目录。
  -- 默认为 vim.fn.stdpath("data") .. "/mason"，通常不需要修改。
  -- install_root_dir = vim.fn.stdpath("data") .. "/mason",

  -- 确保这些包已安装。
  -- 这是一个列表，你可以在这里列出你希望 Mason 自动安装的工具名称（如 LSP 服务器）。
  -- 仅在 `automatic_installation = true` 时生效。
  -- 默认值是空列表。
  ensure_installed = {}, -- 例如: { "lua-language-server", "stylua", "debugpy" }

  -- 日志级别。用于调试 Mason 自身的问题。
  -- 可选值: "trace", "debug", "info", "warn", "error", "off"。
  -- 默认为 "info"。
  log_level = vim.log.levels.INFO,

  -- 注册表源。Mason 从这里获取可安装的包列表。
  -- 默认为官方 GitHub 仓库。通常不需要修改。
  -- registries = {
  --   "github:mason-org/mason-registry",
  -- },

  -- UI 配置。定义 Mason 交互式界面的外观。
  ui = {
    -- 窗口边框样式。
    -- 可选值: "none", "single", "double", "rounded", "solid"。
    -- 默认为 "none"。
    border = "rounded",

    -- 包图标。
    -- 定义在 Mason UI 中显示的包状态图标。
    icons = {
      package_installed = "✓",     -- 已安装包的图标
      package_pending = "➜",       -- 正在安装/更新包的图标
      package_uninstalled = "✗",   -- 未安装包的图标
    },

    -- 是否在 UI 中隐藏包的描述。
    -- 默认为 false。
     hide_package_description = true,

    -- 是否在 UI 中显示包版本。
    -- 默认为 true。
    -- show_package_version = true,

    -- UI 窗口的宽度和高度 (相对于 Neovim 窗口)。
    -- 0 表示自动调整。
    -- width = 0.8,
    -- height = 0.8,

    -- 是否包裹 UI 文本行。
    -- 默认为 false。
    -- wrap_lines = false,
  },

  -- 异步执行的并发任务数。
  -- 默认为 4。
  -- max_concurrent_installers = 4,

  -- 自定义二进制文件的符号链接位置。
  -- 默认为 Mason 内部管理的路径。通常不需要修改。
  -- bin_dir = nil,

  -- 自定义下载客户端。
  -- 默认为 Neovim 内置的 HTTP 客户端。
  -- 如果你的网络环境有特殊要求（如代理），可能需要自定义。
  -- fetch_remote_client = function(url, dest)
  --   -- 示例: 使用 curl 命令下载文件
  --   -- vim.fn.system({"curl", "-L", "-o", dest, url})
  -- end,
})
-- lua/plugins/lsp/mason-lspconfig.lua (仅作参考，下面才是实际代码)

require('mason-lspconfig').setup({
  -- 自动安装确保在列表中存在的语言服务器。
  -- 如果设置为 true，并且你将服务器名称添加到 `ensure_installed` 列表，
  -- Mason 会在启动时自动安装它们。
  -- 默认为 false。
  automatic_installation = true,

  -- 一个字符串列表，列出你希望确保安装的 LSP 服务器名称。
  -- 这些名称需要与 `mason.nvim` 中显示的包名一致 (例如 "lua_ls", "tsserver")。
  -- 仅在 `automatic_installation = true` 时生效。
  -- 默认为空列表。
  ensure_installed = {}, -- 例如: { "lua_ls", "tsserver", "pyright" }

  -- 一个函数，用于在 `mason-lspconfig` 设置每个 LSP 服务器时调用。
  -- 这是一个高级选项，通常与 `handlers` 配合使用。
  -- on_server_ready = function(server_name, root_dir) end,

                                 -- 一个表格，定义如何为每个 LSP 服务器设置 `lspconfig`。
                                 -- 这是 `mason-lspconfig` 最核心的配置点。
                                 -- 你可以在这里为特定服务器提供自定义设置，或为所有服务器提供一个默认设置。
                                 -- setup_handlers = {
                                 --   -- 默认处理函数：为所有未特殊配置的 LSP 服务器应用此设置。
                                 --   -- `server_name`: 当前处理的 LSP 服务器名称 (例如 "lua_ls")。
                                 --   function(server_name)
--     require("lspconfig")[server_name].setup({}) -- 默认情况下，只调用 lspconfig.setup()
--   end,
--   -- 特定服务器的自定义处理函数：
--   -- lua_ls = function()
--   --   require("lspconfig").lua_ls.setup({
--   --     -- 这里放置 lua_ls 的特定配置
--   --   })
--   -- end,
--   -- tsserver = function()
--   --   require("lspconfig").tsserver.setup({
--   --     -- 这里放置 tsserver 的特定配置
--   --   })
--   -- end,
-- },

-- 是否禁用某些语言服务器的自动设置。
-- 这是一个字符串列表，列出不希望 `mason-lspconfig` 自动设置的 LSP 服务器名称。
-- 默认为空列表。
-- exclude = {},
})
-- mason.lua
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({
 on_init = function(client)
  local path = client.workspace_folders[1].name
  if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
   client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
    Lua = {
     runtime = {
      version = "LuaJIT",
     },
     workspace = {
      checkThirdParty = false,
      library = {
       vim.env.VIMRUNTIME,
      },
     },
    },
   })

   client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end
  return true
 end,
})
