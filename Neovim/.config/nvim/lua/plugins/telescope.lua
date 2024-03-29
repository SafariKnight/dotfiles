return {
  {
    "nvim-telescope/telescope.nvim",
    init = function()
      vim.keymap.set(
        "n",
        "<leader><space>",
        "<CMD>Telescope fd<CR>",
        { desc = "Switch File" }
      )
      vim.keymap.set(
        "n",
        "<leader>/",
        "<CMD>Telescope live_grep<CR>",
        { desc = "Live Grep" }
      )
      vim.keymap.set(
        "n",
        "<leader>,",
        "<CMD>Telescope buffers<CR>",
        { desc = "Switch Buffer" }
      )
    end,
    cmd = { "Telescope" },
    opts = function()
      local actions = require("telescope.actions")
      return {
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
        defaults = {
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",
        },
        pickers = {
          buffers = {
            theme = "dropdown",
            previewer = false,
            initial_mode = "normal",
            mappings = {
              i = {
                ["<c-d>"] = actions.delete_buffer,
              },
              n = {
                ["dd"] = actions.delete_buffer,
                ["Vd"] = actions.delete_buffer,
                ["q"] = actions.close, -- Why isn't this default?
              },
            },
          },
        },
      }
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
      local plugins = { "fzf", "grapple" }
      for _, plugin in ipairs(plugins) do
        require("telescope").load_extension(plugin)
      end
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      -- 'nvim-telescope/telescope-frecency.nvim',
    },
    tag = "0.1.4",
  },
  {
    "stevearc/dressing.nvim",
    opts = {
      input = { enabled = true },
      select = {
        enabled = true,
        telescope = {
          borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
        },
      },
    },
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
}
