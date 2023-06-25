return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = { 'Telescope' },
    -- enabled = false,
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    init = function()
      require 'core.map' 'telescope'
    end,
    config = function()
      local actions = require 'telescope.actions'
      local telescope = require 'telescope'
      telescope.setup {
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
          borderchars = {
            prompt = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
            results = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
            preview = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
          },
        },
        defaults = {
          prompt_prefix = '   ',
          entry_prefix = '  ',
          selection_caret = '  ',
          -- borderchars = {
          --   '─',
          --   '│',
          --   '─',
          --   '│',
          --   '╭',
          --   '╮',
          --   '╯',
          --   '╰',
          -- },
          -- borderchars = {
          --   prompt = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
          --   results = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
          --   preview = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
          -- },
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              height = 0.66,
            },
          },
        },
        pickers = {
          buffers = {
            mappings = {
              i = {
                ['<C-d>'] = actions.delete_buffer + actions.move_to_top,
              },
            },
          },
        },
      }
      telescope.load_extension 'fzf'
      -- local TelescopePrompt = {
      --   TelescopePromptNormal = {
      --     bg = '#2d3149',
      --   },
      --   TelescopePromptBorder = {
      --     bg = '#2d3149',
      --   },
      --   TelescopePromptTitle = {
      --     fg = '#2d3149',
      --     bg = '#2d3149',
      --   },
      --   TelescopePreviewTitle = {
      --     fg = '#1F2335',
      --     bg = '#1F2335',
      --   },
      --   TelescopeResultsTitle = {
      --     fg = '#1F2335',
      --     bg = '#1F2335',
      --   },
      -- }
      -- for hl, col in pairs(TelescopePrompt) do
      --   vim.api.nvim_set_hl(0, hl, col)
      -- end
    end,
  },
  { -- Not sure if I should use this
    'ibhagwan/fzf-lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
    },
    cmd = 'FzfLua',
    enabled = false,
    init = function()
      require 'core.map' 'fzf_lua'
      vim.ui.select = function(...)
        require('lazy').load { plugins = { 'fzf-lua' } }
        return vim.ui.select(...)
      end
    end,
    config = function()
      local fzf = require 'fzf-lua'
      local colors = require('catppuccin.palettes').get_palette 'mocha'
      fzf.setup {
        'fzf_native',
        fzf_opts = {
          ['--layout'] = 'reverse',
          ['--info'] = 'hidden',
        },
        fzf_colors = {
          ['gutter'] = colors.mantle,
          ['pointer'] = colors.surface0,
          ['marker'] = colors.red,
          ['prompt'] = colors.lavender,
          ['info'] = colors.yellow,
          ['hl'] = colors.teal,
          ['hl+'] = colors.green,
          ['bg'] = colors.mantle,
          ['bg+'] = colors.surface0,
          ['fg'] = colors.text,
          ['fg+'] = colors.subtext1,
        },
        winopts = {
          border = 'none',
          preview = {
            default = 'bat',
            border = 'border-bottom',
            layout = 'vertical',
            vertical = 'up',
          },
        },
        files = {
          prompt = '   > ',
        },
        buffers = {
          prompt = '   > ',
        },
        code_actions = {
          prompt = '   > ',
          winopts = {
            height = 0.33,
            width = 0.1,
          },
        },
      }
      fzf.register_ui_select()
    end,
  },
}
