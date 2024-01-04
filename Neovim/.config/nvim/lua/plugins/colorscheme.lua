return {
  -- Tokyonight {{{
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      require('tokyonight').setup {
        style = 'night',
        on_highlights = function(hl, c)
          hl.CmpGhostText = {
            fg = c.fg_dark,
          }
          -- hl.Normal = {
          --   bg = 'none',
          -- }
          -- hl.NormalFloat = {
          --   bg = 'none',
          -- }
        end,
      }
      vim.cmd.colorscheme 'tokyonight'
    end,
  },

  -- }}}

  -- Kanagawa {{{

  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      compile = true
    },
    config = function(_, opts)
      require('kanagawa').setup(opts)
      vim.cmd.colorscheme 'kanagawa'
    end
  }

  -- }}}

  -- Stuff {{{
  -- 'catppuccin/nvim',
  -- name = 'catppuccin',
  -- priority = 1000,
  -- enabled = false,
  -- lazy = false,
  -- config = function()
  --   require('catppuccin').setup {
  --     flavour = 'mocha', -- Only flavour I liked tbh
  --     custom_highlights = function(colors)
  --       return { -- Borderless Telescope
  --         TelescopeTitle = { bg = colors.flamingo, fg = colors.base },
  --         TelescopeNormal = { bg = colors.mantle, fg = colors.text },
  --         TelescopeBorder = { bg = colors.mantle, fg = colors.mantle },
  --         TelescopePromptTitle = {
  --           bg = colors.mantle,
  --           fg = colors.mantle,
  --         },
  --         TelescopePromptCounter = {
  --           bg = colors.mantle,
  --           fg = colors.mantle,
  --         },
  --         TelescopeResultsNormal = {
  --           bg = colors.crust,
  --           fg = colors.text,
  --         },
  --         TelescopeResultsBorder = {
  --           bg = colors.crust,
  --           fg = colors.crust,
  --         },
  --         CmpGhostText = { fg = colors.overlay2 },
  --       }
  --     end,
  --   }
  --   vim.cmd.colorscheme 'catppuccin'
  -- end,
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   -- dependencies = {
  --   --   { 'xiyaowong/transparent.nvim', opts = {} },
  --   -- },
  --   lazy = false,
  --   enabled = false,
  --   priority = 1000,
  --   config = function()
  --     require('rose-pine').setup {
  --       highlight_groups = {
  --         TelescopeTitle = { bg = 'love', fg = 'base' },
  --         TelescopeNormal = { bg = 'overlay', fg = 'text' },
  --         TelescopeBorder = { bg = 'overlay', fg = 'overlay' },
  --         TelescopePromptTitle = { bg = 'overlay', fg = 'overlay' },
  --         TelescopePromptNormal = { bg = 'overlay', fg = 'text' },
  --         TelescopePromptCounter = { bg = 'overlay', fg = 'overlay' },
  --         TelescopeResultsNormal = { bg = 'surface', fg = 'text' },
  --         TelescopeResultsBorder = { bg = 'surface', fg = 'surface' },
  --         CmpGhostText = { fg = 'muted' },
  --       },
  --     }
  --   end,
  -- },
  -- {
  --   'sainnhe/sonokai',
  --   lazy = false,
  --   priority = 1000,
  --   enabled = false,
  --   config = function()
  --     vim.g.sonokai_better_performance = 1
  --     vim.g.sonokai_style = 'shusia'
  --     -- vim.g.sonokai_style = 'default'
  --     vim.cmd.colorscheme 'sonokai'
  --     local hi = function(group) -- Copied from... somewhere I can't remember
  --       return function(highlights)
  --         vim.api.nvim_set_hl(0, group, highlights)
  --       end
  --     end
  --     hi 'CmpGhostText' { fg = 'grey' }
  --   end,
  -- },
  -- {
  --   'sainnhe/edge',
  --   lazy = false,
  --   priority = 1000,
  --   -- enabled = false,
  --   config = function()
  --     vim.g.edge_better_performance = 1
  --     -- vim.g.edge_style = 'shusia'
  --     vim.g.edge_style = 'aura'
  --     vim.cmd.colorscheme 'edge'
  --     local hi = function(group) -- Copied from... somewhere I can't remember
  --       return function(highlights)
  --         vim.api.nvim_set_hl(0, group, highlights)
  --       end
  --     end
  --     hi 'CmpGhostText' { fg = 'grey' }
  --   end,
  -- },
  -- }}}

}
