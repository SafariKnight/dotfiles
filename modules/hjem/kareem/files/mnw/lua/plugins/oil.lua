return {
  "oil.nvim",
  cmd = "Oil",
  keys = {
    { "<leader>e", "<CMD>Oil<CR>", desc = "File Buffer" },
  },
  after = function()
    require("oil").setup()
  end,
}
