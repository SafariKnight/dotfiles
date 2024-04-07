return {
  "nvim-treesitter/nvim-treesitter",
  -- event = "VeryLazy", -- Suprised that this works well
  main = 'nvim-treesitter.configs',
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    { "nvim-treesitter/nvim-treesitter-context", opts = {} },
  },
  init = function(plugin)
    -- Taken from LazyVim
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")
  end,
  opts = {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "html", "css", "scss" },
    highlight = { enable = true },
    indent = { enable = true },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        },
      },
    }
  }
}
