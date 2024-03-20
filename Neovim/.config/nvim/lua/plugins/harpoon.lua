return {
  'ThePrimeagen/harpoon', -- Harpoon Man
  enabled = false,
  keys = function()
    local hp = require 'harpoon'
    return {
      {
        '<A-a>',
        function()
          hp:list():append()
        end,
        desc = 'Add mark',
      },
      {
        '<A-u>',
        function()
          hp.ui:toggle_quick_menu(hp:list())
        end,
        desc = 'UI',
      },

      -- I use colemak btw
      {
        '<A-n>',
        function()
          hp:list():select(1)
        end,
        desc = 'Harpoon Mark 1',
      },
      {
        '<A-e>',
        function()
          hp:list():select(2)
        end,
        desc = 'Harpoon Mark 2',
      },
      {
        '<A-i>',
        function()
          hp:list():select(3)
        end,
        desc = 'Harpoon Mark 3',
      },
      {
        '<A-o>',
        function()
          hp:list():select(4)
        end,
        desc = 'Harpoon Mark 4',
      },
    }
  end,
  dependencies = { 'nvim-lua/plenary.nvim' },
  branch = 'harpoon2',
  -- enabled = false,
  -- init = function()
  --   map 'harpoon'
  -- end,
  config = function(_, opts)
    require('harpoon'):setup()
  end,
}
