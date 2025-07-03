return {
  "nvim-treesitter",
  event = "DeferredUIEnter",
  -- lazy = false,
  after = function()
    -- require("nvim-treesitter.query_predicates")
    require("nvim-treesitter.configs").setup({
      ensure_install = {},
      ignore_install = {},
      auto_install = false,
      sync_install = false,
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      indent = { enable = true, disable = { "html" } },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = {
              query = "@class.inner",
              desc = "Select inner part of a class region",
            },
          },
        },
      },
    })
  end,
}
