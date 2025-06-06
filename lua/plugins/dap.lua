return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui", -- 调试 UI
      "theHamsta/nvim-dap-virtual-text", -- 内联变量
      "nvim-neotest/nvim-nio", -- DAP UI 依赖
      "mfussenegger/nvim-dap-python", -- Python 调试
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- 配置 DAP UI
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

      -- 配置 nvim-dap-virtual-text
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        virt_text_pos = "eol", -- 显示变量在行尾
      })

      -- 配置 Python 调试
      require("dap-python").setup("python") -- 使用系统 Python 或指定路径

      -- 快捷键
      vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Continue" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
      vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dB", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "DAP: Set Conditional Breakpoint" })
      vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })
      vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP: Toggle UI" })

      -- Telescope 集成
      require("telescope").load_extension("dap")
      vim.keymap.set("n", "<leader>dc", ":Telescope dap commands<CR>", { desc = "DAP: Commands" })
      vim.keymap.set("n", "<leader>dl", ":Telescope dap list_breakpoints<CR>", { desc = "DAP: List Breakpoints" })
    end,
  },
}
