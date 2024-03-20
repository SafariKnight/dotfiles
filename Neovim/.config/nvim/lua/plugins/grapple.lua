return {
  "cbochs/grapple.nvim",
  opts = {
    scope = "git", -- also try out "git_branch"
    icons = true, -- setting to "true" requires "nvim-web-devicons"
    status = true,
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<A-a>", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
    { "<A-u>", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

    { "<A-n>", "<cmd>Grapple select index=1<cr>", desc = "Grapple to First tag" },
    { "<A-e>", "<cmd>Grapple select index=2<cr>", desc = "Grapple to Second tag" },
    { "<A-i>", "<cmd>Grapple select index=3<cr>", desc = "Grapple to Third tag" },
    { "<A-o>", "<cmd>Grapple select index=4<cr>", desc = "Grapple to Forth tag" },

    { "<leader>xg", "<cmd>Grapple quickfix<cr>", desc = "Grapple Tags" },

    {
      "[g",
      "<cmd>Grapple cycle backward<cr>",
      desc = "Go to previous tag",
    },
    { "]g", "<cmd>Grapple cycle forward<cr>", desc = "Go to next tag" },
  },
}
