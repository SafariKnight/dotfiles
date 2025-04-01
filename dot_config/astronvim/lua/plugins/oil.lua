---@type LazySpec
return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>fm"] = { function() require("oil").open() end, desc = "File Manager" },
            ["<Leader>O"] = false,
          },
        },
      },
    },
  },
  opts = {
    default_file_explorer = true,
  },
}
