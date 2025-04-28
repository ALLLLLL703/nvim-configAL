return {
  {
    "sbdchd/neoformat",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.g.neoformat_json_jq = {
        exe = "jq",
        args = { "." },
        stdin = 1,
      }
      vim.g.neoformat_enabled_json = { "jq" }
      vim.g.neoformat_basic_format_align = 1
      vim.g.neoformat_basic_format_retab = 1
      vim.g.neoformat_basic_format_trim = 1
    end,
    keys = {
      { "<leader>fm", ":Neoformat<CR>", desc = "Format JSON" },
    },
  },
}
