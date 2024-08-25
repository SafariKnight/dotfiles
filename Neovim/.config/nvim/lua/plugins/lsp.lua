local ensure = {
  "shfmt",
  "lua_ls",
  "stylua",
  "volar",
  "tsserver",
  "html",
  "cssls",
  "emmet_language_server",
  "prettier",
  "gopls",
  "gofumpt",
  "goimports-reviser",
  "golines",
  "rust_analyzer",
  "tailwindcss"
}

return {
  "neovim/nvim-lspconfig",
  -- event = { "BufReadPre", "BufNew" },
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    { "folke/neodev.nvim", opts = {} },

    -- { -- Nicer diagnostics
    --   "dgagn/diagflow.nvim",
    --   opts = {
    --     scope = "line",
    --     show_sign = true,
    --   },
    -- },

    -- Interaction between cmp and lsp
    "hrsh7th/cmp-nvim-lsp",

    -- CSharp stuff
    -- "jmederosalvarado/roslyn.nvim",

    -- Typescript Language Server
    {
      "pmizio/typescript-tools.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
    },
  },

  config = function()
    local lspconfig = require("lspconfig")
    _G.capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    _G.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

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

    -- [server] = function()
    --   do stuff
    -- end

    require("mason").setup()
    local mason_lsp = require("mason-lspconfig")
    local handlers = {
      function(server)
        lspconfig[server].setup({
          capabilities = _G.capabilities,
          on_attach = require("plugins.lsp.on_attach"),
        })
      end,
    }

    local function get_server_config(server)
      return {
        [server] = function()
          require("plugins.lsp.servers." .. server)
        end,
      }
    end

    local function add_server_config(server)
      handlers =
        vim.tbl_deep_extend("force", handlers, get_server_config(server))
    end

    add_server_config("tsserver")
    add_server_config("volar")
    require("plugins.lsp.servers.gdscript")

    mason_lsp.setup_handlers(handlers)

    require("mason-tool-installer").setup({
      ensure_installed = ensure,
      auto_update = true,
    })
  end,
}
