return {
  -- :Git commands
  {
    'tpope/vim-fugitive',
    lazy = false,
    init = function()
      keybind['<leader>og'] = { '<CMD>Git<CR>', 'Git' }
    end,
  },
  { 'tpope/vim-rhubarb', lazy = false },

  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    -- Disabled because I didn't use it and
    -- It didn't work well with transparency
    -- Might renable if I find a use for it (I stopped using transparency)
    enabled = false,
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },

        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        require 'core.map'('gitsigns', { buffer = bufnr })
      end,
    },
  },
}
