return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    dependencies = {
      { "catppuccin/nvim", name = "catppuccin" }
    },
    opts = {
      options = {
        theme = "catppuccin"
      }
    }
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    enabled = false,
    dependencies = {
      { "catppuccin/nvim", name = "catppuccin" }
    },
    opts = {
      options = {
        buffer_close_icon = "",
        close_command = "bdelete %d",
        close_icon = "",
        indicator = {
          style = "icon",
          icon = " ",
        },
        left_trunc_marker = "",
        modified_icon = "●",
        offsets = { { filetype = "NvimTree", text = "EXPLORER", text_align = "center" } },
        right_mouse_command = "bdelete! %d",
        right_trunc_marker = "",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diag)
          local icons = {
            Error = " ",
            Warn = " ",
            Hint = " ",
            Info = " ",
          }
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
              .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        show_close_icon = false,
        show_tab_indicators = true,
        always_show_bufferline = false,
      },
    -- highlights = require("catppuccin.groups.integrations.bufferline").get()
    },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  }
  }
}
