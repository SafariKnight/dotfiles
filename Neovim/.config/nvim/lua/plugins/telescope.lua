return {
  {
    'nvim-telescope/telescope.nvim',
    init = function()
      map('n', '<leader>f', '<CMD>Telescope fd<CR>', 'Switch File')
      map('n', '<leader>/', '<CMD>Telescope live_grep<CR>', 'Search Project-Wide')

    end,
    cmd = { 'Telescope' },
    opts = function()
      local actions = require 'telescope.actions'
      return {
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
        },
        pickers = {
          buffers = {
            mappings = {
              i = {
                ['<c-d>'] = actions.delete_buffer,
              },
            },
          },
        },
      }
    end,
    config = function(_, opts)
      require('telescope').setup(opts)
      local plugins = { 'fzf' }
      for _, plugin in ipairs(plugins) do
        require('telescope').load_extension(plugin)
      end
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
      -- 'nvim-telescope/telescope-frecency.nvim',
    },
    tag = '0.1.4',
  },
  {
    'stevearc/dressing.nvim',
    opts = {
      input = { enabled = true },
      select = { enabled = true },
    },
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require('lazy').load { plugins = { 'dressing.nvim' } }
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require('lazy').load { plugins = { 'dressing.nvim' } }
        return vim.ui.input(...)
      end
    end,
  },
}
