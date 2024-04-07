return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    map("n", "<leader>m", function()
      require("oil").open()
    end, { desc = "File Manager" })
  end,
  opts = {},
}
