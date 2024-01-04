return {
  {
    'kevinhwang91/nvim-bqf',
    -- enabled = false,
    ft = 'qf',
    opts = {
      func_map = {
        fzffilter = 'zk',
      },
      preview = {
        win_height = 6,
        win_vheight = 6,
      }
    },
  },
  {
    'junegunn/fzf',
    ft = 'qf', -- Only used for bqf
    config = function()
      vim.fn['fzf#install']()
    end,
  },
}
