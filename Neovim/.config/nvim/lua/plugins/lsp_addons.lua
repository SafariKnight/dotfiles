return {
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup()
      require("utils.map").load_mapping("lspsaga")
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" }
  }
}
