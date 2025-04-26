return {
  {
    "catgoose/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          RRGGBBAA = true,
          hls_fn = true,
          rgb_fn = true,
        },
      })
    end,
  },
}
