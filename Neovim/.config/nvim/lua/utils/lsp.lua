local M = {}

M.capabilities = require("cmp_nvim_lsp").default_capabilities()
M.on_attach = function(client, bufnr)
	local lsp_mappings = require("utils.map").load_mapping("lspconfig", { buffer = bufnr })
	local saga_mappings = require("utils.map").load_mapping("lspsaga", { buffer = bufnr })

	local mappings = vim.tbl_deep_extend("force", lsp_mappings, saga_mappings)
	for _, keybind in ipairs(mappings) do
		vim.keymap.set(keybind.mode, keybind[1], keybind[2], { buffer = keybind.buffer, desc = keybind.desc })
	end
	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format({ async = true })
	end, { desc = "Format current buffer with LSP" })
	local illuminate_ok, illuminate = pcall(require, "illuminate")
	if illuminate_ok then
		illuminate.on_attach(client)
	end
end

return M
