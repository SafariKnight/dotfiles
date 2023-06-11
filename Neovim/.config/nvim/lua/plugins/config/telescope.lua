local M = {}

M.init = function()
  require("core.map")("telescope")
end


M.opts = function()
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
      entry_prefix = "  ",
      selection_caret = "  ",
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          height = 0.66
        }
      },
    },
    pickers = {
      buffers = {
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
          },
        },
      },
    },
  }
end

return M
