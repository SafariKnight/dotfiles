local opts = {
  surround = {
    mappings = {
      add = "gza",
      delete = "gzd",
      find = "gzf",
      find_let = "gzF",
      highlight = "gzh",
      replace = "gzr",
      update_n_lines = "gzn",

      suffix_last = "l",
      suffix_next = "n",
    },
  },
}


local activate = function(plugin)
  require("mini." .. plugin).setup(opts[plugin])
end

activate("ai")
activate("comment")
activate("pairs")
activate("statusline")
activate("surround")
