return { -- Formatting
  "stevearc/conform.nvim",
  -- cmd = { "Format" },
  init = function()
    vim.api.nvim_create_user_command("Format", function(_)
      require("conform").format()
    end, { desc = "Format buffer" })
    map("n", "<leader>cf", vim.cmd.Format, { desc = "Format" })
  end,
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
