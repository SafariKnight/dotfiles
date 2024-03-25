return {
  {
    "unblevable/quick-scope",
    event = "BufReadPre",
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>m", "<CMD>Oil --float<CR>", desc = "Oil File Manager" },
    },
    opts = {},
  },
  {
    "dgagn/diagflow.nvim",
    event = "LspAttach",
    opts = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "UiEnter",
    main = "ibl",
    opts = {},
  },
  -- {
  --   "uga-rosa/ccc.nvim",
  --   ft = "css",
  --   config = function()
  --     local ccc = require("ccc")
  --     ccc.setup({
  --       highlighter = {
  --         auto_enable = true,
  --         lsp = true,
  --       },
  --       lsp = true,
  --       inputs = {
  --         ccc.input.hsl,
  --         ccc.input.oklch,
  --       },
  --       outputs = {
  --         ccc.output.css_hsl,
  --         ccc.output.css_oklch,
  --       },
  --     })
  --   end,
  --   cmd = { "CccPick", "CccConvert" },
  -- },
  {
    "NvChad/nvim-colorizer.lua",
    main = "colorizer",
    ft = { "css" },
    enabled = true,
    opts = {
      user_default_options = {
        css = true,
        mode = "background",
      },
    },
  },
}
