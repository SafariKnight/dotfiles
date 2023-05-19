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
  }
}
