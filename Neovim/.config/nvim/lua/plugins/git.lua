return {
  -- :Git commands
  { 'tpope/vim-fugitive', lazy = false },
  { 'tpope/vim-rhubarb',  lazy = false },

  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
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
        require 'core.map' ('gitsigns', { buffer = bufnr })
      end,
    },
  },
}
