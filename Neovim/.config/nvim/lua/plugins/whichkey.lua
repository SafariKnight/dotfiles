return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        key_labels = {
          ["<leader>"] = "SPACE",
          ["<space>"] = "SPACE"
        }
      })

      require("which-key").register({
        mode = { "n", "v" },
        ["<leader>l"] = { name = "+LSP" },
        ["<leader>lw"] = { name = "+Workspace" },
        ["<leader>ls"] = { name = "+Symbol" },
        ["<leader>lL"] = { name = "+Plugin" },
        ["<leader>h"] = { name = "+Harpoon" },
      })
    end,
  },
}
