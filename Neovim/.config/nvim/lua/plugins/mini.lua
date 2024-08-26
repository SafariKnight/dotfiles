return {
  "echasnovski/mini.nvim",
  version = "*",
  opts = {
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
  },
  config = function(_, opts)
    local activate = function(plugin)
      require("mini." .. plugin).setup(opts[plugin])
    end

    activate("ai")
    -- activate("animate")
    activate("comment")
    -- activate("icons") --why is this erroring
    activate("pairs")
    -- activate("statusline")
    activate("surround")
  end,
}
