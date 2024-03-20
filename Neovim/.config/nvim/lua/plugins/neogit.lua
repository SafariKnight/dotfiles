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
      { "<leader>gg", function() git.open({kind = "split_above"}) end, desc = "UI"},
      { "<leader>gc", function() git.open({"commit", kind = "split_above"}) end, desc = "Commit"},
      { "<leader>gP", function() git.open({"push", kind = "split_above"}) end, desc = "Push"},
      { "<leader>gp", function() git.open({"pull", kind = "split_above"}) end, desc = "Pull"},
    }
  end
}
