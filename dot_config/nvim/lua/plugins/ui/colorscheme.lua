return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",

    styles = { -- `:help attr-list`
      comments = { "italic" },
      conditionals = { "italic" },
    },
    custom_highlights = function(c)
      return {
        BlinkCmpGhostText = {
          fg = c.subtext0,
        },
        SignColumn = {
          fg = c.mauve,
        },
      }
    end,
  },
  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
