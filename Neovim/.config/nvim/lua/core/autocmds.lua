-- LSP On Attach {{{
vim.api.nvim_create_autocmd({ 'LspAttach' }, {
  group = vim.api.nvim_create_augroup('LspOnAttach', { clear = true }),
  callback = function(e)
    local bufnr = e.buf
    vim.keymap.set(
      'n',
      '<leader>vr',
      vim.lsp.buf.rename,
      { desc = 'Rename', buffer = bufnr }
    )
    vim.keymap.set(
      'n',
      '<leader>va',
      vim.lsp.buf.code_action,
      { desc = 'Code Action', buffer = bufnr }
    )
    -- vim.keymap.set(
    --   'n',
    --   '[d',
    --   vim.diagnostic.goto_prev,
    --   { desc = 'Previous Diagnostic', buffer = bufnr }
    -- )
    vim.keymap.set(
      'n',
      '<leader>vh',
      vim.lsp.buf.hover,
      { desc = 'Hover', buffer = bufnr }
    )
    -- vim.keymap.set(
    --   'n',
    --   ']d',
    --   vim.diagnostic.goto_next,
    --   { desc = 'Next Diagnostic', buffer = bufnr }
    -- )
    vim.keymap.set(
      'n',
      '<leader>vf',
      vim.diagnostic.open_float,
      { desc = 'Diagnostics Float', buffer = bufnr }
    )
    vim.keymap.set(
      'n',
      'gd',
      vim.lsp.buf.definition,
      { desc = 'Goto Definition', buffer = bufnr }
    )

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      -- vim.lsp.buf.format()
      require('conform').format()
    end, { desc = 'Format current buffer with LSP' })
  end,
})
-- }}}
