local opts = require('core.lsp')
require('lspconfig').gdscript.setup({
  cmd = { 'ncat', '127.0.0.1', '6005'},
  on_attach = opts.on_attach,
  capabilities = opts.capabilities,
})
