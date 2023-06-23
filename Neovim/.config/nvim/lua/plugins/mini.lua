---@type LazySpec
return {
  'echasnovski/mini.nvim',
  version = false,
  lazy = false,
  -- event = 'VeryLazy',
  init = function()
    vim.g.loaded_netrw = 1 -- Go away netrw
    vim.g.loaded_netrwPlugin = 1
  end,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    files = {
      options = {
        use_as_default_explorer = true,
      },
      windows = {
        preview = true,
      },
    },
    comment = {
      ignore_blank_line = true,
    },
    surround = {
      mappings = {
        add = 'gza', -- Add surrounding in Normal and Visual modes
        delete = 'gzd', -- Delete surrounding
        replace = 'gzr', -- Replace surrounding

        find = '', -- Find surrounding (to the right)
        find_left = '', -- Find surrounding (to the left)
        highlight = '', -- Highlight surrounding
        update_n_lines = '', -- Update `n_lines`
        suffix_last = '', -- Suffix to search with "prev" method
        suffix_next = '', -- Suffix to search with "next" method
      },
    },
    move = {
      mappings = {
        right = '<M-l>',
        up = '<M-k>',
        down = '<M-j>',
        left = '<M-h>',

        line_right = '',
        line_up = '',
        line_down = '',
        line_left = '',
      },
    },
  },
  config = function(_, opts)
    local activate = function(module) -- The only function I've done well ever
      require('mini.' .. module).setup(opts[module])
    end

    activate 'ai'
    activate 'comment'
    activate 'move'
    activate 'files'
    activate 'pairs'
  end,
}
