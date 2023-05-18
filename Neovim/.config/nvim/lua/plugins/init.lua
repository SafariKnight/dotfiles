return {
	{
		"mbbill/undotree",
		keys = function() return require("utils.map").load_mapping("undotree") end,
		cmd = "UndotreeToggle",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		event = "VimEnter",
		opts = {
			flavour = "mocha",
			show_end_of_buffer = true,
			integrations = {
				which_key = true,
				alpha = true,
				treesitter = true,
				cmp = true,
				indent_blankline = {
					enabled = true,
				},
			},
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
		event = { "BufReadPre", "BufNewFile" },
	},

	{
		"simrat39/rust-tools.nvim",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		ft = "rust",
		opts = function()
			return {
				server = {
					capabilities = require("utils.lsp").capabilities,
					on_attach = require("utils.lsp").on_attach,
				},
			}
		end,
	},
}
