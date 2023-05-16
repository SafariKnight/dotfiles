return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  opts = {
		indentscope = {
			symbol = "│",
			options = { try_as_border = true },
		},
    surround = {
      mappings = {
        add = "gza",          -- Add surrounding in Normal and Visual modes
        delete = "gzd",       -- Delete surrounding
        find = "gzf",         -- Find surrounding (to the right)
        find_left = "gzF",    -- Find surrounding (to the left)
        highlight = "gzh",    -- Highlight surrounding
        replace = "gzr",      -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
    move = {
      mappings = {
        right = '<A-l>',
        up    = '<A-k>',
        down  = '<A-j>',
        left  = '<A-h>',

        line_right  = '<A-l>',
        line_up     = '<A-k>',
        line_down   = '<A-j>',
        line_left   = '<A-h>',
      }
    }
  },
  config = function(_, opts)
    local activate = function (module)
      require("mini." .. module).setup(opts[module])
    end
    activate("pairs")
    activate("comment")
    activate("surround")
    activate("move")
    activate("ai")
    activate("indentscope")
  end
}
