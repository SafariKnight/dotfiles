return {
  'folke/which-key.nvim',
  -- lazy = false,
  enabled = false,
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 0
  end,
  opts = {
    key_labels = {
      ['<leader>'] = 'SPC',
      ['<cr>'] = 'RET',
      ['<tab>'] = 'TAB',
      [','] = 'BOS',
    },
  },
}
