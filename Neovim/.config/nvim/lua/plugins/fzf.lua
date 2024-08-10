---@type LazySpec
return {
  "ibhagwan/fzf-lua",
  cmd = { "FzfLua" },
  -- Dependencies {{{
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "stevearc/dressing.nvim",
      opts = {
        input = {
          enabled = true,
        },
        select = {
          backend = { "fzf_lua" },
        },
      },
      init = function()
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.ui.select = function(...)
          require("lazy").load({ plugins = { "dressing.nvim" } })
          return vim.ui.select(...)
        end
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.ui.input = function(...)
          require("lazy").load({ plugins = { "dressing.nvim" } })
          return vim.ui.input(...)
        end
      end,
    },
  },
  -- }}}
  -- Keymaps {{{
  keys = function()
    local fzf = require("fzf-lua")

    return {
      {
        "<leader><space>",
        function()
          fzf.files({ cmd = "fd --type f"})
        end,
        desc = "Find File",
      },
      {
        "<leader>ff",
        function()
          fzf.files({ cmd = "fd --type f"})
        end,
        desc = "File",
      },
      {
        "<leader>fb",
        function()
          fzf.buffers()
        end,
        desc = "Buffer",
      },
      {
        "<leader>ft",
        function()
          fzf.grep_project()
        end,
        desc = "Text",
      },
      {
        "<leader>ft",
        function()
          fzf.grep_visual()
        end,
        desc = "Text",
        mode = { "v", "x" },
      },
      {
        "<leader>fh",
        function()
          fzf.helptags()
        end,
        desc = "Help",
      },
    }
  end,
  -- }}}

  opts = {
    previewers = {
      builtin = {
      },
    },
    winopts = {
      preview = {
        border = "noborder",
        vertical = "up:45%",
      },
    },
  },
}
