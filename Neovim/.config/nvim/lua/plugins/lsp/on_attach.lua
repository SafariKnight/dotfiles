return function(client, buffer)
  local map = function(mode, lhs, rhs, opts)
    opts = vim.tbl_deep_extend("force", opts, { buffer = buffer })
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  map("n", "gd", vim.lsp.buf.declaration, { desc = "Go to declaration" })
  map("n", "gs", vim.lsp.buf.signature_help, { desc = "Signature Help" })

  -- Designed like new default mappings
  map("n", "crr", vim.lsp.buf.code_action, { desc = "Code Action" })
  map(
    { "v", "x" },
    "<leader>ca",
    vim.lsp.buf.code_action,
    { desc = "Code Action" }
  )
  map("n", "crn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
  map("n", "crf", vim.lsp.buf.format, { desc = "Format" })

  -- New Default Mappings are better :p
  -- map({ "n", "v", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Action" })
  -- map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format" })
end
