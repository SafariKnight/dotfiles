-- tbh I want to try something else but idk what
return {
  'ThePrimeagen/harpoon', -- Harpoon Man
  keys = function()
    local hp = require 'harpoon'
    return {
      {
        '<leader>ha',
        function()
          hp:list():append()
        end,
        desc = 'Add mark',
      },
      {
        '<leader>hu',
        function()
          hp.ui:toggle_quick_menu(hp:list())
        end,
        desc = 'UI',
      },

      -- I use colemak btw
      {
        '<C-n>',
        function()
          hp:list():select(1)
        end,
        desc = 'Harpoon Mark 1',
      },
      {
        '<C-e>',
        function()
          hp:list():select(2)
        end,
        desc = 'Harpoon Mark 2',
      },
      {
        '<C-i>',
        function()
          hp:list():select(3)
        end,
        desc = 'Harpoon Mark 3',
      },
      {
        '<C-o>',
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
