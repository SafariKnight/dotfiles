---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  dependencies = {
    "ThePrimeagen/refactoring.nvim",
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
  enabled = false,
  opts = function()
    local null_ls = require("null-ls")
    local builtin = null_ls.builtins
    return {
      sources = {
        -- builtin.formatting.treefmt,
        builtin.formatting.stylua,
        builtin.formatting.shfmt,
        builtin.formatting.prettier,
        builtin.formatting.nixfmt,

        builtin.formatting.gofumpt,
        builtin.formatting.goimports_reviser,
        builtin.formatting.golines,

        -- require("none-ls.diagnostics.eslint"),
        builtin.completion.spell,

        builtin.code_actions.refactoring,
      },
    }
  end,
}
