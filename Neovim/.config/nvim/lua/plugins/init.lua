return {
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
          enabled = true
        }
      }
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

	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		opts = {
			server = {
				on_attach = function(client, bufnr)
					require("utils.map").load_mapping("lspconfig", { buffer = bufnr })

					-- Create a command `:Format` local to the LSP buffer
					vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
						vim.lsp.buf.format()
					end, { desc = "Format current buffer with LSP" })
					require("illuminate").on_attach(client)
				end,
        capabilties = function() return require("cmp_nvim_lsp").default_capabilities() end
			},
		},
	},
}
