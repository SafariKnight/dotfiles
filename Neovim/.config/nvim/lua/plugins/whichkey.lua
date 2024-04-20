
return {
  "folke/which-key.nvim",
  lazy = false,
  event = "VeryLazy",
  opts = {
    operators = {
      gc = "Comment",
    },
    key_labels = {
      ["<space>"] = "SPC",
      ["<leader>"] = "SPC",
      ["<CR>"] = "RET",
      ["<tab>"] = "TAB",
    },
    icons = {
      breadcrumb = "", -- symbol used in the command line area that shows your active key combo
      separator = " ", -- symbol used between a key and it's label
      group = "+",     -- symbol prepended to a group
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    wk.register({
      c = { name = "code" },
      f = { name = "find" },
    }, {
      prefix = "<leader>",
    })

    wk.register({
      ["cr"] = { name = "refactor" },
      -- ["crr"] = { name = "Code Action" },
      -- ["crn"] = { name = "Rename Symbol"}
    })
  end,
}
