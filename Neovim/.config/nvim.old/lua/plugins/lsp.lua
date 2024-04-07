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

      { "folke/neodev.nvim", opts = {} },
      { "folke/neoconf.nvim", opts = {} },

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
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

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
        },
      })
      -- Why doesn't mason-lspconfig have this?
      require("lspconfig").css_variables.setup({
        capabilities = capabilities,
      })
      vim.api.nvim_create_autocmd({ "LspAttach" }, {
        group = vim.api.nvim_create_augroup("LspOnAttach", { clear = true }),
        callback = function(e)
          local bufnr = e.buf
          vim.keymap.set(
            "n",
            "<leader>cr",
            vim.lsp.buf.rename,
            { desc = "Rename", buffer = bufnr }
          )
          vim.keymap.set(
            "n",
            "<leader>ca",
            vim.lsp.buf.code_action,
            { desc = "Code Action", buffer = bufnr }
          )
          vim.keymap.set(
            "n",
            "K",
            vim.lsp.buf.hover,
            { desc = "Hover", buffer = bufnr }
          )
          vim.keymap.set(
            "n",
            "gd",
            vim.lsp.buf.definition,
            { desc = "Goto Definition", buffer = bufnr }
          )
          vim.keymap.set(
            "n",
            "gD",
            vim.lsp.buf.declaration,
            { desc = "Goto Declaration", buffer = bufnr }
          )
        end,
      })
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
