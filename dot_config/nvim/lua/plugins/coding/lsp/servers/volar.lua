-- local tsserver = require("mason-registry")
--   .get_package("typescript-language-server")
--   :get_install_path() .. "/node_modules/typescript/lib"
local tsserver = os.getenv("TSSERVERJS")

-- print(tsserver)
require("lspconfig").volar.setup({
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
