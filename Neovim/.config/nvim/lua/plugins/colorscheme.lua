return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
      flavour = "mocha",
      styles = { -- Style to be applied to different syntax groups
        comments = { "italic" }, -- Value is any valid attr-list value `:help attr-list`
        conditionals = { "italic" },
      },
    },
    init = function()
      vim.cmd.colorscheme("catppuccin")
    end,
    enabled = false,
  },
  {
    "gbprod/nord.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      -- local p = require("nordic.colors")
      -- local p = require("nordic.colors")
      require("nord").setup({
        styles = { -- Style to be applied to different syntax groups
          comments = { italic = true }, -- Value is any valid attr-list value `:help attr-list`
          conditionals = { italic = true },
        },
        override = {
          FzfLuaFzfGutter = {
            bg = "transparent",
          },
        },
        on_highlights = function(highlights, colors)
        end,
      })
      vim.cmd.colorscheme("nord")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    opts = {
      options = {
        transparent = true,
        styles = { -- Style to be applied to different syntax groups
          comments = "italic", -- Value is any valid attr-list value `:help attr-list`
          conditionals = "italic",
          constants = "NONE",
          functions = "NONE",
          keywords = "italic",
          numbers = "NONE",
          operators = "NONE",
          strings = "NONE",
          types = "NONE",
          variables = "NONE",
        },
      },
    },
    init = function()
      vim.cmd.colorscheme("carbonfox")
    end,
  },
  -- {
  --   "navarasu/onedark.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = "dark",
  --
  --     highlights = {},
  --     code_style = {             -- Style to be applied to different syntax groups
  --         comments = "italic", -- Value is any valid attr-list value `:help attr-list`
  --         conditionals = "italic",
  --         constants = "NONE",
  --         functions = "NONE",
  --         keywords = "italic",
  --         numbers = "NONE",
  --         operators = "NONE",
  --         strings = "NONE",
  --         types = "NONE",
  --         variables = "NONE",
  --       },
  --   },
  --   init = function ()
  --     vim.cmd.colorscheme("onedark")
  --   end
  -- },
}
