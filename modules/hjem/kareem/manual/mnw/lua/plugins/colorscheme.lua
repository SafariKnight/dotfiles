return {
  "nightfox.nvim",
  colorscheme = "carbonfox",
  lazy = false,
  after = function()
    vim.cmd.colorscheme("carbonfox")

    local hl = vim.api.nvim_set_hl

    hl(0, "BlinkCmpMenu", {
      link = "Normal",
    })

    hl(0, "BlinkCmpMenuBorder", {
      link = "FloatBorder",
    })
  end,
}
