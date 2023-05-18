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

M.harpoon = function()
  local mark = require("harpoon.mark")
  local ui = require("harpoon.ui")
	local marked_files = {}
	for idx = 1, mark.get_length() do
		local file = mark.get_marked_file_name(idx)
		if file == "" then
			file = "(empty)"
		end
		marked_files[idx] = string.format("%s", file)
	end
	local function get_entry(idx)
		local file_name = marked_files[idx] or idx .. " (Unset)"
		return "Goto file " .. file_name
	end
	local file1 = get_entry(1)
	local file2 = get_entry(2)
	local file3 = get_entry(3)
	local file4 = get_entry(4)
	return {
		n = {
			["<leader>hp"] = { function() mark.add_file() end, "Add Mark" },
			["<leader>hu"] = { function() ui.toggle_quick_menu() end, "Open UI" },
			["<leader>j"] = { function() ui.nav_file(1) end, file1 },
			["<leader>k"] = { function() ui.nav_file(2) end, file2 },
			["<leader>u"] = { function() ui.nav_file(3) end, file3 },
			["<leader>i"] = { function() ui.nav_file(4) end, file4 },
		},
	}
end

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

M.lspconfig = {
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
		["<leader>lf"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"Format",
		},
		["<leader>ld"] = { vim.diagnostic.open_float, "Line Diagnostics" },

		["gd"] = { vim.lsp.buf.definition, "Definition" },
		["gD"] = { vim.lsp.buf.declaration, "Declaration" },
		["gr"] = { "<CMD>Telescope lsp_references<CR>", "References" },
		["gi"] = { vim.lsp.buf.implementation, "Implementation" },
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
    ["<leader>e"] = { function() _LF_toggle() end, "LF File Manager" },
    ["<leader>g"] = { function () _Lazygit_toggle() end, "Lazygit" },
  }
}
return M
