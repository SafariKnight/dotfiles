return {
  "folke/trouble.nvim",
  init = function()
    vim.keymap.set(
      "n",
      "<leader>tt",
      "<CMD>TroubleToggle workspace_diagnostics<CR>",
      { desc = "Toggle Trouble" }
    )
    vim.keymap.set("n", "]d", function()
      require("trouble").next({ skip_groups = true, jump = true })
    end, { desc = "Next Diagnostic (Trouble)" })
    vim.keymap.set("n", "[d", function()
      require("trouble").previous({ skip_groups = true, jump = true })
    end, { desc = "Previous Diagnostic (Trouble)" })
  end,
  cmd = { "Trouble", "TroubleToggle" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
}
