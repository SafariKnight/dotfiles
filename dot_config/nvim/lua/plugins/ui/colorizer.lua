return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = { -- set to setup table
    user_default_options = {
      names = false,
      css_fn = true,
    },
  },
}
