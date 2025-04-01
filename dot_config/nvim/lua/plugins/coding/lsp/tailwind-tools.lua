-- tailwind-tools.lua
return {
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "neovim/nvim-lspconfig",
  },
  lazy = false,
  keys = {
    {
      "<localleader>twc",
      "<CMD>TailwindConcealToggle<CR>",
      desc = "Tailwind Conceal Toggle",
    },
    {
      "<localleader>tws",
      "<CMD>TailwindSort<CR>",
      desc = "Tailwind Sort Classes",
    },
  },
  opts = {
    server = {
      override = false,
    },
    conceal = {
      enabled = true,
      symbol = "…",
    },
    document_color = {
      enabled = true, -- can be toggled by commands
      kind = "inline", -- "inline" | "foreground" | "background"
      inline_symbol = "󰝤 ", -- only used in inline mode
      debounce = 200, -- in milliseconds, only applied in insert mode
    },
  },
}
