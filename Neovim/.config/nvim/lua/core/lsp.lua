local M = {}
M.on_attach = function(_, bufnr)
  map('n', '<leader>sr', vim.lsp.buf.rename, 'Rename', { buffer = bufnr })
  map(
    'n',
    '<leader>ca',
    vim.lsp.buf.code_action,
    'Code Action',
    { buffer = bufnr }
  )
  map(
    'n',
    '[d',
    vim.diagnostic.goto_prev,
    'Previous Diagnostic',
    { buffer = bufnr }
  )
  map('n', 'K', vim.lsp.buf.hover, 'Hover', { buffer = bufnr })
  map(
    'n',
    ']d',
    vim.diagnostic.goto_next,
    'Next Diagnostic',
    { buffer = bufnr }
  )
  map(
    'n',
    '<leader>e',
    vim.diagnostic.open_float,
    'Diagnostics Float',
    { buffer = bufnr }
  )
  map('n', 'gd', vim.lsp.buf.definition, 'Goto Definition', { buffer = bufnr })

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    -- vim.lsp.buf.format()
    require('conform').format()
  end, { desc = 'Format current buffer with LSP' })
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = require('cmp_nvim_lsp').default_capabilities(M.capabilities)

return M
