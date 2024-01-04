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
  emmet_ls = {},
}

return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Additional lua configuration, makes nvim stuff amazing!
      {
        'folke/neodev.nvim',
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
      'hrsh7th/cmp-nvim-lsp',
    },
    init = function()
      -- disable lsp watcher. Too slow on linux
      local ok, wf = pcall(require, 'vim.lsp._watchfiles')
      if ok then
        wf._watchfunc = function()
          return function() end
        end
      end
    end,
    config = function()
      local mason_lspconfig = require 'mason-lspconfig'
      local opts = require("core.lsp")

      require('mason').setup()
      -- Ensure the servers above are installed
      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          if server_name ~= 'jdtls' then
            require('lspconfig')[server_name].setup {
              capabilities = opts.capabilities,
              on_attach = opts.on_attach,
              settings = servers[server_name],
            }
          end
        end,
      }
      require('lspconfig').gdscript.setup({
        cmd = { 'ncat.exe', '127.0.0.1', '6005'},
        on_attach = opts.on_attach,
        capabilities = opts.capabilities,
      })

      -- require('lspconfig').jdtls.setup {
      --     on_attach = on_attach,
      --     capabilities = capabilities,
      -- }
      for name, icon in pairs(require('core.icons').diagnostics) do
        name = 'DiagnosticSign' .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = '' })
      end
    end,
  },
  -- builtin.formatting.stylua,
  --
  -- -- don't ask why go gets 3 formatters
  -- builtin.formatting.gofumpt,
  -- builtin.formatting.goimports_reviser,
  -- builtin.formatting.golines,
  --
  -- -- don't bully me pls
  -- builtin.formatting.google_java_format,
  --
  -- -- I can't stay on one thing can I?
  -- builtin.formatting.prettierd.with {
  --     extra_args = { '--tab-width', '4' },
  -- },
  {
    'folke/trouble.nvim',
    dependencies = {
      -- 'nvim-tree/nvim-web-devicons',
      'neovim/nvim-lspconfig',
    },
    cmd = { 'Trouble', 'TroubleToggle' },
    opts = {},
  },
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'prettierd',
        'shfmt',
        'stylua',
      },
    },
    config = function(_, opts)
      vim.api.nvim_create_user_command('MasonInstallAll', function()
        vim.cmd('MasonInstall ' .. table.concat(opts.ensure_installed, ' '))
      end, {})
    end,
  },
}
