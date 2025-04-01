-- local vue_typescript_plugin = require("mason-registry")
--   .get_package("vue-language-server")
--   :get_install_path() .. "/node_modules/@vue/language-server" .. "/node_modules/@vue/typescript-plugin"
local plugins = {}
local vue_typescript_plugin = os.getenv("VUE_TYPESCRIPT_PLUGIN")
if vue_typescript_plugin ~= nil then
  table.insert(plugins, {
    name = "@vue/typescript-plugin",
    location = vue_typescript_plugin,
    -- If .vue file cannot be recognized in either js or ts file try to add `typescript` and `javascript` in languages table.
    languages = { "vue" },
  })
end

-- Unusable for me because of no ability to specify a path to a plugin
-- print(vue_typescript_plugin)
-- require("typescript-tools").setup({
--   on_attach = require("plugins.lsp.on_attach"),
--   filetypes = {
--     "javascript",
--     "javascriptreact",
--     "javascript.jsx",
--     "typescript",
--     "typescriptreact",
--     "typescript.tsx",
--     "vue",
--   },
--   settings = {
--     tsserver_plugins = {
--       {
--         {
--           name = "@vue/typescript-plugin",
--           location = vue_typescript_plugin,
--           -- If .vue file cannot be recognized in either js or ts file try to add `typescript` and `javascript` in languages table.
--           languages = { "vue" },
--         },
--       },
--     },
--   },
-- })

require("lspconfig").ts_ls.setup({
  -- cmd = { "tsserver", "--stdio"};
  init_options = {
    plugins = plugins,
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    -- "javascript.jsx",
    "typescript",
    "typescriptreact",
    -- "typescript.tsx",
    "vue",
  },
})
