local M = {}
--- Someone find how to break this setup, including dumb ways (I want to idiot proof this)
M.abc = {
	n = {
		-- Center after actions
		["<C-d>"] = { "<C-d>zz", "Down half a page" },
		["<C-u>"] = { "<C-u>zz", "Up half a page" },
		["n"] = { "nzz", "Next result (Center)" },
		["N"] = { "Nzz", "Prev result (Center)" },

		["J"] = { "maJ'a", "Append next line on current line" },
		["<leader>e"] = { "<CMD>Oil<CR>", "Oil File Manager" },
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
		["<M-j>"] = {
			function()
				require("harpoon.ui").nav_file(1)
			end,
			"Goto mark 1",
		},
		["<M-k>"] = {
			function()
				require("harpoon.ui").nav_file(2)
			end,
			"Goto mark 2",
		},
		["<M-l>"] = {
			function()
				require("harpoon.ui").nav_file(3)
			end,
			"Goto mark 3",
		},
		["<M-h>"] = {
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
		["<C-b>"] = { "<CMD>Telescope buffers<CR>", "Switch Buffers" },
	},
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
	},
}

M.lspsaga = {
	n = {
		["<leader>lss"] = { "<CMD>Lspsaga lsp_finder<CR>", "Info" },
		["<leader>lsr"] = { "<CMD>Lspsaga rename<CR>", "Rename" },

		["<leader>lwd"] = { "<CMD>Lspsaga show_workspace_diagnostics<CR>", "Diagnostics" },
		["<leader>ld"] = { "<CMD>Lspsaga show_line_diagnostics<CR>", "Line Diagnostics" },
		["<leader>lc"] = { "<CMD>Lspsaga code_action<CR>", "Code Action" },
		["K"] = { "<CMD>Lspsaga hover_doc<CR>", "Documentation Float" },
	},
}

M.dap = {
	n = {
		["<F2>"] = { "<CMD>DapStepOver<CR>", "Over" },
		["<F3>"] = { "<CMD>DapStepOut<CR>", "Out" },
		["<F4>"] = { "<CMD>DapStepInto<CR>", "Into" },
		["<F5>"] = { "<CMD>DapContinue<CR>", "Continue" },
		["<leader>du"] = {
			function()
				require("dapui").toggle()
			end,
			"Toggle UI",
		},
		["<leader>db"] = { "<CMD>DapToggleBreakpoint<CR>", "Toggle Breakpoint" },
	},
}

return M
