-- ======================================
--    lua/plugins/editor/treesitter.lua
--       (nvim-treesitter Plugin)
-- ======================================
-- 插件仓库: https://github.com/nvim-treesitter/nvim-treesitter
-- 文档链接: https://github.com/nvim-treesitter/nvim-treesitter/blob/master/doc/nvim-treesitter.txt

return {
    'nvim-treesitter/nvim-treesitter',
    -- tag: 推荐使用特定的 tag 来锁定版本，这里不强制指定，使用最新的稳定版。
    -- build 命令：在安装后自动运行，用于安装默认的解析器。
    -- `require('nvim-treesitter.install').update({ with_sync = true })`
    -- 这行代码会在插件安装后，自动更新所有已安装的解析器。
    -- 'vim.cmd("TSUpdate")' 也可以，但 Lua 版本更推荐。
    build = ':TSUpdate', -- 或 `function() require('nvim-treesitter.install').update({ with_sync = true }) end`,

    -- 事件驱动加载 (Lazy Loading):
    -- Treesitter 需要在 VimEnter 时加载，以确保语法高亮和其他功能能够立即生效。
    event = "VimEnter",

    -- 配置函数：当插件加载时执行
    config = function()
    local configs = require('nvim-treesitter.configs')

    configs.setup({
        -- 默认安装的语言解析器：
        -- 这些语言的解析器会在你第一次启动 Neovim 并安装 Treesitter 后自动安装。
        -- 建议添加你最常用的语言。
        ensure_installed = {
            "lua",        -- Neovim 配置语言
            "vim",        -- Vimscript
            "javascript", -- JavaScript
            "typescript", -- TypeScript
            "html",       -- HTML
            "css",        -- CSS
            "json",       -- JSON
            "yaml",       -- YAML
            "markdown",   -- Markdown
            "python",     -- Python
             "c",          -- C 语言
             "cpp",        -- C++
             "go",         -- Go 语言
             "rust",       -- Rust 语言
            "java",       -- Java 语言
        },

        -- 自动安装缺失的解析器：
        -- 当你打开一个文件，如果其文件类型对应的 Treesitter 解析器未安装，
        -- 是否自动安装它。建议开启。
        auto_install = true,

        -- 模块配置：
        -- 你可以启用或禁用 Treesitter 的各种功能模块。
        highlight = {
            enable = true, -- 启用语法高亮。这是 Treesitter 最核心的功能。
            -- disable = { "c", "rust" }, -- 禁用某些语言的高亮（如果内置高亮表现更好）
            -- additional_vim_regex_highlighting = false, -- 是否保留 Vim 传统的正则表达式高亮
        },
        indent = {
            enable = true, -- 启用基于 Treesitter 的智能缩进。
            -- 这通常比 Neovim 默认的缩进更准确。
            -- disable = { "python", "css" }, -- 禁用某些语言的智能缩进
        },
		})
    end,

}
