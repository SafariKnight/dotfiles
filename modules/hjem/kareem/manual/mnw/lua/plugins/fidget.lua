return {
  "fidget.nvim",
  -- event = "LspAttach",
  lazy = false,
  after = function()
    require("fidget").setup {}
  end,
}
