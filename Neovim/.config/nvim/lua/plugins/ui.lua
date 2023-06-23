return {
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    lazy = false,
    enabled = false,
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
          group = ' ',
        },
      }

      wk.register {
        ['<leader>l'] = { name = 'Line' },
        ['<leader>w'] = { name = 'Workspace' },
        ['<leader>b'] = { name = 'Buffer' },
        ['<leader>s'] = { name = 'Symbol' },
        ['<leader>a'] = { name = 'Add' },
        ['<leader>d'] = { name = 'Remove' },
        ['<leader>o'] = { name = 'Open' },
      }
    end,
  },
  {
    'stevearc/dressing.nvim',
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require('lazy').load { plugins = { 'dressing.nvim' } }
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require('lazy').load { plugins = { 'dressing.nvim' } }
        return vim.ui.input(...)
      end
    end,
  },
}
