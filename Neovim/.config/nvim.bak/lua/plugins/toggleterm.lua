return {
  'akinsho/toggleterm.nvim',
  event = "VeryLazy",
  -- keys = {
  --   { "<leader>g", function() _Lazygit_toggle() end, desc = "Lazy Git"},
  --   { "<leader>e", function() _LF_toggle() end, desc = "LF File Manager" },
  -- },
  keys = function()
    return require("utils.map").load_mapping("toggleterm")
  end,
  opts = {
    open_mapping = [[<C-\>]],
    direction = 'float',
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)
    local term = require("toggleterm.terminal").Terminal
    local lazygit = term:new({ cmd = "lazygit", hidden = true})
    local lf = term:new({ cmd = "lf", hidden = true})

    function _LF_toggle()
      lf:toggle()
    end
    function _Lazygit_toggle()
      lazygit:toggle()
    end
  end
}
