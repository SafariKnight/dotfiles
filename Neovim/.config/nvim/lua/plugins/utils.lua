return {
  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth', lazy = false },

  -- Dispatch is just good okay?
  -- Although anyone have anything to just run programs?
  { 'tpope/vim-dispatch', lazy = false },

  -- This is actually amazing wth, screw leaps lmao (that's a joke)
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    init = function()
      require 'core.map' 'flash'
    end,
    ---@type Flash.Config
    opts = {},
  },
}
