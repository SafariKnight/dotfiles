return {
	{
		"nvim-lualine/lualine.nvim",
    -- enabled = false,
		event = "VimEnter",
		dependencies = {
			-- { "catppuccin/nvim", name = "catppuccin" },
			"folke/tokyonight.nvim",
		},
		opts = {
			options = {
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				theme = "auto",
			},
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			char = "│",
			filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
			show_trailing_blankline_indent = false,
			show_current_context = true,
		},
	},
}, {
	"stevearc/dressing.nvim",
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
	config = true,
	opts = {
		input = {
			enabled = true,
		},
		select = {
      enabled = true,
			telescope = require("telescope.themes").get_cursor({
				layout_config = {
					height = 14,
				},
			}),
		},
	},
}
