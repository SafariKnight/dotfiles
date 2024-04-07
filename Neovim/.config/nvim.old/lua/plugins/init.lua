return {
  {
    "unblevable/quick-scope",
    event = "BufReadPre",
  },
  {
    "dgagn/diagflow.nvim",
    event = "LspAttach",
    opts = {},
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   event = "UiEnter",
  --   main = "ibl",
  --   opts = {},
  -- },
  {
    "NvChad/nvim-colorizer.lua",
    main = "colorizer",
    ft = { "css", "lua" },
    enabled = true,
    opts = {
      user_default_options = {
        css = true,
        mode = "background",
      },
    },
  },
}
