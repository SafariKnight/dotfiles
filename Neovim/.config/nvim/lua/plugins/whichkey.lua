return {
  "folke/which-key.nvim",
  lazy = false,
  event = "VeryLazy",
  opts = {
    -- operators = {
    --   gc = "Comment",
    -- },
    -- replace = {
    --   ["<space>"] = "SPC",
    --   ["<leader>"] = "SPC",
    --   ["<CR>"] = "RET",
    --   ["<tab>"] = "TAB",
    -- },
    icons = {
      breadcrumb = "", -- symbol used in the command line area that shows your active key combo
      separator = " ", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    wk.add({
      { "<leader>c", group = "code" },
      { "<leader>f", group = "find" },
    })

    wk.add({
      { "cr", group = "refactor" },
      -- ["crr"] = { name = "Code Action" },
      -- ["crn"] = { name = "Rename Symbol"}
    })
  end,
}
