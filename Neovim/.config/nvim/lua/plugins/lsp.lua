local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = true },
      telemetry = { enable = false },
    },
  },
  rust_analyzer = {},
  tsserver = {},
  html = {},
  cssls = {},
  emmet_language_server = {},
}

return {
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      {
        "folke/neodev.nvim",
        opts = {},
      },

      -- Interaction between cmp and lspconfig
      "hrsh7th/cmp-nvim-lsp",
    },
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
      local mason_lspconfig = require("mason-lspconfig")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      require("mason").setup()
      -- require("lspconfig").lua_ls.setup({
      --   capabilities = capabilities,
      -- })
      mason_lspconfig.setup({
        -- Ensure the servers above are installed
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
              settings = servers[server_name],
            })
          end,
          -- ["tsserver"] = function ()
          --   require("lspconfig").tsserver.setup({
          --     capabilities = capabilities,
          --     settings = servers.tsserver,
          --     handlers = {
          --       ["textDocument/publishDiagnostics"] = function() end,
          --     }
          --   })
          -- end
        },
      })
      -- require('lspconfig').gdscript.setup({
      --   cmd = { 'ncat.exe', '127.0.0.1', '6005'},
      --   on_attach = opts.on_attach,
      --   capabilities = capabilities,
      -- })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
        "eslint_d",
        "shfmt",
        "stylua",
        "gofumpt",
        "goimports_reviser",
        "golines",
      },
    },
    config = function(_, opts)
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
      end, {})
    end,
  },
}
