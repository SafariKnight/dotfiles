return {
  "mfussenegger/nvim-lint",
  event = "BufReadPre",
  config = function()
    require("lint").linters_by_ft = {
      markdown = { "vale" },
      -- javascript = { "eslint_d" },
      -- vue = { "eslint_d" },
      -- css = { "eslint_d" },
      -- html = { "eslint_d" },
    }
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
