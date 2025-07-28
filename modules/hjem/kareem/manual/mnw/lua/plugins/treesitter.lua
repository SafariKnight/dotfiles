vim.filetype.add {
  extension = {
    html = function(path)
      if string.match(path, "[/\\]src[/\\]index.html$") then
        return "html"
      end

      local angular_json_path = vim.fs.find({ "angular.json" }, {
        upward = true,
        path = vim.fs.dirname(path),
        stop = vim.env.HOME,
      })

      if not vim.tbl_isempty(angular_json_path) then
        return "htmlangular"
      end

      return "html"
    end,
  },
}
return {
  "nvim-treesitter",
  event = "DeferredUIEnter",
  -- lazy = false,
  after = function()
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup {
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
    }
  end,
}
