return {
  "stevearc/conform.nvim",
  cmd = { "Format" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      sh = { "shfmt" },
      javascript = { { "prettierd" } },
      html = { { "prettierd" } },
      css = { { "prettierd" } },
      rust = { { "rustfmt" } },
      go = { "gofumpt", "goimports_reviser", "golines" },
    },
  },
}
