-- The superior way to do diagnostics
return {
  "folke/trouble.nvim",
  init = function()
    map(
      "n",
      "<leader>xx",
      "<CMD>TroubleToggle workspace_diagnostics<CR>",
      { desc = "Trouble" }
    )
    map("n", "]d", function()
      require("trouble").next({ skip_groups = true, jump = true })
    end, { desc = "Next Diagnostic (Trouble)" })
    map("n", "[d", function()
      require("trouble").previous({ skip_groups = true, jump = true })
    end, { desc = "Previous Diagnostic (Trouble)" })
  end,
  cmd = { "Trouble", "TroubleToggle" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
}
