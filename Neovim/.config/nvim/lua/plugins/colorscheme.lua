return {
  {
  "rebelot/kanagawa.nvim",
  lazy = false,
  enabled = false,
  priority = 1000,
  opts = {
  },
  init = function()
    vim.cmd.colorscheme("kanagawa")
  end,
  },
  {
    "tiagovla/tokyodark.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    init = function()
      vim.cmd.colorscheme("tokyodark")
    end,
  }
}
