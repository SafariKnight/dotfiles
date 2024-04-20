return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    options = {
      transparent = false,
      styles = {           -- Style to be applied to different syntax groups
        comments = "italic", -- Value is any valid attr-list value `:help attr-list`
        conditionals = "italic",
        constants = "NONE",
        functions = "bold",
        keywords = "italic",
        numbers = "NONE",
        operators = "NONE",
        strings = "NONE",
        types = "NONE",
        variables = "italic",
      },
    },
  },
  init = function()
    vim.cmd.colorscheme("carbonfox")
  end,
}
