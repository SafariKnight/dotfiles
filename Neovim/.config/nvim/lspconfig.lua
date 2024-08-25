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
  -- tsserver = {
  --   enabled = true
  -- },
  vtsls = {
      tsserver = {
        globalPlugins = {

          {
            name = "@vue/typescript-plugin",
            location = "",
            languages = {
              "javascript",
              "typescript",
              "javascriptreact",
              "typescriptreact",
              "vue",
            },
          },
      },
    },
  },
  html = {},
  cssls = {},
  emmet_language_server = {},
  gopls = {},
  omnisharp = {},
  volar = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
}



return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNew" },
  -- event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    { "folke/neodev.nvim", opts = {} },

    "dgagn/diagflow.nvim",

    -- Interaction between cmp and lsp
    "hrsh7th/cmp-nvim-lsp",

    -- CSharp stuff
    -- "jmederosalvarado/roslyn.nvim",
  },
  enabled = false,
  -- init = function()
  --   -- disable lsp watcher. Too slow on linux
  --   local ok, wf = pcall(require, "vim.lsp._watchfiles")
  --   if ok then
  --     wf._watchfunc = function()
  --       return function() end
  --     end
  --   end
  -- end,
  config = function()
    local on_attach = function(_, buffer)
      local map = function(mode, lhs, rhs, opts)
        opts = vim.tbl_deep_extend("force", opts, { buffer = buffer })
        vim.keymap.set(mode, lhs, rhs, opts)
      end

      map("n", "gd", vim.lsp.buf.declaration, { desc = "Go to declaration" })
      map("n", "gs", vim.lsp.buf.signature_help, { desc = "Signature Help" })

      -- Designed like new default mappings
      map("n", "crr", vim.lsp.buf.code_action, { desc = "Code Action" })
      map(
        { "v", "x" },
        "<leader>ca",
        vim.lsp.buf.code_action,
        { desc = "Code Action" }
      )
      map("n", "crn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
      map("n", "crf", vim.lsp.buf.format, { desc = "Format" })

      -- New Default Mappings are better :p
      -- map({ "n", "v", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Action" })
      -- map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format" })
    end

    vim.api.nvim_create_autocmd("LSPAttach", {
      group = vim.api.nvim_create_augroup("LSPBinds", { clear = true }),
      callback = function(e)
        on_attach("", e.buffer)
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

    require("mason").setup()
    local mason_lsp = require("mason-lspconfig")

    ---@diagnostic disable-next-line: lowercase-global
    capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    ---@diagnostic disable-next-line: lowercase-global
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- require("roslyn").setup({
    --   on_attach = on_attach,
    --   capabilities = capabilities
    -- })

    local lspconfig = require("lspconfig")
    mason_lsp.setup()

    local vue_typescript_plugin = require("mason-registry")
      .get_package("vue-language-server")
      :get_install_path() .. "/node_modules/@vue/language-server" .. "/node_modules/@vue/typescript-plugin"

    servers.vtsls.tsserver.globalPlugins[1].location =
      vue_typescript_plugin

    mason_lsp.setup_handlers({
      function(server)
        lspconfig[server].setup({
          capabilities = capabilities,
          settings = servers[server],
        })
      end,
      -- ["tsserver"] = function()
      --   local vue_typescript_plugin = require("mason-registry")
      --     .get_package("vue-language-server")
      --     :get_install_path() .. "/node_modules/@vue/language-server" .. "/node_modules/@vue/typescript-plugin"
      --
      --   lspconfig.tsserver.setup({
      --     capabilities = capabilities,
      --     init_options = {
      --       plugins = {
      --         {
      --           name = "@vue/typescript-plugin",
      --           location = vue_typescript_plugin,
      --           languages = {
      --             "javascript",
      --             "typescript",
      --             "javascriptreact",
      --             "typescriptreact",
      --             "vue",
      --           },
      --         },
      --       },
      --     },
      --     filetypes = {
      --       "javascript",
      --       "javascriptreact",
      --       "javascript.jsx",
      --       "typescript",
      --       "typescriptreact",
      --       "typescript.tsx",
      --       "vue",
      --     },
      --   })
      -- end,
      ["volar"] = function()
        -- local tsserver = require("mason-registry")
        --   .get_package("typescript-language-server")
        --   :get_install_path() .. "/node_modules/typescript/lib"
        lspconfig.volar.setup({
          capabilities = capabilities,
          init_options = {
            vue = {
              hybridMode = true
            }
            -- tsdk = tsserver,
          },
          settings = servers["volar"],
        })
      end,
    })

    -- lspconfig.volar.setup({
    --   capabilities = capabilities,
    -- init_options = {
    --   typescript = {
    --
    --     tsdk = tsserver,
    --   },
    -- },
    --   settings = servers["volar"],
    -- })

    require("lspconfig").gdscript.setup({
      capabilities = capabilities,
    })

    require("diagflow").setup({
      scope = "line",
      show_sign = true,
    })

    local tools = {
      "shfmt",
      "stylua",
      "prettierd",
      "gofumpt",
      "goimports-reviser",
      "golines",
      -- "csharpier",
    }

    for _, v in ipairs(vim.tbl_keys(servers)) do
      tools[#tools + 1] = v
    end

    require("mason-tool-installer").setup({
      ensure_installed = tools,
      auto_update = true,
    })
  end,
}
