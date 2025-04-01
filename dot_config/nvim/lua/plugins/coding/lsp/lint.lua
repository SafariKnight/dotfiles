return {
  "mfussenegger/nvim-lint",
  events = { "BufWritePost", "BufReadPost", "InsertLeave" },
  opts = {
    linters_by_ft = {
      javascript = { "eslint" },
      typescript = { "eslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
      -- ['*'] = { 'global linter' },
      -- ['_'] = { 'fallback linter' },
    },
  },
  config = function(_, opts)
    require("lint").linters_by_ft = opts.linters_by_ft
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
