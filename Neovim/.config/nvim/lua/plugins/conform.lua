return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      sh = { 'shfmt' },
      javascript = { { 'prettierd' } },
      html = { { 'prettierd' } },
      css = { { 'prettierd' } },
      rust = { { 'rustfmt'} },
    },
  },
}
