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
}
