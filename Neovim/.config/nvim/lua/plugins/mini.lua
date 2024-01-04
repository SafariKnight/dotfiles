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
  opts = function()
    local miniclue = require 'mini.clue'
    local config = {
      clue = {
        window = { delay = 0 },
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'x', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },

          -- Bracketed
          { mode = 'n', keys = ']' },
          { mode = 'n', keys = '[' },
        },
        clues = {
          { mode = 'n', keys = '<Leader>f', desc = 'Find...' },
          { mode = 'n', keys = '<Leader>s', desc = 'Switch...' },
          { mode = 'n', keys = '<Leader>m', desc = 'Harpoon Mark...' },
          { mode = 'n', keys = ',', desc = 'Boss' },
          { mode = 'n', keys = ',q', desc = 'Persistence...' },
          { mode = 'n', keys = 'm', desc = 'Marks' },

          { mode = 'n', keys = ']b', postkeys = ']' },
          { mode = 'n', keys = ']w', postkeys = ']' },

          { mode = 'n', keys = '[b', postkeys = '[' },
          { mode = 'n', keys = '[w', postkeys = '[' },
          miniclue.gen_clues.g(),
          miniclue.gen_clues.windows {
            submode_move = true,
            submode_resize = true,
          },
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.z(),
        },
      },

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
      jump = {
        highlight = {
          delay = 0,
        }
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
      animate = {},
      indentscope = {
        symbol = '│',
      },
    }
    return config
  end,
  config = function(_, opts)
    local activate = function(module) -- The only function I've done well ever
      require('mini.' .. module).setup(opts[module])
    end

    activate 'ai'
    activate 'comment'
    activate 'move'
    activate 'files'
    -- activate 'pairs'
    activate 'surround'
    -- activate 'animate'
    activate 'indentscope'
    -- activate 'jump'
    -- activate 'clue'
    activate 'bracketed'
    activate 'cursorword'

    ---@diagnostic disable-next-line: undefined-global
    vim.keymap.set('n', '<leader>m', MiniFiles.open, { desc = 'File Explorer' })
  end,
}
