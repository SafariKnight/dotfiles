return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		event = "VimEnter",
		opts = {
			flavour = "mocha",
			show_end_of_buffer = true,
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd("colorscheme catppuccin")
		end,
	},
	{
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat" },
		config = function()
			require("leap").add_default_mappings()
		end,
		keys = {
			{ "s" },
			{ "S" },
			{ "gs" },
		},
		cmd = "Hop",
	},
	{
		"mbbill/undotree",
		keys = { { "<leader>H", vim.cmd.UndotreeToggle, desc = "UndoTree" } },
		cmd = "UndotreeToggle",
	},

	{ "simrat39/rust-tools.nvim", ft = "rust", config = true},
}
