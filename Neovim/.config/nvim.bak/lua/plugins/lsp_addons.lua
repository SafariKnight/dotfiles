return{
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      lightbulb = {
        enable = false,
      },
      symbol_in_winbar = {
        separator = "  ",
      }
    },
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
    "j-hui/fidget.nvim",
		event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle", "TroubleClose", "TroubleRefresh"},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  }
}
