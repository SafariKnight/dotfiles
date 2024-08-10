return {
  "vhyrro/luarocks.nvim",
  priority = 1001, -- this plugin needs to run before anything else
  lazy = false,
  enabled = false,
  opts = {
    rocks = { "magick" },
  },
}
