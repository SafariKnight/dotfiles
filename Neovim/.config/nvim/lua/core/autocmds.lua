local au = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup

-- LSP On Attach {{{
au({ "LspAttach" }, {
  group = group("LspOnAttach", { clear = true }),
  callback = function(e)
    local bufnr = e.buf

    vim.keymap.set(
      "n",
      "<leader>cr",
      vim.lsp.buf.rename,
      { desc = "Rename", buffer = bufnr }
    )
    vim.keymap.set(
      "n",
      "<leader>ca",
      vim.lsp.buf.code_action,
      { desc = "Code Action", buffer = bufnr }
    )
    vim.keymap.set(
      "n",
      "K",
      vim.lsp.buf.hover,
      { desc = "Hover", buffer = bufnr }
    )
    vim.keymap.set(
      "n",
      "<leader>cd",
      vim.diagnostic.open_float,
      { desc = "Diagnostics Float", buffer = bufnr }
    )
    vim.keymap.set(
      "n",
      "gd",
      vim.lsp.buf.definition,
      { desc = "Goto Definition", buffer = bufnr }
    )
    vim.keymap.set(
      "n",
      "gD",
      vim.lsp.buf.declaration,
      { desc = "Goto Declaration", buffer = bufnr }
    )

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
      -- vim.lsp.buf.format()
      require("conform").format()
    end, { desc = "Format current buffer with LSP" })
    vim.keymap.set(
      "n",
      "<leader>cf",
      vim.cmd.Format,
      { desc = "Format", buffer = bufnr }
    )
  end,
})
-- }}}

-- au({ "ColorScheme" }, {
--   group = group("ColorOverrides", { clear = true}),
--   callback = function(e)
--     vim.api.nvim_set_hl()
--   end,
-- })
