local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = true },
      telemetry = { enable = false },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
  rust_analyzer = {},
  tsserver = {},
  html = {},
  cssls = {},
  emmet_language_server = {},
}

vim.api.nvim_create_autocmd("LSPAttach", {
  group = vim.api.nvim_create_augroup("LSPBinds", { clear = true }),
  callback = function(e)
    local buffer = e.buffer
    local map = function(mode, lhs, rhs, opts)
      opts = vim.tbl_deep_extend("force", opts, { buffer = buffer })
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    map(
    "n",
    "gd",
    vim.lsp.buf.declaration,
    { desc = "Go to declaration" }
    )
    map(
    "n",
    "gs",
    vim.lsp.buf.signature_help,
    { desc = "Signature Help" }
    )
    map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Action" })
    map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format" })
  end,
})

local signs = {
  Error = require("kh.icons").BoldError,
  Warn = require("kh.icons").BoldWarning,
  Hint = require("kh.icons").BoldHint,
  Info = require("kh.icons").BoldInformation,
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local mason_lsp = require("mason-lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- load_plugin("mason")

require("mason").setup()
mason_lsp.setup()
mason_lsp.setup_handlers({
  function(server)
    print(server)
    require("lspconfig")[server].setup({
      capabilities = capabilities,
      settings = servers[server],
    })
  end,
})

-- require("neodev").setup()
nnnnnnnnn
local ensure = vim.tbl_deep_extend("force", vim.tbl_keys(servers), {
  "shfmt",
  "stylua",
  "prettierd",
})
require("mason-tool-installer").setup({
  ensure_installed = ensure,
  auto_update = true,
})
