local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = true },
      telemetry = { enable = false },
    },
  },
  rust_analyzer = {},
  gopls = {},
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

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', branch = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      { 'folke/neodev.nvim', opts = {} },

      -- Interaction between cmp and lspconfig
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local mason_lspconfig = require 'mason-lspconfig'
      local on_attach = require('core.lsp').on_attach
      local capabilities = require('core.lsp').capabilities

      require('mason').setup()
      -- Ensure the servers above are installed
      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          }
        end,
      }
    end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'LspAttach',
    dependencies = { 'neovim/nvim-lspconfig' },
    opts = function()
      local nls = require 'null-ls'
      local builtin = nls.builtins
      return {
        sources = {
          builtin.formatting.stylua,
          builtin.formatting.gofumpt,
          builtin.formatting.goimports_reviser,
          builtin.formatting.golines,
        },
      }
    end,
  },

  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'neovim/nvim-lspconfig' },
    cmd = { 'Trouble', 'TroubleToggle' },
    opts = {},
  },

  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
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
  {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    opts = {
      lightbulb = {
        enable = false,
      },
      symbol_in_winbar = {
        enable = false,
        separator = '  ',
      },
    },
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
      --Please make sure you install markdown and markdown_inline parser
      { 'nvim-treesitter/nvim-treesitter' },
    },
  },
}
