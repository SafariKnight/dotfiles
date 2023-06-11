return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = {"BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "javascript", "typescript" },
    hightlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
  },
  config = function (_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
