return {
  {
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat",
    },
    config = function()
      require("leap").create_default_mappings()
    end,
    keys = function()
      local ret = {}
      for _, key in ipairs({ "s", "S", "gs" }) do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
  },
  {
    "ggandor/flit.nvim",
    dependencies = {
      "ggandor/leap.nvim",
      "tpope/vim-repeat",
    },
    config = function()
      require("flit").setup({
        keys = {
          f = "f",
          F = "F",
          t = "t",
          T = "T",
        },
      })
    end,
    keys = function()
      local ret = {}
      for _, key in ipairs({ "f", "F", "t", "T" }) do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
  },
  {
    "rasulomaroff/telepath.nvim",
    dependencies = "ggandor/leap.nvim",
    enabled = true,
    lazy = false,
    config = function()
      require("telepath").use_default_mappings()
    end,
  },
}
