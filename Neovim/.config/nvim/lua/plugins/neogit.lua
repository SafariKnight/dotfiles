return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {},
  keys = function ()
    local git = require('neogit')

    return {
      { "<leader>gg", function() git.open({kind = "split_above"}) end, desc = "Open Neogit"},
      { "<leader>gc", function() git.open({"commit", kind = "split_above"}) end, desc = "Git Commit"}
    }
  end
}
