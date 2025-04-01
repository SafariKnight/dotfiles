return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  ---@type wk.Opts
  ---@diagnostic disable:missing-fields
  opts = {
    preset = "helix",
    icons = {
      breadcrumb = "", -- symbol used in the command line area that shows your active key combo
      separator = "", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
      ellipsis = "…",
      mappings = true,
    },
    replace = {
      key = {
        { "<Space>", "SPC" },
        { "<leader>", "SPC" },
        { ",", "COM" },
      },
    },
    spec = {
      { "<leader>f", group = "Find" },
      { ",", group = nil },
      {
        "<leader>b",
        group = "buffer",
        expand = function()
          return require("which-key.extras").expand.buf()
        end,
      },
      {
        "<leader>w",
        group = "windows",
        proxy = "<c-w>",
        expand = function()
          return require("which-key.extras").expand.win()
        end,
      },
      { "gx", desc = "Open with system app" },
    },
  },
  opts_extend = { "spec" },
}
