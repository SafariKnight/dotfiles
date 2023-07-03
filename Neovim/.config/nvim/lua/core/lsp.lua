local M = {}
M.on_attach = function(client, bufnr)
  require 'core.map' ('lspconfig', { buffer = bufnr })
  require 'core.map' ('trouble', { buffer = bufnr })
  require 'core.map' ('lspsaga', { buffer = bufnr })

  if client.name == 'jdtls' then
    require 'core.map' ('java', { buffer = bufnr })
    -- require('jdtls.setup').add_commands()
  end

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = require('cmp_nvim_lsp').default_capabilities(M.capabilities)

return M
