return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
      flavour = "mocha",
      styles = {                 -- Style to be applied to different syntax groups
        comments = { "italic" }, -- Value is any valid attr-list value `:help attr-list`
        conditionals = { "italic" },
      },
    },
    init = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  -- {
  --   "EdenEast/nightfox.nvim",
  --   lazy = false,
  --   enabled = false,
  --   priority = 1000,
  --   opts = {
  --     options = {
  --       transparent = false,
  --       styles = {             -- Style to be applied to different syntax groups
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
  --     },
  --   },
  --   init = function()
  --     vim.cmd.colorscheme("carbonfox")
  --   end,
  -- },
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
