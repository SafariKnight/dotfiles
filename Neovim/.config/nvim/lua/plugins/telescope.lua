return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	init = function()
		require("utils.map").load_mapping("telescope")
	end,
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
				entry_prefix = "  ",
				selection_caret = "  ",
        -- border = false,
				-- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
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
	end,
}
