return {
  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth', lazy = false },

  -- Dispatch is just good okay?
  { 'tpope/vim-dispatch', lazy = false },

  { -- vim-vinegar but neovim (Replaced by mini.files)
    'stevearc/oil.nvim',
    enabled = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    lazy = false,
    cmd = { 'Oil' },
    opts = {
      keymaps = {
        ['q'] = 'actions.close',
      },
    },
    init = function()
      vim.g.loaded_netrw = 1 -- Go away netrw
      vim.g.loaded_netrwPlugin = 1
      keybind['<leader>fe'] = { '<CMD>Oil<CR>', 'Browser' }
    end,
  },
}
