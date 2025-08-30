---@diagnostic disable: undefined-global
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = {
  lua_ls = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        codeLens = {
          enable = true,
        },
        completion = {
          callSnippet = "Replace",
        },
        doc = {
          privateName = { "^_" },
        },
        hint = {
          enable = true,
          setType = false,
          paramType = true,
          paramName = "Disable",
          semicolon = "Disable",
          arrayIndex = "Disable",
        },
      },
    },
  },
  nixd = {},
  basedpyright = {},
  -- pyright = {},
  ruff = {},
  html = {
    filetypes = { "htmlangular" },
  },
  laravel_ls = {},
  -- phpactor = {},
  cssls = {},
  vtsls = {},
  svelte = {},
  angularls = {},
  tailwindcss = {},
  jsonls = {},
  emmet_language_server = {},
  rust_analyzer = {},
  gopls = {},
}

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(ev)
    local map = function(mode, lhs, rhs, options)
      options = vim.tbl_deep_extend("force", options, { buffer = ev.buf })
      vim.keymap.set(mode, lhs, rhs, options)
    end

    if Snacks ~= nil then
      map(
        "n",
        "grr",
        Snacks.picker.lsp_references,
        { desc = "Show References" }
      )
      map("n", "grs", Snacks.picker.lsp_symbols, { desc = "Show Symbols" })
    else
      map("n", "grr", vim.lsp.buf.references, { desc = "Show References" })
      map("n", "grs", vim.lsp.buf.document_symbol, { desc = "Show Symbols" })
    end
    map("n", "<c-w>d", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
    map("n", "gra", vim.lsp.buf.code_action, { desc = "Code Action" })
    map("n", "grn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
    map(
      "n",
      "grt",
      vim.lsp.buf.type_definition,
      { desc = "Go to Type Definition" }
    )
    map(
      "n",
      "gri",
      vim.lsp.buf.implementation,
      { desc = "Go to Implementation" }
    )
    map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
  end,
})

return {
  "nvim-lspconfig",
  lazy = false,
  beforeAll = function()
    vim.diagnostic.config {
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
      },
    }
  end,
  after = function()
    for server, cfg in pairs(opts) do
      vim.lsp.config(
        server,
        vim.tbl_deep_extend("keep", cfg, { capabilities = capabilities })
      )
      vim.lsp.enable(server, true)
    end
  end,
}
