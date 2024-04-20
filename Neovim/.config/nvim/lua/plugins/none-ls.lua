return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "ThePrimeagen/refactoring.nvim"
  },
  opts = function()
    local null_ls = require("null-ls")
    local builtin = null_ls.builtins
    return {
      sources = {
        builtin.formatting.stylua,
        builtin.formatting.shfmt,
        builtin.formatting.prettierd,
        builtin.formatting.csharpier,

        -- builtin.completion.spell,

        builtin.code_actions.refactoring
      }
    }
  end,
}
