local dap = require("dap")
local dapui = require("dapui")

-- 配置 DAP UI（与 dap.lua 保持一致）
dapui.setup({
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 40,
      position = "left",
    },
    {
      elements = { "repl", "console" },
      size = 10,
      position = "bottom",
    },
  },
})

-- 自动打开/关闭 DAP UI
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- 内联变量显示
require("nvim-dap-virtual-text").setup({
  enabled = true,
  virt_text_pos = "eol",
})

-- C/C++ 调试配置 (codelldb)
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = "codelldb", -- Mason 安装的路径
    args = { "--port", "${port}" },
    -- 如果手动安装，取消注释并指定路径：
    -- command = vim.fn.stdpath("data") .. "/codelldb/extension/adapter/codelldb",
  },
}

dap.configurations.cpp = {
  {
    name = "Launch C/C++ Program",
    type = "codelldb",
    request = "launch",
    program = function()
      -- 动态选择可执行文件路径，默认为当前工作目录
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {}, -- 可手动输入命令行参数
    -- 如果需要调试特定项目（如 CMake），取消注释：
    -- program = vim.fn.getcwd() .. "/build/your_executable",
  },
  {
    name = "Attach to Process",
    type = "codelldb",
    request = "attach",
    pid = require("dap.utils").pick_process,
    args = {},
  },
}

-- C 配置复用 C++ 配置
dap.configurations.c = dap.configurations.cpp

-- 快捷键（专为 C/C++ 调试）
vim.keymap.set("n", "<leader>dcpp", dap.continue, { desc = "DAP: Start/Continue C/C++ Debugging" })
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP: Set Conditional Breakpoint" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP: Toggle UI" })
vim.keymap.set("n", "<leader>dc", ":Telescope dap commands<CR>", { desc = "DAP: Commands" })
vim.keymap.set("n", "<leader>dl", ":Telescope dap list_breakpoints<CR>", { desc = "DAP: List Breakpoints" })
