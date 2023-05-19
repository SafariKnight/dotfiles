local M = {}
--- Someone find how to break this setup, including dumb ways (I want to idiot proof this)
M.abc = {
	n = {
		["H"] = { "<CMD>bp<CR>", "Previous Buffer" },
		["L"] = { "<CMD>bn<CR>", "Next Buffer" },
		["<C-j>"] = { "<C-w>j", "Window down" },
		["<C-k>"] = { "<C-w>k", "Window up" },
		["<C-h>"] = { "<C-w>h", "Window left" },
		["<C-l>"] = { "<C-w>l", "Window right" },
	},
}

M.harpoon = {
	n = {
		["<leader>hp"] = {
			function()
				require("harpoon.mark").add_file()
			end,
			"Add Mark",
		},
		["<leader>hu"] = {
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			"Open UI",
		},
		["<leader>j"] = {
			function()
				require("harpoon.ui").nav_file(1)
			end,
			"Goto mark 1",
		},
		["<leader>k"] = {
			function()
				require("harpoon.ui").nav_file(2)
			end,
			"Goto mark 2",
		},
		["<leader>u"] = {
			function()
				require("harpoon.ui").nav_file(3)
			end,
			"Goto mark 3",
		},
		["<leader>i"] = {
			function()
				require("harpoon.ui").nav_file(4)
			end,
			"Goto mark 4",
		},
	},
}

M.undotree = {
	n = {
		["<leader>t"] = { "<CMD>UndotreeToggle<CR>", "Undotree" },
	},
}

M.telescope = {
	n = {
		["<C-p>"] = { "<CMD>Telescope fd<CR>", "Search Files" },
		["<C-q>"] = { "<CMD>Telescope buffer<CR>", "Switch Buffers" },
	},
}

M.fzf_lua = {
  n = {
    ["<C-p>"] = { function() require("fzf-lua").files() end, "Search Files" },
    ["<C-q>"] = { function() require("fzf-lua").buffers() end, "Switch Buffers" }
  }
}

M.lspconfig = {
	n = {
		["<leader>lwa"] = {
			function()
				vim.lsp.buf.add_workspace_folder()
			end,
			"Add Folder",
		},
		["<leader>lwd"] = {
			function()
				vim.lsp.buf.add_workspace_folder()
			end,
			"Remove Folder",
		},
		["<leader>lws"] = {
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			"List Folders",
		},

		["<leader>lLi"] = { "<CMD>LspInfo<CR>", "LSP Info" },
		["<leader>lLr"] = { "<CMD>LspRestart<CR>", "LSP Restart" },
		["<leader>lLm"] = { "<CMD>Mason<CR>", "Mason" },

		["<leader>li"] = {
			function()
				vim.lsp.buf.signature_help()
			end,
			"Signature Documentation",
		},
		["<leader>lf"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"Format",
		},
		["<leader>ld"] = {
			function()
				vim.diagnostic.open_float()
			end,
			"Line Diagnostics",
		},

		["gd"] = {
			function()
				vim.lsp.buf.definition()
			end,
			"Definition",
		},
		["gD"] = {
			function()
				vim.lsp.buf.declaration()
			end,
			"Declaration",
		},
		["gr"] = { "<CMD>Telescope lsp_references<CR>", "References" },
		["gi"] = {
			function()
				vim.lsp.buf.implementation()
			end,
			"Implementation",
		},
	},
}

M.lspsaga = {
	n = {
		["<leader>lss"] = { "<CMD>Lspsaga lsp_finder<CR>", "Info" },
		["<leader>lsr"] = { "<CMD>Lspsaga rename<CR>", "Rename" },

		["<leader>lc"] = { "<CMD>Lspsaga code_action<CR>", "Code Action" },
		["K"] = { "<CMD>Lspsaga hover_doc<CR>", "Documentation Float" },
	},
}

M.toggleterm = {
	n = {
		["<leader>e"] = {
			function()
				_LF_toggle()
			end,
			"LF File Manager",
		},
		["<leader>g"] = {
			function()
				_Lazygit_toggle()
			end,
			"Lazygit",
		},
	},
}
return M
