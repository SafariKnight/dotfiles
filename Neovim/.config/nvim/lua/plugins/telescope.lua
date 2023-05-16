return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = function()
		local builtin = require("telescope.builtin")

		return {
			{
				"<C-p>",
				function()
					local opts = {} -- define here if you want to define something
					vim.fn.system("git rev-parse --is-inside-work-tree")
					if vim.v.shell_error == 0 then
						require("telescope.builtin").git_files(opts)
					else
						require("telescope.builtin").find_files(opts)
					end
				end,
				desc = "Search Files",
			},
			{
				"<C-q>",
				function()
					builtin.buffers()
				end,
				desc = "Switch Buffers",
			},
		}
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
				theme = "dropdown",
			},
			pickers = {
				find_files = {
					theme = "dropdown",
				},
				buffers = {
					theme = "dropdown",
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
