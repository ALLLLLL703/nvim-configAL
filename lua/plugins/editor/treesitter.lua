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
        -- 增量选择 (Textobjects):
        -- 允许你基于语法树选择代码块（例如函数、类、循环等）。
        -- 这需要额外的插件，如 `nvim-treesitter-textobjects`。
        -- textobjects = {
        --   select = {
        --     enable = true,
        --     lookahead = true, -- Extend the selection to the next node
        --     keymaps = {
        --       -- These are examples, you'd add this to your keymaps/plugin_keymaps.lua
        --       -- `aa` for around an argument, `if` for inside a function, etc.
        --       ['aa'] = '@parameter.outer',
        --       ['ia'] = '@parameter.inner',
        --       ['af'] = '@function.outer',
        --       ['if'] = '@function.inner',
        --       ['ac'] = '@class.outer',
        --       ['ic'] = '@class.inner',
        --     },
        --   },
        -- },

        -- 括号匹配 (Rainbow Parentheses):
        -- 使用不同的颜色高亮嵌套的括号，方便阅读。
        -- 需要 `nvim-treesitter-rainbow` 插件。
        -- rainbow = {
        --   enable = true,
        --   colors = {
        --     '#E06C75', -- red
        --     '#E5C07B', -- yellow
        --     '#98C379', -- green
        --     '#61AFEF', -- blue
        --     '#C678DD', -- purple
        --     '#56B6C2', -- cyan
        --   },
        --   disable = { "html" }, -- 禁用某些语言的彩虹括号
        --   query = 'rainbow-parens', -- 使用默认查询
        --   max_file_lines = nil, -- 最大文件行数，超过则禁用，nil 表示不限制
        -- },

        -- 上下文 (Context): 显示当前光标所在代码块的上下文（如函数定义、类名）。
        -- context_commentstring = { enable = true }, -- 自动生成注释字符串 (例如 // for C++, # for Python)
    })

    -- 如果你想要启用 Treesitter 的一些额外功能，如文本对象或彩虹括号，
    -- 你通常还需要安装相应的 Treesitter 插件，并在这里或独立的插件文件中进行配置。
    -- 例如：
    -- require('nvim-treesitter.configs').setup_and_attach("nvim-treesitter-textobjects", { ... })
    -- require('nvim-treesitter.configs').setup_and_attach("nvim-treesitter-rainbow", { ... })

    -- 在 Neovim 启动时，如果 'autocmd' 组中没有 'BufWritePre' 事件，
    -- 添加一个自动命令，在保存文件前（BufWritePre）运行 `TSUpdate` 来更新解析器。
    -- 这是一个可选的维护性操作。
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   group = vim.api.nvim_create_augroup("TSUpdateOnSave", { clear = true }),
    --   pattern = "*.lua,*.vim", -- 仅对 Lua 和 Vim 文件生效
    --   command = "silent TSUpdate",
    -- })
    end,
}
