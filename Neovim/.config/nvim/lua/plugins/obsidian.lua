return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  enabled = false,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = vim.fn.expand("~") .. "/Notes/"
        -- path = "/mnt/d/Notes/Personal/",
      },
    },
  },
  config = function(_, opts)
    require("obsidian").setup(opts)
  end,
}
