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

M.lspconfig = {
	plugin = true,
	n = {
		["<leader>lwa"] = { vim.lsp.buf.add_workspace_folder, "Add Folder" },
		["<leader>lwd"] = { vim.lsp.buf.add_workspace_folder, "Remove Folder" },
		["<leader>lws"] = {
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			"List Folders",
		},

		["<leader>lLi"] = { "<CMD>LspInfo<CR>", "LSP Info" },
		["<leader>lLr"] = { "<CMD>LspRestart<CR>", "LSP Restart" },
		["<leader>lLm"] = { "<CMD>Mason<CR>", "Mason" },

		["<leader>li"] = { vim.lsp.buf.signature_help, "Signature Documentation" },
		["<leader>lf"] = { function() vim.lsp.buf.format({ async = true }) end, "Format" },

		["gd"] = { vim.lsp.buf.definition, "Definition" },
		["gD"] = { vim.lsp.buf.declaration, "Declaration" },
		["gr"] = { require("telescope.builtin").lsp_references, "References" },
		["gi"] = { vim.lsp.buf.implementation, "Implementation" },

	},
}

M.lspsaga = {
	plugin = true,
	n = {
		["<leader>lss"] = { "<CMD>Lspsaga lsp_finder<CR>", "Info" },
		["<leader>lsr"] = { "<CMD>Lspsaga rename<CR>", "Rename" },

    ["<leader>lc"] = { "<CMD>Lspsaga code_action<CR>", "Code Action" },
    ["<leader>ld"] = { "<CMD>Lspsaga show_line_diagnostics<CR>", "Line Diagnostics" },
		["K"] = { "<CMD>Lspsaga hover_doc<CR>", "Documentation Float" },
	},
}
return M
