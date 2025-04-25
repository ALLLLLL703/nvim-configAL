-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("config.keymaps")
vim.opt.mouse:append("a")
return {
  {
    "skywind3000/asyncrun.vim",
    keys = {
      { "<leader>cc", ":AsyncRun g++ % -o %:r && ./%:r<CR>", desc = "Compile and Run C++" },
      {
        "<leader>ct",
        ":AsyncRun -mode=term -pos=bottom g++ % -o %:r && ./%:r<CR>",
        desc = "Compile and Run (Terminal)",
      },
      { "<leader>cs", ":AsyncStop<CR>", desc = "Stop AsyncRun" },
    },
    config = function()
      vim.g.asyncrun_open = 7
    end,
  },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      keymap = {
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-n>"] = { "select_next", "snippet_forward", "fallback" },
      },
      enabled = function()
        return vim.bo.buftype ~= "prompt"
      end,
    },
  },
}
