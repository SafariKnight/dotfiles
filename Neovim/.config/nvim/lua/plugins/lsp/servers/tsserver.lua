-- local vue_typescript_plugin = require("mason-registry")
--   .get_package("vue-language-server")
--   :get_install_path() .. "/node_modules/@vue/language-server" .. "/node_modules/@vue/typescript-plugin"

require("typescript-tools").setup({
  on_attach = require("plugins.lsp.on_attach"),
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
  },
  settings = {
    tsserver_plugins = {
      -- Install this yourself `bun install -g @vue/typescript-plugin`
      "@vue/typescript-plugin",
    },
  },
})

-- require("lspconfig").tsserver.setup({
--   capabilities = capabilities,
--   init_options = {
--   },
--   filetypes = {
--     "javascript",
--     "javascriptreact",
--     "javascript.jsx",
--     "typescript",
--     "typescriptreact",
--     "typescript.tsx",
--     "vue",
--   },
-- })
