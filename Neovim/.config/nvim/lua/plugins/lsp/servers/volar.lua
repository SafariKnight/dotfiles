local tsserver = require("mason-registry")
  .get_package("typescript-language-server")
  :get_install_path() .. "/node_modules/typescript/lib"

require("lspconfig").volar.setup({
  capabilities = _G.capabilities,
  on_attach = require("plugins.lsp.on_attach"),
  init_options = {
    typescript = {
      tsdk = tsserver,
    },
  },
})
    -- vue = {
    --   hybridMode = true,
    -- },
  -- filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
