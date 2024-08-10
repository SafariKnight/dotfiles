return {
  'stevearc/oil.nvim',
  opts = {},
  cmd = { "Oil" },
  keys = {
    { "<leader>fm", "<CMD>Oil<CR>", desc = "File Manager" }
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
