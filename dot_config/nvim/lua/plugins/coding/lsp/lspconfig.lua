---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNew" },
    opts = {
      custom_servers = { -- Servers that need more than lspconfig[server].setup()
        "ts_ls",
        "volar",
      },
      servers = {
        lua_ls = require("plugins.coding.lsp.servers.lua_ls"),
        gdscript = {},
        basedpyright = {
          settings = {
            basedpyright = {
              disableOrganizeImports = true,
              analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { "*" },
              },
            },
          },
        },
        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          -- init_options = {
          --   settings = {
          --     lint = {
          --       enable = false;
          --     },
          --   },
          -- },
        },
        markdown_oxide = {},
        gopls = {},
        nixd = {},
        nil_ls = {},
        tailwindcss = {},
        cssls = {},
        html = {},
        emmet_language_server = {},
        svelte = {},
      },
    },
    init = function()
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = require("config.icons").diagnostics.BoldError,
            [vim.diagnostic.severity.WARN] = require("config.icons").diagnostics.BoldWarning,
            [vim.diagnostic.severity.HINT] = require("config.icons").diagnostics.BoldHint,
            [vim.diagnostic.severity.INFO] = require("config.icons").diagnostics.BoldInformation,
          },
        },
      })
    end,
    config = function(_, opts)
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(_, buffer)
          local map = function(mode, lhs, rhs, options)
            options = vim.tbl_deep_extend("force", options, { buffer = buffer })
            vim.keymap.set(mode, lhs, rhs, options)
          end

          map("n", "gd", vim.lsp.buf.definition, { desc = "Go to declaration" })
          map(
            "n",
            "gs",
            vim.lsp.buf.signature_help,
            { desc = "Signature Help" }
          )

          map(
            { "n", "v", "x" },
            "<localleader>lr",
            vim.lsp.buf.code_action,
            { desc = "Code Action" }
          )
          map(
            "n",
            "<localleader>ln",
            vim.lsp.buf.rename,
            { desc = "Rename Symbol" }
          )
          map("n", "<localleader>lf", function()
            require("conform").format({ async = true })
          end, { desc = "Format" })

          map(
            "n",
            "<localleader>ls",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            { desc = "Symbols (Trouble)" }
          )
          map(
            "n",
            "<localleader>ld",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            { desc = "Definitions / References / ... (Trouble)" }
          )
          map(
            "n",
            "<localleader>lX",
            "<cmd>Trouble diagnostics toggle<cr>",
            { desc = "Workspace Diagnostics (Trouble)" }
          )
          map(
            "n",
            "<localleader>lx",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            { desc = "Document Diagnostics (Trouble)" }
          )
        end,
      })

      local lspconfig = require("lspconfig")
      local lspconfig_defaults = lspconfig.util.default_config
      lspconfig_defaults.capabilities =
        require("blink.cmp").get_lsp_capabilities(
          lspconfig_defaults.capabilities
        )
      lspconfig_defaults.capabilities.textDocument.completion.completionItem.snippetSupport =
        true

      for server, config in pairs(opts.servers) do
        lspconfig[server].setup(config)
      end

      for _, server in ipairs(opts.custom_servers) do
        require("plugins.coding.lsp.servers." .. server)
      end
    end,
  },
}
