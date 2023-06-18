return {
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    lazy = false,
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '∕',
        section_separators = '',
      },
    },
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufRead', 'BufNewFile' },
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '│',
      show_trailing_blankline_indent = false,
      show_current_context = true,
    },
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      local wk = require 'which-key'
      wk.setup {
        key_labels = {
          ['<space>'] = 'SPC',
          ['<leader>'] = 'SPC',
          ['<cr>'] = 'RET',
          ['<tab>'] = 'TAB',
        },
        icons = {
          breadcrumb = '',
          group = '',
        },
      }

      wk.register {
        ['<leader>g'] = { name = '+Git' },
        ['<leader>l'] = { name = '+LSP' },
        ['<leader>ls'] = { name = '+Symbol' },
        ['<leader>lw'] = { name = '+Workspace' },
        ['<leader>lL'] = { name = '+Utils' },
        ['<leader>f'] = { name = '+Find' },
      }
    end,
  },
}
