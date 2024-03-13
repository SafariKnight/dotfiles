local servers = {
  lua_ls = {
    Lua = {
      telemetry = { enable = false },
      runtime = {
        version = "Lua 5.4",
        pathstrict = true,
        path = {
          "?.lua",
          "?/init.lua",
          vim.fn.expand("~/.luarocks/share/lua/5.4/?.lua"),
          vim.fn.expand("~/.luarocks/share/lua/5.4/?/init.lua"),
          -- linuxbrew_home .. "share/lua/5.4/?.lua",
          -- linuxbrew_home .. "share/lua/5.4/?/init.lua",
          -- "/usr/share/5.3/?.lua",
          -- "/usr/share/lua/5.3/?/init.lua",
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          "~/.luarocks/share/lua/5.4",
        },
      },
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

      -- Additional lua configuration, makes nvim stuff amazing!
      {
        "folke/neodev.nvim",
        opts = {
          library = {
            enabled = true,
            plugins = true,
            types = true,
            runtime = true,
          },
          setup_jsonls = true,
          lspconfig = true,
          pathstrict = true,
        },
      },

      -- Interaction between cmp and lspconfig
      "hrsh7th/cmp-nvim-lsp",
    },
    init = function()
      -- disable lsp watcher. Too slow on linux
      local ok, wf = pcall(require, "vim.lsp._watchfiles")
      if ok then
        wf._watchfunc = function()
          return function() end
        end
      end
    end,
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      require("mason").setup()
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
