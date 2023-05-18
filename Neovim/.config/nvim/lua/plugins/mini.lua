return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  opts = {
    surround = {
      mappings = {
        add = "gza",          -- Add surrounding in Normal and Visual modes
        delete = "gzd",       -- Delete surrounding
        replace = "gzr",      -- Replace surrounding
      },
    },
    move = {
      mappings = {
        right = '<M-l>',
        up    = '<M-k>',
        down  = '<M-j>',
        left  = '<M-h>',

        line_right  = '<M-l>',
        line_up     = '<M-k>',
        line_down   = '<M-j>',
        line_left   = '<M-h>',
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
    -- activate("indentscope")
  end
}
