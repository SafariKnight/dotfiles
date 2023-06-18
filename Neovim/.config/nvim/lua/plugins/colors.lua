return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  -- enabled = false,
  lazy = false,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha', -- Only flavour I liked tbh
      custom_highlights = function(colors)
        return { -- Borderless Telescope
          TelescopeTitle = { bg = colors.flamingo, fg = colors.base },
          TelescopeNormal = { bg = colors.mantle, fg = colors.text },
          TelescopeBorder = { bg = colors.mantle, fg = colors.mantle },
          TelescopePromptTitle = { bg = colors.mantle, fg = colors.mantle },
          TelescopePromptCounter = { bg = colors.mantle, fg = colors.mantle },
          TelescopeResultsNormal = { bg = colors.crust, fg = colors.text },
          TelescopeResultsBorder = { bg = colors.crust, fg = colors.crust },
          CmpGhostText = { fg = colors.overlay2 },
        }
      end,
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
