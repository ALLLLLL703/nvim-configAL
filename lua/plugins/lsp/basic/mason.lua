-- ======================================
--     lua/plugins/lsp/mason.lua
--       (williamboman/mason.nvim Plugin)
-- ======================================
-- 插件仓库: https://github.com/williamboman/mason.nvim
-- 文档链接: https://github.com/williamboman/mason.nvim/blob/main/doc/mason.txt

return {
  {'williamboman/mason.nvim',
  -- tag = 'v1.0.0', -- 可以指定版本，但通常跟随主分支以获取最新功能和服务器支持。

  -- 事件驱动加载 (Lazy Loading):
  -- Mason 可以在 Neovim 启动时就加载，因为它不直接影响编辑性能，主要用于管理工具。
  -- 或者，只有当你执行 `:Mason` 命令时才加载。
  event = "VimEnter", -- 在 VimEnter 事件时加载，确保在 Neovim 启动后可用

  -- 配置函数：当插件加载时执行
  config = function()
    require('mason').setup({
      -- 自动安装缺失的工具。
      -- 如果设置为 true，ensure_installed 列表中的工具会在启动时自动安装。
      automatic_installation = true,

      -- 安装完成后自动清理下载的压缩包。
      auto_clean = true,

      -- 确保这些包已安装。
      -- 这是一个列表，你可以在这里列出你希望 Mason 自动安装的工具名称（如 LSP 服务器）。
      -- 默认值是空列表。
      -- 示例：
      -- ensure_installed = {
      --   "lua-language-server",
      --   "stylua", -- 一个 Lua 格式化工具
      --   "debugpy", -- 一个 Python 调试器
      -- },

      -- 日志级别。
      log_level = vim.log.levels.INFO,

      -- UI 配置。
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
        -- hide_package_description = false,
        -- show_package_version = true,
        -- width = 0.8,
        -- height = 0.8,
        -- wrap_lines = false,
      },

      -- 异步执行的并发任务数。
      -- max_concurrent_installers = 4,

      -- 自定义 Mason 包的安装目录。通常不需要修改。
      -- install_root_dir = vim.fn.stdpath("data") .. "/mason",

      -- 自定义注册表源。通常不需要修改。
      -- registries = {
      --   "github:mason-org/mason-registry",
      -- },

      -- 自定义二进制文件的符号链接位置。通常不需要修改。
      -- bin_dir = nil,

      -- 自定义下载客户端。如果你的网络有特殊要求，可以考虑。
      -- fetch_remote_client = function(url, dest)
      --   -- 示例: 使用 curl 命令下载文件
      --   -- vim.fn.system({"curl", "-L", "-o", dest, url})
      -- end,
    })
    print("Mason.nvim setup completed.") -- 调试打印
  end,

  },
  {
    'williamboman/mason-lspconfig.nvim',
    -- Mason-Lspconfig 依赖于 Mason，所以需要确保 Mason 已经加载。
    dependencies = { 'williamboman/mason.nvim' },

    -- 事件驱动加载 (Lazy Loading):
    -- 通常 Mason-Lspconfig 会在 Neovim 启动时就加载，因为它负责自动设置 LSP。
    event = "VimEnter",

    -- 配置函数：当插件加载时执行
    config = function()
    require('mason-lspconfig').setup({
      -- 自动安装 ensure_installed 列表中列出的语言服务器。
      -- 强烈建议设置为 true，这样你就不需要手动运行 `:MasonInstall`。
      automatic_installation = true,

      -- 确保这些 LSP 服务器已安装。
      -- 这些是 `mason.nvim` 中显示的包名。
      ensure_installed = {
        "lua_ls",         -- Lua Language Server for Neovim configuration
        -- "tsserver",       -- TypeScript / JavaScript Language Server
        -- "pyright",        -- Python Language Server
        -- "html",           -- HTML Language Server
        -- "cssls",          -- CSS Language Server
        -- "jsonls",         -- JSON Language Server
        -- "yamlls",         -- YAML Language Server
        -- "bashls",         -- Bash Language Server
      },

      -- `setup_handlers` 是 Mason-Lspconfig 的核心。
      -- 它允许你为每个 LSP 服务器定义如何调用 `lspconfig.setup()`。
      -- 我们这里暂时只设置一个**默认处理函数**。
      -- 后续在 `nvim-lspconfig` 配置中，我们会提供一个更通用的 `on_attach` 回调函数。
      setup_handlers = {
        -- 默认处理函数：为所有未指定特定处理的 LSP 服务器调用 `lspconfig.setup()`
        -- `server_name` 是当前 Mason-Lspconfig 正在处理的 LSP 服务器的名称。
        function(server_name)
        require('lspconfig')[server_name].setup({}) -- 暂时只调用空 setup，不传入任何选项。
        -- 真正的配置（如 on_attach）将在 `nvim-lspconfig` 中处理。
        end,

        -- 你也可以为特定服务器提供自定义处理函数，例如：
        -- lua_ls = function()
    --   require('lspconfig').lua_ls.setup({
    --     -- 这里放置 lua_ls 的特定配置，它将覆盖默认处理函数
    --     -- 例如：
    --     -- settings = {
    --     --   Lua = {
    --     --     workspace = {
    --     --       library = vim.api.nvim_get_runtime_and_data_path(),
                                     --     --     },
                                     --     --   },
                                     --     -- },
                                     --   })
    -- end,
      },

      -- 是否禁用某些语言服务器的自动设置。
      -- exclude = {},
    })
    print("Mason-Lspconfig.nvim setup completed.") -- 调试打印
    end,
  },
}
