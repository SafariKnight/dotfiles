return {
	{
		"mbbill/undotree",
		init = function()
			require("utils.map").load_mapping("undotree")
		end,
		cmd = "UndotreeToggle",
	},
	{
		"ggandor/leap.nvim",
		keys = {
			{ "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
			{ "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
			{ "x", mode = { "x", "o" }, desc = "Leap forward to (Visual)" },
			{ "X", mode = { "x", "o" }, desc = "Leap backward to (Visual)" },
		},
		dependencies = { "tpope/vim-repeat" },
		config = function()
			require("leap").add_default_mappings(true)
		end,
	},
	{
		"ggandor/flit.nvim",
		keys = {
			{ "f", mode = { "n", "x", "o" }, desc = "Flit Forward" },
			{ "F", mode = { "n", "x", "o" }, desc = "Flit Backward" },
			{ "t", mode = { "n", "x", "o" }, desc = "Flit till Forward" },
			{ "T", mode = { "n", "x", "o" }, desc = "Flit till Backward" },
		},
		config = true,
	},
	{
		"simrat39/rust-tools.nvim",
		dependencies = { "neovim/nvim-lspconfig", "mfussenegger/nvim-dap" },
		ft = "rust",
		opts = function()
			local extension_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/"
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb"
			local this_os = vim.loop.os_uname().sysname

			-- The path in windows is different
			if this_os:find("Windows") then
				codelldb_path = extension_path .. "adapter\\codelldb.exe"
				liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
			else
				-- The liblldb extension is .so for linux and .dylib for macOS
				liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
			end

			return {
				server = {
					capabilities = require("utils.lsp").capabilities,
					on_attach = require("utils.lsp").on_attach,
				},
				dap = {
					adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
				},
			}
		end,
	},
	{
		"stevearc/oil.nvim",
		lazy = false,
		config = true,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"tpope/vim-dispatch",
		lazy = false,
	},
	{ "christoomey/vim-tmux-navigator", lazy = false },

	-- I need to get better at vim binds okay?
	{
		"m4xshen/hardtime.nvim",
		opts = {
			max_time = 1000,
			max_count = 2,
			disable_mouse = true,
			hint = true,
			allow_different_key = false,
			resetting_keys = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "c", "d" },
			restricted_keys = { "h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>" },
			hint_keys = { "k", "j", "^", "$", "a", "x", "i", "d", "y", "c", "l" },
			disabled_keys = { "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>" },
			disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "NeogitStatus", "NeogitPopup"},
		},
		lazy = false,
	},
  {
    "TimUntersberger/neogit",
    cmd = { "Neogit" },
    opts = {},
  }
}
