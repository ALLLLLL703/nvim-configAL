-- ======================================
--     lua/plugins/lsp/lspconfig.lua
--       (neovim/nvim-lspconfig Plugin)
-- ======================================
-- 插件仓库: https://github.com/neovim/nvim-lspconfig
-- 文档链接: https://github.com/neovim/nvim-lspconfig/blob/master/doc/lspconfig.txt
-- 支持的 LSP 服务器列表: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

return {
    'neovim/nvim-lspconfig',
    -- LSPconfig 依赖于 Mason 和 Mason-Lspconfig，确保它们已加载。
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },

    -- 事件驱动加载 (Lazy Loading):
    -- LSP 应该在文件类型识别后立即加载，以便为对应文件提供语言服务。
    event = "BufReadPre", -- 在读取缓冲区之前加载，确保 LSP 在文件打开时可用

    -- 配置函数：当插件加载时执行
    config = function()
    local lspconfig = require('lspconfig')
    -- `capabilities` 对象会告诉 LSP 服务器你的客户端支持哪些功能。
    -- 稍后集成 nvim-cmp 时，我们还会在这里添加 cmp_nvim_lsp 的能力。
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- ======================================
    -- LSP 附加事件 (`on_attach` 回调函数)
    -- ======================================
    -- 当 LSP 客户端成功附加到缓冲区时，这个函数会被调用。
    -- 这是设置 LSP 相关键位映射、自动命令等操作的最佳位置。
    local on_attach = function(client, bufnr)
    -- ==============================
    -- 1. 自动格式化 (Format on Save)
    -- ==============================
    -- 如果语言服务器支持 `textDocument/formatting` 方法，则在保存文件时自动格式化。
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = 'LspFormatting', buffer = bufnr }) -- 清除旧的自动命令
        vim.api.nvim_create_autocmd("BufWritePost", {
            group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }), -- 创建新的自动命令组
            buffer = bufnr, -- 仅对当前缓冲区生效
            callback = function()
            vim.lsp.buf.format({ bufnr = bufnr }) -- 触发 LSP 格式化
            end,
            desc = "Auto format on save with LSP"
        })
        end

        -- ==============================
        -- 2. LSP 键位映射
        -- ==============================
        -- 在这里设置 LSP 相关的键位映射。
        -- 我们在这里直接定义一些常用的键位映射，通常这些键位会前缀 `<leader>`。
        -- 你可以根据自己的喜好修改这些键位。
        local map = vim.keymap.set
        local opts = { buffer = bufnr, noremap = true, silent = true } -- 键位映射选项

        -- 定义跳转
        map('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, { desc = "LSP: Go to Declaration" }))
        map('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = "LSP: Go to Definition" }))
        map('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = "LSP: Go to Implementation" }))
        map('n', 'gt', vim.lsp.buf.type_definition, vim.tbl_extend('force', opts, { desc = "LSP: Go to Type Definition" }))

        -- 文档与信息
        map('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = "LSP: Hover Documentation" }))
        map('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = "LSP: Find References" }))
        map('n', '<leader>k', vim.lsp.buf.signature_help, vim.tbl_extend('force', opts, { desc = "LSP: Signature Help" }))

        -- 代码操作与重构
        map('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = "LSP: Rename Symbol" }))
        map('n', '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = "LSP: Code Action" }))

        -- 诊断信息导航
        map('n', '[d', vim.diagnostic.goto_prev, vim.tbl_extend('force', opts, { desc = "LSP: Go to Previous Diagnostic" }))
        map('n', ']d', vim.diagnostic.goto_next, vim.tbl_extend('force', opts, { desc = "LSP: Go to Next Diagnostic" }))
        map('n', '<leader>D', vim.diagnostic.open_float, vim.tbl_extend('force', opts, { desc = "LSP: Open Diagnostic Float" }))
        map('n', '<leader>q', vim.diagnostic.set_loclist, vim.tbl_extend('force', opts, { desc = "LSP: Set Diagnostic Loclist" }))

        -- 格式化（手动触发）
        map('n', '<leader>fm', function() vim.lsp.buf.format({ async = true }) end, vim.tbl_extend('force', opts, { desc = "LSP: Format Document" }))

        print("LSP attached to buffer " .. bufnr .. " for client: " .. client.name) -- 调试打印
        end

        -- ======================================
        -- LSP 服务器的通用设置处理
        -- ======================================
        -- Mason-Lspconfig 会调用这个 `setup_handlers` 来为每个安装的 LSP 服务器应用配置。
        require('mason-lspconfig').setup_handlers({
            -- 默认处理函数：为所有未特殊配置的 LSP 服务器应用此设置
            function(server_name)
            -- **添加一个检查，确保 server_name 在 lspconfig 中存在**
            if lspconfig[server_name] then
                lspconfig[server_name].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    -- root_dir = lspconfig.util.root_pattern(".git", "Makefile", "package.json"),
                })
                print("Mason-Lspconfig handled server: " .. server_name)
                else
                    -- **如果 lspconfig 中没有这个服务器，打印警告信息**
                    print("WARNING: lspconfig does not have a setup for server: " .. server_name .. ". Please check config name or ensure lspconfig supports it.")
                    end
                    end,

                    -- ... (下面的特定 LSP 服务器配置，如 lua_ls 保持不变) ...
        })

            -- ==============================
            -- 示例：TypeScript Language Server (tsserver)
        -- ==============================
        -- tsserver = function()
        --   lspconfig.tsserver.setup({
        --     on_attach = on_attach,
        --     capabilities = capabilities,
        --     root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
                                                  --     settings = {
                                                  --       typescript = {
                                                  --         inlayHints = {
                                                  --           enumMemberValues = { enabled = true },
                                                  --           functionLikeReturnTypes = { enabled = true },
                                                  --           parameterNames = { enabled = "all" },
                                                  --           parameterTypes = { enabled = true },
                                                  --           propertyDeclarationTypes = { enabled = true },
                                                  --           variableTypes = { enabled = true },
                                                  --         },
                                                  --       },
                                                  --       javascript = {
                                                  --         inlayHints = {
                                                  --           enumMemberValues = { enabled = true },
                                                  --           functionLikeReturnTypes = { enabled = true },
                                                  --           parameterNames = { enabled = "all" },
                                                  --           parameterTypes = { enabled = true },
                                                  --           propertyDeclarationTypes = { enabled = true },
                                                  --           variableTypes = { enabled = true },
                                                  --         },
                                                  --       },
                                                  --     },
                                                  --   })
        --   print("Custom setup for tsserver called.")
        -- end,

        -- ==============================
        -- 示例：Python Language Server (pyright)
        -- ==============================
        -- pyright = function()
        --   lspconfig.pyright.setup({
        --     on_attach = on_attach,
        --     capabilities = capabilities,
        --     root_dir = lspconfig.util.root_pattern("pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git"),
                                                  --     settings = {
                                                  --       python = {
                                                  --         analysis = {
                                                  --           autoSearchPaths = true,
                                                  --           useLibraryCodeForTypes = true,
                                                  --           diagnosticMode = "workspace",
                                                  --           -- 更多的 pyright 特定设置
                                                  --         }
                                                  --       }
                                                  --     }
                                                  --   })
        --   print("Custom setup for pyright called.")
        -- end,

        -- 更多语言服务器...


        -- ======================================
        -- Neovim 内置诊断功能配置 (vim.diagnostic)
        -- ======================================
        -- 当 LSP 服务器报告错误、警告或提示时，这些诊断信息会显示在你的文件中。
        vim.diagnostic.config({
            virtual_text = { -- 虚拟文本显示诊断信息 (行内显示)
                enable = true,
                -- prefix = '●', -- 前缀图标
                spacing = 4,   -- 文本间距
            },
            signs = true,     -- 在行号旁边显示诊断符号
            update_in_insert = false, -- 在插入模式下不更新诊断，避免打字时闪烁
            severity_sort = true,     -- 严重性排序，错误优先
            float = {         -- 浮动窗口显示诊断详情
                source = "always", -- 总是显示来源
                focusable = false, -- 窗口不可聚焦
                border = "rounded", -- 边框样式
                header = "",        -- 头部文本
                prefix = "",        -- 前缀图标
            },
        })
        print("Vim diagnostics config set.") -- 调试打印
        end,
}
