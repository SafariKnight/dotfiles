---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local builtins = require("null-ls").builtins

    -- Builtins:
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/

    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      builtins.formatting.stylua,
      builtins.formatting.prettier,
      builtins.formatting.gofumpt,
      builtins.formatting.goimports_reviser,
      builtins.formatting.golines,
      builtins.formatting.shfmt,
    })
  end,
}
